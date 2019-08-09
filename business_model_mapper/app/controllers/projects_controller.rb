class ProjectsController < ApplicationController

    def new
        @project = Project.new
        2.times {@project.resources.build}
        @strategic_goal = StrategicGoal.find(params[:strategic_id])
    end


    def create
      
        @project = Project.new(project_params)
        @project.strategic_goal = StrategicGoal.find(params[:project][:strategic_goal][:id])
        if @project.save
          redirect_to project_path(@project)
        else
          redirect_to project_path
        end
    end 

    def show
        @projects = Project.all
        @project = Project.find(params[:id])
    end

    private

    def project_params
        params.require(:project).permit(:name, :id, resources_attributes:[:name,:resource_type, :total_cost_year, :qty ], strategic_goals_attributes:[:id]) 
    end

end
