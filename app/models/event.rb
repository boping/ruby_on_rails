class Event < ApplicationRecord
  belongs_to :category

  has_one :location, :dependent => :destroy
  has_many :attendees, :dependent => :destroy

  has_many :event_groupships

  has_many :groups, :through => :event_groupships

  validates_presence_of :name

  delegate :name, :to => :category, :prefix => true, :allow_nil => true

  accepts_nested_attributes_for :location, :allow_destroy => true, :reject_if => :all_blank
end
