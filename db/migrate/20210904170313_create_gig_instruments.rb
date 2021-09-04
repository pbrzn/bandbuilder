class CreateGigInstruments < ActiveRecord::Migration[6.1]
  def change
    create_table :gig_instruments do |t|
      t.integer :gig_id
      t.integer :instrument_id

      t.timestamps
    end
  end
end
