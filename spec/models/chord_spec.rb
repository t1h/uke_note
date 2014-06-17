require 'spec_helper'
require "chordpro/parser"

describe Chord do

  context "DB入出力" do
    it "入力のChordPro形式をParseしてDBへ保存" do
      s = Chordpro::Parser.new.parse("You make me [C]happy when skies are [G]gray")
      expect(s[:song][0][:line][0][:lyric]).to eq "You make me "
    end
  end

  context "ChordPro Parse結果の整形" do
    it "chord test first line" do
      s = Chordpro::Parser.new.parse("You make me [C]happy when skies are [G]gray")
      expect(s[:song][0][:line][0][:lyric]).to eq "You make me "
      expect(s[:song][0][:line][3][:chord]).to eq "G"
    end
    it "create chord lyric pairs one lines." do
      s = Chordpro::Parser.new.parse("もしもし[G7]かめよ[Am]かめさん[C]よ")

      pairs = Chord.make_chord_lyric_pairs(s)
      expect(pairs[0][0][:chord]).to eq nil
      expect(pairs[0][0][:lyric]).to eq "もしもし"
      expect(pairs[0][1][:chord]).to eq "G7"
      expect(pairs[0][3][:lyric]).to eq "よ"

    end
    it "create chord lyric pairs one lines.コードから" do
      s = Chordpro::Parser.new.parse("[C]もしもし[G7]かめよ[Am]かめさん[C]よ")

      pairs = Chord.make_chord_lyric_pairs(s)
      expect(pairs[0][0][:chord]).to eq "C"
      expect(pairs[0][0][:lyric]).to eq "もしもし"
      expect(pairs[0][1][:chord]).to eq "G7"
      expect(pairs[0][3][:lyric]).to eq "よ"

    end
    it "create chord lyric pairs two lines" do
      s = Chordpro::Parser.new.parse("もしもし[G7]かめよ[Am]かめさん[C]よ\n[C]せかいの[Am]うちで[F]おま[G7]えほ[C]ど")

      pairs = Chord.make_chord_lyric_pairs(s)
      expect(pairs[0][0][:chord]).to eq nil
      expect(pairs[0][0][:lyric]).to eq "もしもし"
      expect(pairs[0][1][:chord]).to eq "G7"
      expect(pairs[0][3][:lyric]).to eq "よ"
      expect(pairs[1][0][:chord]).to eq "C"
    end
    it "directive があってもエラーにならない" do
      s = Chordpro::Parser.new.parse("{title:うさぎとかめ}\nもしもし[G7]かめよ[Am]かめさん[C]よ")

      pairs = Chord.make_chord_lyric_pairs(s)
      expect(pairs[0][0][:lyric]).to eq "もしもし"
    end
  end
end
