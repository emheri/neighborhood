class CreateNeighborhoodFlats < ActiveRecord::Migration[7.0]
  def change
    create_table :neighborhood_flats do |t|
      t.belongs_to :flat
      t.belongs_to :neighborhood

      t.timestamps
    end
  end
end
