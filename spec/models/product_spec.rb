require 'rails_helper'

RSpec.describe Product, type: :model do

  let (:category) { Category.create(name: "Food") }

  subject {
    Product.new(name: "Chocolate Milk", price_cents: 2, quantity: 5, category: category)
  }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      puts "The category id is #{category.id}"
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a category" do
      subject.category = nil
      expect(subject).to_not be_valid
    end
  end
end
