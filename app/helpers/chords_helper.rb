module ChordsHelper
  def chord_image(chord)
    if chord.nil?
      "/chord/blank.png"
    else
      "/chord/" + chord.to_s.gsub('#', 's').gsub('/', 'on') + ".png"
    end
  end

  def transpose_chord(chord, number)
    TransposeChords::Chord.transpose([chord.to_s]).capo(number)[0]
  end
end
