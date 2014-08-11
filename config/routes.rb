UkeNote::Application.routes.draw do
  devise_for :users
  resources :chords do
    resource :chord_setting, :only => [] do
      post 'key/:key' => 'transpositions#select', as: :select
      post 'type/:type' => 'transpositions#display_chord', as: :display_chord
    end
  end

  root 'chords#index'
end
