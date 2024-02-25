require 'rails_helper'

describe Api::V1::CoursesController, type: :controller do
	describe '#create' do
    it 'creates a course with a tutor' do
      post :create, params: { course: { name: 'Python Expert', description: 'Learn full python development', category: 'development', level: 'advanced' }, tutor_ids: [1, 2, 3] }
      expect(response).to have_http_status(:created)

      expect(JSON.parse(response.body)['course']['name']).to eq('Python Expert')
      expect(JSON.parse(response.body)['course']['category']).to eq('development')
    end
  end

  describe 'GET #index' do
    it 'returns a list of courses with tutors' do
      course = Course.create(
                              name: 'Python Expert',
                              description: 'Learn full python development',
                              category: 'development',
                              level: 'advanced'
                            )
      tutor = course.tutors.create(
                                    first_name: 'Jane',
                                    last_name: "doe",
                                    date_of_birth: '29-01-1997',
                                    about: 'about John Doe',
                                    primary_skill: "python"
                                  )

      get :index
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).first['name']).to eq('Python Expert')
      expect(JSON.parse(response.body).first['tutors'].first['first_name']).to eq('Jane')
    end
  end
end