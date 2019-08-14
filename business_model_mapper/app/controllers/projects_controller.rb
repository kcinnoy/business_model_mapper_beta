class ProjectsController < ApplicationController

    def Index
        if params[:strategic_goal_id]
            @projects = StrategicGoal.find(params[:strategic_goal_id]).projects
        else
            @projects = Project.all
        end
    end
    
    
    def new
        @project = Project.new(strategic_goal_id: params[:strategic_goal_id])
        @strategic_goal = StrategicGoal.find(params[:strategic_goal_id])
        2.times {@project.resources.build} 
    end

    def create      
        # raise params.inspect

        @project = Project.new(project_params)
        @strategic_goal = @project.strategic_goal_id

        # @project.strategic_goal = StrategicGoal.find(params[:project][:strategic_goal][:id])
        if @project.save
          redirect_to strategic_goal_project_path(@strategic_goal,@project)
        else
          redirect_to strategic_goal_project_path
        end
    end 

    def show
        @projects = Project.all
        @project = Project.find(params[:id])
    end

    def edit
        @project = Project.find(params[:id])
        @strategic_goal = StrategicGoal.find(params[:strategic_goal_id])
        @resources = @project.resources
    end

    def update 
        raise params.inspect
        @project = Project.find(params[:id])
        @business = @project.strategic_goal.business_id
        @resources = @project.resources
        @project.update(project_params)
        
        # redirect_to strategic_goal_project_path(@strategic_goal,@project)
        redirect_to business_path(@business)
      end 

    private

    def project_params
        params.require(:project).permit(:name, :strategic_goal_id,
            resources_attributes:[:name,:resource_type, :total_cost_year, :qty, :_destroy ]) 
    end

end
