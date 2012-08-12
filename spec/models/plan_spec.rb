require 'spec_helper'

describe Plan do
  let(:user) { FactoryGirl.create(:user) }
  before { @plan = user.plans.build(income: 90000.0) }

  subject { @plan }

  it { should respond_to(:income) }
  it { should respond_to(:user_id) }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Plan.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "when user_id is not present" do
    before { @plan.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank income" do
    before { @plan.income = " " }
    it { should_not be_valid }
  end
  describe "with income that is too small" do
    before { @plan.income = -1.0 }
    it { should_not be_valid }
  end
  describe "with income that is too great" do
    before { @plan.income = 1000000001.0 } # one billion
    it { should_not be_valid }
  end

end
