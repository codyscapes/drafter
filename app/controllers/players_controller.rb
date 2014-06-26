class PlayersController < ApplicationController
  def index
  	@players = Player.all
  end

  # def show
  # 	@player = Player.find_by(params[:id])
  # end
end
