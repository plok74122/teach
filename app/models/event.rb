class Event < ApplicationRecord
  validates_presence_of :name
  has_many :attendees , :dependent => :destroy
  belongs_to :category
end
