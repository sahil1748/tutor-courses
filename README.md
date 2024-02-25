# tutor-courses

The tutor-courses is a Ruby on Rails API application that allows you to manage courses and their tutors. It provides two main functionalities: creating a course with its respective tutors and listing all courses along with their tutors. Course creator API can also assign older tutors to the newly generated course. 

## Getting Started

These instructions will help you set up the project on your local machine for development and testing purposes.

### Prerequisites

- Ruby (version 3.3.0)
- Rails (version >= 7.1.3)
- Postgresql (for development and testing)

### Installation

1. Clone the repository:

   ```bash
   git clone git@github.com:sahil1748/tutor-courses.git
   cd tutor-courses
   ```

2. Install dependencies:

   ```bash
   bundle
   ```

3. Create and setup the database:

   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. Start the Rails server:

   ```bash
   rails s -p 4000
   ```

## Usage

The API provides two main endpoints:

### 1. Create a course with its tutors

   - **Endpoint:** `POST /courses`
   - **Parameters:**
     - `course[name]` (string): Name of the course.
     - `course[description]` (string): Details of the course.
     - `course[category]` (string): Type of course (e.g. Design, Marketing).
     - `course[level]` (integer): Level of course (0 - Beginner, 1 - intermediate, 2 - advanced).
     - `tutors[]` (array): Tutors of the created course (Array of tutor objects).
     - `tutor[first_name]` (string): First name of the tutor.
     - `tutor[last_name]` (string): Last name of the tutor.
     - `tutor[date_of_birth]` (date): Date of birth of the tutor.
     - `tutor[about]` (text): Brief about the tutor.
     - `tutor[primary_skill]` (string): Field of expertise of the tutor.
     - `tutor[tutor_ids]` (array): Assign old tutors for the current course (Array with tutor ids).

   Example:

   ```bash
   curl -H "Content-Type: application/json" -H "Accept: application/json" -d '{"course": {"name": "Master Javascript", "description": "Javascript Course", "category": "javascript", "level": 0}, "tutors": [{"first_name": "John", "last_name": "Doe", "about": "about john", "date_of_birth": "20-06-1995", "primary_skill": "javascript"}], "tutor_ids": []}' http://localhost:4000/api/v1/courses

   ```

### 2. List all courses with their tutors

   - **Endpoint:** `GET /courses`
   - **Response:** JSON array containing each course along with its tutors.

   Example:

   ```bash
   curl -H "Content-Type: application/json" -H "Accept: application/json" 'http://localhost:4000/api/v1/courses?page=1&per_page=5'
   ```

## Running Tests

This project uses RSpec for testing. Run the tests with the following command:

```bash
rspec
```

## Contributing

Contributions are welcome! If you'd like to contribute to this project, please follow the [Contributing Guidelines](CONTRIBUTING.md).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- This project was created as a part of learning and is not intended for production use.

---

Customize the README file based on your project's specific details and requirements. Include information such as how to contribute, license details, and any additional acknowledgments or considerations.
