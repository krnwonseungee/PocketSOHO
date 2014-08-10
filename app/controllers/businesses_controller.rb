class BusinessesController < ApplicationController
  def new
    @user = User.find(session[:user_id])
  end

  def create
    @user = User.find(session[:user_id])
  end

  def edit
    @user = User.find(session[:user_id])
    @business = Business.find(params[:id])
  end

  def show
    @user = User.find(session[:user_id])
    @business = Business.find(params[:id])
    @biz_owner = User.find(@business.business_owner_id)
  end

  def update

    {"utf8"=>"✓",
     "authenticity_token"=>"TkIe9vuuWmDNaivNPLrm7W8D/iWuttpPPv0a2N1OYsE=",
     "business"=>
       {"name"=>"Sample Biz",
       "location"=>"",
       "slogan"=>"",
       "city"=>"San Francisco",
       "state"=>"CA",
       "description"=>"Lorem ipsum dolor sit amet,
       odio ignota cetero id vim,
       mea modo vide fabulas ad. His id animal aliquando,
       et cibo utamur vim. Id etiam dissentias sed,
       has prompta delicatissimi cu. Id mei probo novum harum,
       per falli utinam labores ut. Ei sed reque harum."},
     "commit"=>"Update Business",
     "id"=>"1"}
    @user = User.find(session[:user_id])
    @business = Business.find(params[:id])
    @business.update( business_params )
    redirect_to root_path
  end

  def destroy
    @user = User.find(session[:user_id])
    @business = Business.find(params[:id])
    @business.destroy
  end

  private

  def business_params
    params.require(:business).permit(:name, :location, :slogan, :image_url, :city, :state, :description)
  end
end
