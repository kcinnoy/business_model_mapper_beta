class BusinessesController < ApplicationController
  
  def index
    @business = current_user.businesses
  end
  
  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    @business.user = current_user
    if @business.save
      redirect_to business_path(@business)
    else
      redirect_to business_path
    end
  end 


  def show
    @businesses = Business.all
    @business = Business.find(params[:id])
    @strategic_goals = @business.strategic_goals
  end

  def edit
    @business = Business.find(params[:id])
  end

  def update
    @business = Business.find(params[:id])
    @business.update(business_params)
    redirect_to business_path(@business)
  end 

  def business_params
    params.require(:business).permit(:name, :description) 
  end

end
