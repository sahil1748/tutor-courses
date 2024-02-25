class Course < ApplicationRecord
	enum level: { beginner: 0, intermediate: 1, advanced: 2 }

	validates :name, :description,
						:category, :level,
						presence: true

	has_many :tutors
end
