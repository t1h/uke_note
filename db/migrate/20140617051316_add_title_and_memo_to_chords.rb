class AddTitleAndMemoToChords < ActiveRecord::Migration
  def change
    add_column :chords, :title, :string
    add_column :chords, :memo, :text
  end
end
