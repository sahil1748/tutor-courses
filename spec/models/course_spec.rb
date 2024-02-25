require 'rails_helper'

RSpec.describe Course, type: :model do
  context 'validations' do
    subject {
      Course.new(
        name: 'Python Expert',
        description: 'Learn full python development',
        category: 'development',
        level: 2
      )
    }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a description" do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a category" do
      subject.category = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a level" do
      subject.level = nil
      expect(subject).to_not be_valid
    end
  end
end
