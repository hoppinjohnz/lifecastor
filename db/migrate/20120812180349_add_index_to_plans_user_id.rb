class AddIndexToPlansUserId < ActiveRecord::Migration
  def change
    add_index :plans, [:user_id, :created_at]  
  end
end
