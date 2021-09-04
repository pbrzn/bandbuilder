class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :type
      t.string :name
      t.string :email
      t.string :password_digest
      t.text :bio
      t.float :pay_rate
      t.integer :instrument_id

      t.timestamps
    end
  end
end
