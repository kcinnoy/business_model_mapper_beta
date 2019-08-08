class StrategicGoalsController < ApplicationController
  
  def new
  end

  def show
    @strategic_goal =  StrategicGoal.find(params[:id])
  end

  def create    
  end

  def destroy
  end

  def update
  end
end


