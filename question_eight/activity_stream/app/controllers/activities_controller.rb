class ActivitiesController < ApplicationController
  def index
    @new_activity = Activity.new
    @activities = Activity.all
  end

  def create
    Activity.create(activity_params)
    flash[:notice] = 'Activity Created'
    redirect_to activities_path
  end

  private

  def activity_params
    params.require(:activity).permit(:actor, :item, :action)
  end
end
