class TeamsController < ApplicationController
  def index
    @template_teams = Team.all.where(draft_id: 0)
    @copied_teams = Team.all.where(draft_id: 2)
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    @team.update(team_params)
    redirect_to teams_path
  end

  def new
    @team = Team.new
    render('new.html.erb')
  end

  def create
    @team = Team.create(team_params)
    @team.save
    redirect_to('/teams')
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to('/teams')
  end

private

  def team_params
    params.require(:team).permit(:team_name, :draft_position, :draft_id)
  end

end
