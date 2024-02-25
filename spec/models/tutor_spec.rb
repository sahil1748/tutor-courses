require 'rails_helper'

RSpec.describe Tutor, type: :model do

  context 'attributes' do
    it { is_expected.to respond_to(:first_name) }
    it { is_expected.to respond_to(:last_name) }
  end

  context 'validations' do
    subject {
      Tutor.new(
        first_name: 'John',
        last_name: 'Doe',
        date_of_birth: '29-01-1998',
        about: 'Description about john tutor',
        primary_skill: 'javascript'
      )
    }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a first_name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a last_name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a date_of_birth" do
      subject.date_of_birth = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a primary_skill" do
      subject.primary_skill = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it { should belong_to(:course).without_validating_presence }
  end
end