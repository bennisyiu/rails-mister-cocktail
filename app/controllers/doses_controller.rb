class DosesController < ApplicationController

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(params[:description])
    @dose.save
    redirect_to cocktail_path(:cocktail_id)
  end

  def destroy
    @dose = Dose.new(params[:id])
    @dose.destroy
    redirect_to cocktail_path(:cocktail_id)
  end
end
