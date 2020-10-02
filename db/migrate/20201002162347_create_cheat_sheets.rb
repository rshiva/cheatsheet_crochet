class CreateCheatSheets < ActiveRecord::Migration[6.0]
  def change
    create_table :cheat_sheets do |t|
      t.string :title

      t.timestamps
    end
  end
end
