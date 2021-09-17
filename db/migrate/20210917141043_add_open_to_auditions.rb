class AddOpenToAuditions < ActiveRecord::Migration[6.1]
  def change
    add_column :auditions, :open, :boolean, default: true
  end
end
