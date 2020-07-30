class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktail_path(@cocktail)
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)
    @cocktail.save
    redirect_to cocktail_path(@cocktail)
  end

  ## collection here

  def vodka
    @cocktails = Cocktail.where(category: 'Vodka')
  end

  def gin
    @cocktails = Cocktail.where(category: 'Gin')
  end

  def rum
    @cocktails = Cocktail.where(category: 'Rum')
  end

  def bourbon
    @cocktails = Cocktail.where(category: 'Bourbon')
  end

  def scotch
    @cocktails = Cocktail.where(category: 'Scotch')
  end

  def whiskey
    @cocktails = Cocktail.where(category: 'Whiskey')
  end

  def tequila
    @cocktails = Cocktail.where(category: 'Tequila')
  end

  def brandy
    @cocktails = Cocktail.where(category: 'Brandy')
  end

  def other
    @cocktails = Cocktail.where(category: 'Other')
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :category, :photo)
  end
end
