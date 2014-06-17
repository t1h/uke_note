module ChordsHelper
  def chord_image(chord)
    if chord.nil?
      "/chord/blank.png"
    else
      "/chord/" + chord.to_s.gsub('#', 's').gsub('/', 'on') + ".png"
    end
  end
end
