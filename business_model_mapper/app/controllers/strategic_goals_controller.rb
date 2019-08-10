class StrategicGoalsController < ApplicationController
  
  def new
  end

  def show
    @strategic_goal =  StrategicGoal.find(params[:id])
    @business = @strategic_goal.business
    redirect_to businesses_path
  end

  def create    
  end

  def destroy
  end

  def update
  end
end


