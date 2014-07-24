class DraftsController < ApplicationController
  def index
    @drafts = Draft.all
  end

  def show
    @players = Player.all
    @draft = Draft.find(params[:id])
    @teams = @draft.teams
    @order = @draft.set_order
    @available_players = @draft.available_players
    @drafted_players = @draft.drafted_players
    @best_available = @draft.best_available
  end

  def edit
    @draft = Draft.find(params[:id])
  end

  def update
    # redirect_to session.delete(:return_to)
    @draft = Draft.find(params[:id])
    @draft.update(draft_params)
    redirect_to draft_path(@draft)
    # session[:return_to] = request.referer
  end

  def create
    @draft = Draft.create(draft_params)

    if @draft.save
      redirect_to draft_path(@draft)
    else
      render 'new'
    end

  end


  def new
    @draft = Draft.new
  end

private

  def draft_params
    params.require(:draft).permit(:draft_position, :number_of_teams, :PPTD, :PPR, :Number_of_starting_QBs, :Number_of_starting_HBs, :Number_of_starting_WRs, :Number_of_starting_FLEX, :draft_type, :keeper, :ranking_method, :rounds, :current_pick)
  end

  def player_params
    params.require(:player).permit(:name, :team, :points_2013, :bye_week, :adp, :tier, :position, :beer_value, :id, :avatar, :master)
  end

end


