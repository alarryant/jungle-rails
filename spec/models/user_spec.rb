require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    User.new(first_name: "Angela", last_name: "Larryant", email: "angela@example.com", password: 'pass1234', password_confirmation: 'pass1234')
  }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it "is not valid without a unique email" do
      User.create(first_name: "Angela", last_name: "Larryant", email: "angela@example.com", password: 'pass1234', password_confirmation: 'pass1234')
      expect(subject).to_not be_valid
    end

    it "is not valid if email is not unique without caps lock" do
      User.create(first_name: "Angela", last_name: "Larryant", email: "ANGELA@EXAMPLE.COM", password: 'pass1234', password_confirmation: 'pass1234')
      expect(subject).to_not be_valid
    end

    it "is not valid if password doesn't match password_confirmation" do
      subject.password_confirmation = "nomatch"
      expect(subject).to_not be_valid
    end

    it "is not valid without a first_name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a last_name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with password below 6 characters" do
      subject.password = "ha"
      subject.password_confirmation = "ha"
      expect(subject).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "is valid if email and password matches" do
      user_db = User.create(first_name: "Angela", last_name: "Larryant", email: "angela@example.com", password: 'pass1234', password_confirmation: 'pass1234')
      user_login = User.authenticate_with_credentials("angela@example.com", "pass1234")
      expect(user_db).to eq user_login
    end

    it "is valid if email and password matches, even if email has leading and/or trailing whitespace" do
      user_db = User.create(first_name: "Angela", last_name: "Larryant", email: "angela@example.com", password: 'pass1234', password_confirmation: 'pass1234')
      user_login = User.authenticate_with_credentials(" angela@example.com  ", "pass1234")
      expect(user_db).to eq user_login
    end

    it "is valid if email and password matches, even if email has varying cases" do
      user_db = User.create(first_name: "Angela", last_name: "Larryant", email: "angela@example.com", password: 'pass1234', password_confirmation: 'pass1234')
      user_login = User.authenticate_with_credentials("ANgeLa@EXamplE.cOM", "pass1234")
      expect(user_db).to eq user_login
    end
  end
end
