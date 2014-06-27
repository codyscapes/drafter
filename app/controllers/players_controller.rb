class PlayersController < ApplicationController
  def index
  	@players = Player.all
  end

  def show
  	@player = Player.find_by(params[:id])
  end

	def new
    @player = Player.new
    render('new.html.erb')
  end

  def create
    @player = Player.create(player_params)
    @player.save
    redirect_to('/players')
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to('/players')
  end

private

  def player_params
    params.require(:player).permit(:name, :team, :points_2013, :bye_week, :adp, :tier, :position, :beer_value)
  end

end
