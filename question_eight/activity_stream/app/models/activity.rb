class Activity < ActiveRecord::Base
  validates :actor, presence: true
  validates :item, presence: true
  validates :action, presence: true

  def activity_string
    "#{actor} #{action} a #{item}"
  end

  def time_string
    created_at.strftime("%d %b. %Y")
  end
end
