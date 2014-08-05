class RenameTranspositionsToChordSettings < ActiveRecord::Migration
  def change
    rename_table :transpositions, :chord_settings
  end
end
