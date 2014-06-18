class Transposition < ActiveRecord::Base
  belongs_to :user
  belongs_to :chord
end
