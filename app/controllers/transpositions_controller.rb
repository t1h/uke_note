class TranspositionsController < ApplicationController
  def change
    current_transposition = current_user.transpositions.find_by_chord_id(params[:chord_id])
    current_transposition ||= Transposition.new(user_id: current_user.id, chord_id: params[:chord_id])
    current_transposition.key = current_transposition.key + params[:key].to_i
    current_transposition.save

    redirect_to chord_path(params[:chord_id])
  end
end
