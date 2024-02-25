class CourseCreator
  def initialize(course={}, tutors=[], tutor_ids=[])
    @course = course
    @tutors = tutors
    @tutor_ids = tutor_ids
    @error_messages = {}
  end

  def process
    Course.transaction do
      @course_rec = Course.new(@course)
      if @course_rec.save
        assign_tutors if @tutors.present?
      else
        @error_messages.merge! @course_rec.errors.messages
      end
    end

    {error_messages: @error_messages, course: @course_rec}
  end

  def assign_tutors
    result = create_tutors
    success_ids = result.pluck(:id).compact

    Tutor.where(id: success_ids + @tutor_ids[:tutor_ids]).update_all(course_id: @course_rec.id)
  end

  def create_tutors
    Tutor.create(@tutors[:tutors])
  end
end