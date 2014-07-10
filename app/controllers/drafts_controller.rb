class DraftsController < ApplicationController
  def index
  	@player = Player.all
  	@draft = Draft.create(2, 'snake')
  end

  def show
  end

  def new
  end



  private

  def draft_params
    params.permit(:draft_type, :number_of_teams)
  end

end


