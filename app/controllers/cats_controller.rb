class CatsController < ApplicationController

  def index
    @cats = Cat.all.order(:id)
    render :index
  end

  def show
    @params = params
    @cat = Cat.find(params[:id])
    render :show
  end

  def create
    cat = Cat.new(cat_params)
    cat.user_id = current_user.id
    p current_user.user_name
    p "----------aaaaaaaaaddd"
    cat.save!
    redirect_to cats_url
  end

  def new
    @cat = Cat.new(birth_date: Date.current, color: "", name: "", sex: "", description: "")
    render :new
  end

  def edit
    @cat = Cat.find(params[:id])
    @id = @cat.id
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    @cat.update_attributes(cat_params)
    redirect_to cats_url
  end

  def cat_params
    params.
      require(:cat).
      permit(:name, :age, :sex, :description, :color, :birth_date)
  end
end
