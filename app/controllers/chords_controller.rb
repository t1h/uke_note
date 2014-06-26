class ChordsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_current_user!, only: [:show, :edit, :update, :destroy]
  before_action :set_chord, only: [:show, :edit, :update, :destroy]

  def index
    @chords = current_user.chords
  end

  def show
    @parsed_contents = Chord.make_chord_lyric_pairs(Chordpro::Parser.new.parse(@chord.contents))
    chord = current_user.transpositions.find_by_chord_id(params[:id])
    if chord.nil?
      @key = 0
    else
      @key = chord.key
    end

  end

  def new
    @chord = Chord.new
  end

  def edit
  end

  def create
    @chord = Chord.new(chord_params.merge(user_id: current_user.id))

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
      @chord = Chord.find(params[:id])
    end

    def chord_params
      params.require(:chord).permit(:contents, :title, :memo)
    end

    def authenticate_current_user!
      chord = Chord.find(params[:id])
      if user_signed_in? && current_user.id == chord.user_id
        true
      else
        redirect_to root_url
        false
      end
    end
end
