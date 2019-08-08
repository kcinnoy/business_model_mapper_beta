class BusinessesController < ApplicationController
  
  def index
    @business = Business.all
  end
  
  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    @business.user = current_user
    if @business.save
      default_strategic_goals
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

  def business_params
    params.require(:business).permit(:name) 
  end

  def default_strategic_goals
      sg_defaults = [
        'customer segments', 'value propositions',
        'channels', 'customer relationships', 
        'revenue streams','key activities', 
        'key partnerships'
      ]

      sg_defaults.map{|strategic_goal| StrategicGoal.create(name: strategic_goal, business_id: params[:business_id])}
  end
end
