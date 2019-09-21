class BusinessesController < ApplicationController
  before_action :only => [:edit] do
    redirect_to new_user_session_path unless current_user == Business.find(params[:id]).user
  end
  
  def index
    @businesses = current_user.businesses
    respond_to do |format|
      format.html
      format.json {render json: @businesses}
    end
  end
  
  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    @business.user = current_user
    if @business.save
      # redirect_to business_path(@business)
      render json: @business
    else
      render :new
    end
  end 

  def show
    @businesses = Business.all
    @business = Business.find(params[:id])
    @strategic_goals = @business.strategic_goals
      respond_to do |format|
        format.html {render :show}
        format.json {render json: @business, status: 200}
      end
  end

  #Has many through
  def business_resources
    @business = Business.find(params[:id])
  end

  def next
    @next_business = @business.next
    render json: @next_business
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
