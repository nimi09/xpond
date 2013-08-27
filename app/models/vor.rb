class Vor < ActiveRecord::Base
	attr_accessible :elevation, :frq, :identifier, :lat, :lon, :name, :range, :slaved
	belongs_to :user

	before_save { |vor| vor.identifier = identifier.upcase }	

	validates :lat, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
    validates :lon, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

    validates :elevation, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 30000, only_integer: true }
    validates :frq,       presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 999,   only_integer: true }
    validates :range,     presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5000,  only_integer: true }

    validates :slaved,    presence: true, numericality: true

    IDENTIFIER_REGEX = /\A[a-zA-Z0-9]{2,4}\Z/
    validates :identifier, presence: true, format: { with: IDENTIFIER_REGEX }, length: {in: 2..4}

    NAME_REGEX = /\A[a-zA-Z0-9-_\s]+([V][O][R]|[V][O][R][T][A][C]|[V][O][R][-][D][M][E])\Z/
    validates :name, presence: true, format: {with: NAME_REGEX }, length: { maximum: 50}

end
