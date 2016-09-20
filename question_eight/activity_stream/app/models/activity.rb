class Activity < ActiveRecord::Base
  validates :actor, presence: true
  validates :item, presence: true
  validates :action, presence: true

  ITEM_OPTIONS   = ['Post', 'Status', 'Duck', 'Job'] 
  ACTION_OPTIONS = ['Posted', 'Liked', 'Created', 'Commented on', 'Found', 'Updated']

  def activity_string
    "#{actor} #{action} a #{item}"
  end

  def time_string
    created_at.strftime("%d %b. %Y")
  end
end
