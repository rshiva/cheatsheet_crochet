class CreateMasterStitches < ActiveRecord::Migration[6.0]
  def change
    create_table :master_stitches do |t|
      t.string :name

      t.timestamps
    end
  end
end
