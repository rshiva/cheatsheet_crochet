class AddInstructionToCheatSheet < ActiveRecord::Migration[6.0]
  def change
    add_column :cheat_sheets, :instruction, :text
  end
end
