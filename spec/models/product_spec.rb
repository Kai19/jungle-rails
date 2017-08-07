require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context 'Product should have a category'
    it 'given a category, product.category should return category' do
      @category = Category.create(name: "dogs")
      @product= Product.create(name:'leash', price: 200, quantity: 1, category: @category)
    expect(@product).to be_valid
    end

    context 'Product should have a name'
    it 'given a name, product.name should return name' do
      @category = Category.create(name: "dogs")
      @product= Product.create(name: nil, price: 200, quantity: 1, category: @category)
    expect(@product).to be_invalid
    expect(@product.errors.messages[:name]).to include("can't be blank")
    end

    context 'Product should have a price'
    it 'given a price, product.price should return price' do
      @category = Category.create(name: "dogs")
      @product= Product.create(name: 'leash', price: nil, quantity: 1, category: @category)
    expect(@product).to be_invalid
    expect(@product.errors.messages[:price]).to include("can't be blank")
    end

    context 'Product should have a quantity'
    it 'given a quantity, product.quantity should return quantity' do
      @category = Category.create(name: "dogs")
      @product= Product.create(name: 'leash', price: 200, quantity: nil, category: @category)
    expect(@product).to be_invalid
    expect(@product.errors.messages[:quantity]).to include("can't be blank")
    end

    context 'Product should have a category'
    it 'given a category, product.category should return category' do
      @product= Product.create(name: 'leash', price: 200, quantity: 1, category: nil)
    expect(@product).to be_invalid
    expect(@product.errors.messages[:category]).to include("can't be blank")
    end
  end
end