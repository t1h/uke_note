UkeNote::Application.routes.draw do
  devise_for :users
  resources :chords do
    resource :transposition, :only => [] do
      post ':key' => 'transpositions#select', as: :select
    end
  end

  root 'chords#index'
end
