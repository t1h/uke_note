class AddUserToChords < ActiveRecord::Migration
  def change
    add_reference :chords, :user, index: true
  end
end
