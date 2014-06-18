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
      expect(chord_image("C")).to eq "/chord/C.png"
    end
    it "コードなし" do
      expect(chord_image(nil)).to eq "/chord/blank.png"
    end
    it "#を含むコード" do
      expect(chord_image("G#")).to eq "/chord/Gs.png"
    end
    it "onコード" do
      expect(chord_image("Bm/F")).to eq "/chord/BmonF.png"
    end
  end
  context "コードを移調する" do
    it "移調なし" do
      expect(transpose_chord("C", 0)).to eq "C"
    end
    it "+1 する" do
      expect(transpose_chord("C", 1)).to eq "C#"
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
      expect(transpose_chord("C#", -5)).to eq "G#"
    end
  end
end
