require 'spec_helper'
require "chordpro/parser"

describe Chord do

  context "normal case." do
    it "aaaaa" do
      expect("aaa").to eq "aaa"
    end
    it "chord test first line" do
      s = Chordpro::Parser.new.parse("You make me [C]happy when skies are [G]gray")
      expect(s[:song][0][:line][0][:lyric]).to eq "You make me "
      expect(s[:song][0][:line][3][:chord]).to eq "G"
    end

  end
end
