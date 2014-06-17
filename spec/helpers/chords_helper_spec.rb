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
end
