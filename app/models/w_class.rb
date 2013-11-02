class WClass < ActiveRecord::Base

	belongs_to :school

	validates :name, presence: true, length: { minimum: 2, maximum: 80 }

	validates :type, presence: true, length: { minimum: 2, maximum: 80 }
	validates :time, presence: true

end
