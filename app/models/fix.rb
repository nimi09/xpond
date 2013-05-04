# == Schema Information
#
# Table name: fixes
#
#  id         :integer          not null, primary key
#  lat        :float
#  lon        :float
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Fix < ActiveRecord::Base
    attr_accessible :lat, :lon, :name
    belongs_to :user

    before_save { |fix| fix.name = name.upcase }

    validates :lat, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to:  90}
    validates :lon, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to:  180}

    NAME_REGEX = /[a-zA-Z\d]{5}/
    validates :name, presence: true, format: { with: NAME_REGEX }, length: {is: 5}, uniqueness: { case_sensitive: false }

#    default_scope order: 'fixes.created_at DESC'

#    acts_as_gmappable

#    def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
#      "#{self.street}, #{self.city}, #{self.country}" 
#    end
end
