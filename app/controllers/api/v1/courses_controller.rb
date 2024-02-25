class Api::V1::CoursesController < Api::V1::BaseController

  def create
    res = CourseCreator.new(course_params, tutors, tutor_ids)
          .process

    if res[:error_messages].present?
      render json: {
                      success: false,
                      error_messages: res[:error_messages]
                    },
                    status: :unprocessable_entity
    else
      render json: { 
                      success: true,
                      course: CourseSerializer.new(res[:course])
                    },
                    status: :created
    end
  end

  def index
    render json: paginate(Course.includes(:tutors)), status: :ok
  end

  private

  def course_params
    params.require(:course).permit(
      :name, :description,
      :category, :level
    )
  end

  def tutor_ids
    params.permit(tutor_ids: [])
  end

  def tutors
    params.permit(tutors: [
                            :first_name,
                            :last_name,
                            :date_of_birth,
                            :primary_skill,
                            :about
                          ])
  end
end