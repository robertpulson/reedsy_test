class Activity < ActiveRecord::Base
  ITEM_OPTIONS   = ['post', 'status', 'duck', 'new job'] 
  ACTION_OPTIONS = ['posted', 'liked', 'created', 'commented on', 'found', 'updated']

  validates :actor, presence: true
  validates :item, presence: true, inclusion: { in: ITEM_OPTIONS, message: "%{value} is not a valid item" }
  validates :action, presence: true, inclusion: { in: ACTION_OPTIONS, message: "%{value} is not a valid action" }

  def activity_string
    "#{actor} #{action} a #{item}"
  end

  def time_string
    created_at.strftime("%d %b. %Y")
  end
end
