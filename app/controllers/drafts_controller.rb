class DraftsController < ApplicationController
  def index
  	@player = Player.all
  	@draft = Draft.create(2, 'snake')
  end

  def show
  end

  def new
    @draft = Draft.new(draft_params)
  end



  private

  def draft_params
    params.require(:draft).permit(:draft_type, :number_of_teams)
  end

end


