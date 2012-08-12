class Plan < ActiveRecord::Base
  attr_accessible :expense_mean, :expense_sd, :income, :increase_mean, :increase_sd
  belongs_to :user

  validates :income, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => { :greater_than => 0, :less_than => 1000000000 }
  validates :user_id, presence: true

  default_scope order: 'plans.created_at DESC'
end
