require 'spec_helper'

Warden.test_mode!

feature 'Transposition management' do
  scenario "+5〜-5の範囲内へは移調できる" do
    user = create(:user)
    login_as(user, :scope => :user)
    chord = create(:chord)

    visit chord_path(chord)
    expect(page).to have_content /移調: 0/
    click_link '+5'
    #page.driver.post(select_chord_transposition_path(chord, 5))
    expect(page).to have_content /移調: \+5/
    click_link '-5'
    #page.driver.post('/chords/1/transposition/-5')
    expect(page).to have_content /移調: \-5/
  end
end
