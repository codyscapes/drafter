class DraftsController < ApplicationController
  def index
    @drafts = Draft.all
  end

  def show
    @draft = Draft.find(params[:id])
    @players = @draft.players.order('adp')
  end

  def edit

  end


  def new

  end



  # private

  # def draft_params
  #   params.require(:draft)
  # end

end


