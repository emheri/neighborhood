class CreateNeighborhoods < ActiveRecord::Migration[7.0]
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.float :radius

      t.timestamps
    end
    # postgres extensions
    enable_extension 'cube'
    enable_extension 'earthdistance'
  end
end
