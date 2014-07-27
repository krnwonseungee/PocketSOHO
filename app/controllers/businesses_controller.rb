class BusinessesController < ApplicationController
  def new
    @business = Business.find(params[:id])

  end

  def create
    @business = Business.find(params[:id])
  end

  def edit
    @business = Business.find(params[:id])
  end

  def show
    @business = Business.find(params[:id])
  end

  def update

  end

  def destroy

  end
end
