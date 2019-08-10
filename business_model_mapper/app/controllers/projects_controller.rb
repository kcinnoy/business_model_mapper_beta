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

    private

    def project_params
        params.require(:project).permit(:name, :strategic_goal_id,
            resources_attributes:[:name,:resource_type, :total_cost_year, :qty ]) 
    end

    def nested_project_params
        params.require(:strategic_goal).permit(:name, :id,
            project_attributes:[:name,
                resources_attributes:[:name,:resource_type, :total_cost_year, :qty]
            ]
        )
    end

end
