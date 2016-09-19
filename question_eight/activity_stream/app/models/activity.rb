class Activity < ActiveRecord::Base
  validates :actor, presence: true
  validates :item, presence: true
  validates :action, presence: true
end
