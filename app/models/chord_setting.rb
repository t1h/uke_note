class ChordSetting < ActiveRecord::Base
  DISPLAY_TYPES = {'ukulele' => 'ウクレレ', 'blank' => 'なし'}

  belongs_to :user
  belongs_to :chord

  validates_numericality_of :key, only_integer: true, greater_than_or_equal_to: -5, less_than_or_equal_to: 5
  validates :display_chord, inclusion: { in: DISPLAY_TYPES.keys }
end
