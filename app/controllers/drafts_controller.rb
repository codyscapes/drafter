class DraftsController < ApplicationController
  def index

  	@draft = Draft.create(2, 'snake')
  end

  def show
    @draft = Draft.create(2, 'snake')
  end

  def edit
    @draft = Draft.create(2, 'snake')
  end


  def new
    @draft = Draft.new(draft_params[:draft_type], draft_params[:number_of_teams])
  end



  private

  def draft_params
    params.permit(:draft_type, :number_of_teams)
  end

end


