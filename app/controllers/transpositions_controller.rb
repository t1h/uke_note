class TranspositionsController < ApplicationController
  before_action :authenticate_user!, :set_chord

  def select
    chord_setting = @chord.chord_settings.find_or_initialize_by(user: current_user)
    chord_setting.key = params[:key]
    chord_setting.save!

    redirect_to @chord
  end

  private
    def set_chord
      @chord = current_user.chords.find(params[:chord_id])
    end
end
