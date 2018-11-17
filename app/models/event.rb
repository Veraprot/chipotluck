class Event < ApplicationRecord
  # Associations
  has_many :event_users
  has_many :users, through: :event_users
  has_many :dishes
  has_many :users, through: :dishes

  # Validation
  validates_presence_of :name, on: :create, message: "Please pick a name for your potluck"
  validates_presence_of :date, on: :create, message: "Please pick a date for your potluck"
  validates_presence_of :time, on: :create, message: "Please pick a time for your potluck"
  validates_presence_of :location, on: :create, message: "Please pick a location for your potluck"

  def format_time(event)
    formatted_time = DateTime.parse("#{event[:hour]}:#{event[:minute]}#{event[:meridiem]}")
    self.time = formatted_time.strftime("%I:%M%p")
    self.save
  end

  # Class method Search
  def self.search(search)

    if search
      self.where("location LIKE ?", "%#{search}%")
    else
      Event.all
    end
  end
  

end
