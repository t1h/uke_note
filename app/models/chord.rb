class Chord < ActiveRecord::Base
  belongs_to :user
  has_many :transpositions

  validates :title, presence: true
  validates :contents, presence: true

  def self.make_chord_lyric_pairs(song)
    lines = []
    song[:song].each{|l|
      line = []
      pair = {}
      next unless l[:line]
      l[:line].each{|contents|
        if contents[:chord]
          if {} != pair
            line.push pair
          end
          pair = {}
          pair[:chord] = contents[:chord]
        else
          pair[:lyric] = contents[:lyric]
        end
      }
      if {} != pair
        line.push pair
      end
      if {} != line
        lines.push line
      end
    }

    lines
  end

  def key_by_user(user)
    transposition = self.transpositions.find_by_user_id(user)
    transposition.try(:key) || 0
  end

  def parsed_contents
    self.class.make_chord_lyric_pairs(Chordpro::Parser.new.parse(self.contents))
  end
end
