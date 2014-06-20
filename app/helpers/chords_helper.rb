module ChordsHelper
  def chord_image(chord)
    if chord.nil? || chord == ''
      image_tag "chords/blank.png", alt: ""
    else
      image_tag "chords/" + chord.to_s.gsub('#', 's').gsub('/', 'on') + ".png", alt: chord
    end
  end

  def transpose_chord(chord, number)
    chords = TransposeChords::Chord.transpose([chord.to_s]).capo(number)
    chords[0] unless chords.nil?
  end
end
