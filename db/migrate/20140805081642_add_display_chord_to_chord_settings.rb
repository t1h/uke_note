class AddDisplayChordToChordSettings < ActiveRecord::Migration
  def change
    add_column :chord_settings, :display_chord, :string, :default => 'ukulele'
  end
end
