class CreateTranspositions < ActiveRecord::Migration
  def change
    create_table :transpositions do |t|
      t.references :user, index: true
      t.references :chord, index: true
      t.integer :key, default: 0

      t.timestamps
    end
  end
end
