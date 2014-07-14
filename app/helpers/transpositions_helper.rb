module TranspositionsHelper
  def key_sign(key)
    key == 0 ? 0 : sprintf("%+d", key)
  end
end
