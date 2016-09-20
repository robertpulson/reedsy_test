class ActivitiesController < ApplicationController
  def index
    @new_activity = Activity.new
    @activities = Activity.all
    @items = Activity::ITEM_OPTIONS
    @actions = Activity::ACTION_OPTIONS
  end

  def create
    a = Activity.new(activity_params)
    if a.save
      flash[:notice] = 'Activity Created'
    else
      flash[:alert] = 'Activity not created, invalid fields'
    end
    redirect_to activities_path
  end

  private

  def activity_params
    params.require(:activity).permit(:actor, :item, :action)
  end
end
