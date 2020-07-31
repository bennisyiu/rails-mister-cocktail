class DosesController < ApplicationController
  def show
    @does = Dose.new(params[:id])
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(:cocktail_id)
    else
      render 'new'
  end

  def destroy
    @dose = Dose.new(params[:id])
    @dose.destroy
    redirect_to cocktail_path(:cocktail_id)
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end
end
