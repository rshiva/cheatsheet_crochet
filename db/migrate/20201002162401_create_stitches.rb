class CreateStitches < ActiveRecord::Migration[6.0]
  def change
    create_table :stitches do |t|
      # t.references :master_stitch, null: false, foreign_key: true
      t.integer :total_stitch
      t.references :cheat_sheet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
