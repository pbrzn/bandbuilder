class CreateGigs < ActiveRecord::Migration[6.1]
  def change
    create_table :gigs do |t|
      t.integer :music_director_id
      t.integer :genre_id
      t.string :title
      t.text :description
      t.string :location
      t.datetime :start_date
      t.datetime :end_date
      t.float :budget

      t.timestamps
    end
  end
end
