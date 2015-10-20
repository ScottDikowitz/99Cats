class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @params = params
    @cat = Cat.find(params[:id])
    render :show
  end
end
