class DraftsController < ApplicationController
  def index
    @drafts = Draft.all
  end

  def show
    @draft = Draft.find(params[:id])
    @draft.start
  end

  def edit
    @draft = Draft.find(params[:id])
  end

  def update
    @draft = Draft.find(params[:id])
    @draft = Draft.update(draft_params)
    redirect_to drafts_path
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
    params.require(:draft).permit(:draft_position, :number_of_teams, :PPTD, :PPR, :Number_of_starting_QBs, :Number_of_starting_HBs, :Number_of_starting_WRs, :Number_of_starting_FLEX, :draft_type, :keeper, :ranking_method)
  end

end


