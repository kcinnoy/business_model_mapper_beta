class ResourcesController < ApplicationController
    def show
        @resource = resource.find(params[:id])
      end
    
      def index
        @resources = Resource.all
      end
    
      def new
        @resource = Resource.new
      end
    
      # def create
      #   resource = Resource.create(resource_params)
      #   redirect_to resource
      # end
    
      private
  
      def resource_params
        params.require(:resource).permit(:name, :type, :qty, :total_cost_year, strategic_goals_ids:[], strategic_goal_attributes: [:name, :approach, :description])
      end
end
