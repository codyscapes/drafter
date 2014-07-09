class DraftsController < ApplicationController
  def index
  	@player = Player.all
  	@draft = Draft.create(2, 'snake')
  end

  def show
  end

  def new
    @draft = Draft.new(12, 'snake')
  end

  def create
  	@draft = Draft.create(params[:draft])
  end

private

  def draft_params
    params.require(:draft).permit(:number_of_teams, :draft_type)
  end


end
