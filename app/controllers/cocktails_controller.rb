class CocktailsController < ApplicationController
  def index
    @ingredients = Ingredient.all
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new()
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end


  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.delete

    redirect_to root_path
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  def update
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :picture)
  end
end
