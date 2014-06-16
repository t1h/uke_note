class CreateChords < ActiveRecord::Migration
  def change
    create_table :chords do |t|
      t.text :contents

      t.timestamps
    end
  end
end
