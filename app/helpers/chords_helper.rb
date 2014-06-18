module ChordsHelper
  def chord_image(chord)
    if chord.nil?
      "/chord/blank.png"
    else
      "/chord/" + chord.to_s.gsub('#', 's').gsub('/', 'on') + ".png"
    end
  end
  def transpose_chord(chord, number)
    return chord if number == 0

    chords = [
      'C', 'C#', 'D', 'Eb', 'E', 'F',
      'F#', 'G', 'G#', 'A', 'Bb', 'B'
    ]
    current_index = chords.index(chord)
    transposed_index = current_index + number

    if transposed_index > chords.size - 1
      chords[transposed_index - chords.size]
    else
      chords[transposed_index]
    end
  end
end
