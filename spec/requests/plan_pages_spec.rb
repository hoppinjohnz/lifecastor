require 'spec_helper'

describe "PlanPages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "plan creation" do
    before { visit root_path }

    describe "with no fill in" do
      it "should not create a plan" do
        expect { click_button "Post" }.should_not change(Plan, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') } 
      end
    end

    describe "with valid a fill in" do
      before { fill_in 'plan_income', with: 123456789.0 }
      it "should create a plan" do
        expect { click_button "Post" }.should change(Plan, :count).by(1)
      end
    end
  end

  describe "plan destruction" do
    before { FactoryGirl.create(:plan, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a plan" do
        expect { click_link "delete" }.should change(Plan, :count).by(-1)
      end
    end
  end
end
