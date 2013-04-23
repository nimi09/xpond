class Fix < ActiveRecord::Base
  attr_accessible :lat, :lon, :name

  before_save { |fix| fix.name = name.upcase }

  validates :lat, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to:  90}
  validates :lon, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to:  180}

  NAME_REGEX = /[a-zA-Z\d]{5}/
  validates :name, presence: true, format: { with: NAME_REGEX }, length: {is: 5}
  validates :name, uniqueness: true
end
