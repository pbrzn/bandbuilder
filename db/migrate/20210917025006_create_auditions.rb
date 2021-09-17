class CreateAuditions < ActiveRecord::Migration[6.1]
  def change
    create_table :auditions do |t|
      t.integer :gig_id
      t.integer :musician_id

      t.timestamps
    end
  end
end
