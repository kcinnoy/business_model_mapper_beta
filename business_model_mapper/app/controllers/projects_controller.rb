class ProjectsController < ApplicationController

    def new
        @project = Project.new
        @project.strategic_goal = StrategicGoal.find(params[:id])
    end

end
