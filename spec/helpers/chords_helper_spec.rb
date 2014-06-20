require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the DeliveryInfosHelper. For example:
#
# describe DeliveryInfosHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe ChordsHelper do
  context "chord_image は与えられたコードの画像URLを戻す" do
    it "通常コード" do
      expect(chord_image("C")).to eq '<img alt="C" src="/images/chords/C.png" />'
    end
    it "コードなし" do
      expect(chord_image(nil)).to eq '<img alt="" src="/images/chords/blank.png" />'
    end
    it "#を含むコード" do
      expect(chord_image("G#")).to eq '<img alt="G#" src="/images/chords/Gs.png" />'
    end
    it "onコード" do
      expect(chord_image("Bm/F")).to eq '<img alt="Bm/F" src="/images/chords/BmonF.png" />'
    end
  end
  context "コードを移調する" do
    it "移調なし" do
      expect(transpose_chord("C", 0)).to eq "C"
    end
    it "+1 する" do
      expect(transpose_chord("C", 1)).to eq "Db"
    end
    it "-1 する" do
      expect(transpose_chord("C", -1)).to eq "B"
    end
    it "コードの配列の右端から+1" do
      expect(transpose_chord("B", 1)).to eq "C"
    end
    it "コードの配列の右端を越えて+5" do
      expect(transpose_chord("Bb", 5)).to eq "Eb"
    end
    it "コードの配列の左端を越えて-5" do
      expect(transpose_chord("C#", -5)).to eq "Ab"
    end
    it "コードネームの変換" do
      expect(transpose_chord("Csus", 1)).to eq "Dbsus"
    end
    it "オンコードの変換" do
      expect(transpose_chord("B/F", 1)).to eq "C/Gb"
    end
  end
end
