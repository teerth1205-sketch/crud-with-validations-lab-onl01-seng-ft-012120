class SongsController < ApplicationController
    before_action :set_song!, only: [:show, :edit, :update, :destroy]

    def new
        @song = Song.new
    end 

    def create
        @song = Song.new(song_params)
        if @song.valid?
            @song.save 
            redirect_to song_path(@song)
        else 
            render :new
        end
    end

    def show
        
    end

    def edit

    end 

    def update
        if Song.update(song_params)
            redirect_to song_path(@song)
    end 



    private

    def set_song!
        @song = Song.find(params[:id])
    end

    def song_params
        params.require(:song).permit(
            :title, :released, :release_year, :artist_name, :genre
            )
    end
end
