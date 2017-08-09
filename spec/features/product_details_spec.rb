require 'rails_helper'
require 'phantomjs/poltergeist'

RSpec.feature "user navigates to Product Details", type: :feature, js: true  do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Users click product name on index page" do
     visit root_path

     first('article.product a').click
     expect(page).to have_css 'section.products-show'
  end

  scenario "Users click product img on index page" do
    visit root_path

    first('article.product img').click
    expect(page).to have_css 'section.products-show'
  end

  scenario "Users click product details on index page" do
    visit root_path

    first('article.product').find_link('Details').click
    expect(page).to have_css 'section.products-show'
  end
end
