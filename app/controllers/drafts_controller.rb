class DraftsController < ApplicationController
  def index
  	@player = Player.all
  end

  def show
  end
end
