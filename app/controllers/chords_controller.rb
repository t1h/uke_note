class ChordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chord, only: [:show, :edit, :update, :destroy]

  def index
    @chords = current_user.chords
  end

  def show
    @chord_setting = @chord.chord_setting_by_user(current_user)
  end

  def new
    @chord = current_user.chords.build
  end

  def edit
  end

  def create
    @chord = current_user.chords.build(chord_params)

    respond_to do |format|
      if @chord.save
        format.html { redirect_to @chord, notice: 'コードを作成しました' }
        format.json { render action: 'show', status: :created, location: @chord }
      else
        format.html { render action: 'new' }
        format.json { render json: @chord.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @chord.update(chord_params)
        format.html { redirect_to @chord, notice: 'コードを更新しました' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @chord.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @chord.destroy
    respond_to do |format|
      format.html { redirect_to chords_url }
      format.json { head :no_content }
    end
  end

  private
    def set_chord
      @chord = current_user.chords.find(params[:id])
    end

    def chord_params
      params.require(:chord).permit(:contents, :title, :memo)
    end
end
