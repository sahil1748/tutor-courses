class CourseSerializer < ApplicationSerializer
	attributes(
		:name, :description, :category, :level
	)

	has_many :tutors
end