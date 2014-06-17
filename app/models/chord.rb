class Chord < ActiveRecord::Base
  belongs_to :user

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

end
