class TranspositionsController < ApplicationController
  before_action :authenticate_user!, :set_chord

  def select
    transposition = @chord.transpositions.find_or_initialize_by(user: current_user)
    transposition.key = params[:key]
    transposition.save!

    redirect_to @chord
  end

  private
  def set_chord
    @chord = current_user.chords.find(params[:chord_id])
  end
end
