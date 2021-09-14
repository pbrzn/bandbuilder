class ChangeUidDatatypeBlobToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :uid, :blob
  end
end
