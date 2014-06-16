json.array!(@chords) do |chord|
  json.extract! chord, :id, :contents
  json.url chord_url(chord, format: :json)
end
