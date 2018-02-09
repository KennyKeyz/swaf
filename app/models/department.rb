class Department < ApplicationRecord
	has_many :users,  dependent: :destroy
	belongs_to :sector

end
