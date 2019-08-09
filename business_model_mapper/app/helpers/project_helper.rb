module ProjectHelper
    def selected_strategic_goal
        @selected_sg = StrategicGoal.find(params[:id])
    end
end