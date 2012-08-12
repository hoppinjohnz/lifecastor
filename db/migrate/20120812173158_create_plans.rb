class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.decimal :income
      t.decimal :increase_mean
      t.decimal :increase_sd
      t.decimal :expense_mean
      t.decimal :expense_sd
      t.integer :user_id

      t.timestamps
    end
  end
end
