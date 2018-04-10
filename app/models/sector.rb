class Sector < ApplicationRecord
	has_many :departments, dependent: :destroy
	has_many :users, through: :departments
end
