class Activity < ApplicationRecord
	enum status: {pending: 0, approved: 1}
	belongs_to :user
	

end
