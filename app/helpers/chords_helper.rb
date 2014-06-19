module ChordsHelper
  def chord_image(chord)
    if chord.nil? || chord == ''
      image_tag "chords/blank.png"
    else
      image_tag "chords/" + chord.to_s.gsub('#', 's').gsub('/', 'on') + ".png"
    end
  end

  def transpose_chord(chord, number)
    TransposeChords::Chord.transpose([chord.to_s]).capo(number)[0]
  end
end
