class CreateCapthurits < ActiveRecord::Migration
  def change
    create_table :capthurits do |t|
      t.string :filename
      t.string :stationname
      t.datetime :capthurstart

      t.timestamps
    end
  end
end
