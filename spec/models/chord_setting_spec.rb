require 'spec_helper'

describe ChordSetting do
  it "key の範囲は +5 〜 -5 であれば OK" do
    expect(ChordSetting.new(key: 5)).to be_valid
    expect(ChordSetting.new(key: -5)).to be_valid
  end
  it "key の範囲は +5 〜 -5 でなければ NG" do
    expect(ChordSetting.new(key: 6)).to have(1).errors_on(:key)
    expect(ChordSetting.new(key: -6)).to have(1).errors_on(:key)
  end
end
