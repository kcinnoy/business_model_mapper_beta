class ProjectsController < ApplicationController
    before_action :only => [:new, :edit] do
        redirect_to new_user_session_path unless current_user == Project.find(params[:id]).strategic_goal.business.user
    end

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
        @business = @strategic_goal.business
        2.times {@project.resources.build} 
    end

    def create          
        # raise inpect.params
        @project = Project.new(project_params)
        @strategic_goal = @project.strategic_goal_id
        @business = @project.strategic_goal.business
        @resources = @project.resources

        
      
        # @project.strategic_goal = StrategicGoal.find(params[:project][:strategic_goal][:id])
        if @project.save
          redirect_to strategic_goal_project_path(@strategic_goal,@project)
        else
            redirect_to request.referrer
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
        @business = @project.strategic_goal.business
    end

    def update 
        # raise params.inspect
        @project = Project.find(params[:id])
        @business = @project.strategic_goal.business_id
        @resources = @project.resources
        @project.update(project_params)
        
        # redirect_to strategic_goal_project_path(@strategic_goal,@project)
        redirect_to business_path(@business)
      end 

      def destroy
        @project = Project.find(params[:id])
        @business = @project.strategic_goal.business_id
        @project.destroy
      
        redirect_to business_path(@business)
      end

    private

    def project_params
        params.require(:project).permit(:name, :strategic_goal_id,
            resources_attributes:[:name, :id, :total_cost_year, :resource_type,  :qty, :_destroy ]) 
    end

    # def raise_invoice
    #     @business.invoices.create!(params[:project][:resources_attributes][0])
    # end

end
