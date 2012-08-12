class Plan < ActiveRecord::Base
  attr_accessible :expense_mean, :expense_sd, :income, :increase_mean, :increase_sd
  belongs_to :user

  validates :user_id, presence: true

  default_scope order: 'plans.created_at DESC'
end
