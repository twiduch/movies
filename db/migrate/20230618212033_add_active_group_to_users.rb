class AddActiveGroupToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :active_group_id, :bigint
  end
end
