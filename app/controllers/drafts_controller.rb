class DraftsController < ApplicationController
  def index
  	@player = Player.all
  	@draft = Draft.create(12, 'snake')
  end

  def show
  end

  def new
  end

end
