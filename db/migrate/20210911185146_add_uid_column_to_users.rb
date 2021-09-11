class AddUidColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :uid, :integer
  end
end
