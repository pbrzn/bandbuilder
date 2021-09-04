class CreateGigMusicians < ActiveRecord::Migration[6.1]
  def change
    create_table :gig_musicians do |t|
      t.integer :gig_id
      t.integer :musician_id

      t.timestamps
    end
  end
end
