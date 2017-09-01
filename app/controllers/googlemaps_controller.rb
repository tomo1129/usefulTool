class GooglemapsController < ApplicationController
  def index
  end

  def show
    @map_id = params[:id]
  end
end
