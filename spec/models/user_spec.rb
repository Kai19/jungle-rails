require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    context 'User should be made with name, unique email, password and password_confirmation'
    it 'given all the inputs a user will be registered' do
      @user= User.create(name:'Kai', email: 'kai@kai.kai', password: '123', password_confirmation: '123')
    expect(@user).to be_valid
    end

    it 'User should be made with name' do
      @user= User.create(name: nil, email: 'kai@kai.kai', password: '123', password_confirmation: '123')
    expect(@user).to be_invalid
    expect(@user.errors.messages[:name]).to include("can't be blank")
    end

    it 'User email should be unique' do
      @user= User.create(name: 'kai', email: 'kai@kai.kai', password: '123', password_confirmation: '123')
      @user2= User.create(name: 'kai', email: 'KAI@KAI.KAI', password: '123', password_confirmation: '123')
    expect(@user2).to be_invalid
    expect(@user2.errors.messages[:email]).to include("has already been taken")
    end

    it 'User should be made with password' do
      @user= User.create(name: 'kai', email: 'kai@kai.kai', password: nil, password_confirmation: '123')
    expect(@user).to be_invalid
    expect(@user.errors.messages[:password]).to include("can't be blank")
    end

    it 'User should confirm their password' do
      @user= User.create(name: 'kai', email: 'kai@kai.kai', password: '123', password_confirmation: '1234')
    expect(@user).to be_invalid
    expect(@user.errors.messages[:password_confirmation]).to include("doesn't match Password")
    end

    it 'User password has to have a minimum length of 3 characters' do
      @user= User.create(name: 'kai', email: 'kai@kai.kai', password: '12', password_confirmation: '12')
    expect(@user).to be_invalid
    expect(@user.errors.messages[:password]).to include("is too short (minimum is 3 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    it 'only registered users can login' do
      email = 'test@test.test'
      password = '123'
      @user= User.authenticate_with_credentials(email, password)

    expect(@user).to be_nil
    end

    it 'only allow registered users with the correct password can login' do
      email = 'kai@kai.kai'
      password = 'wrong'
      @user= User.authenticate_with_credentials(email, password)
    expect(@user).to be_nil
    end

    it 'emails with uppercase and spaces will be accepted' do
      user= User.create(name: 'kai', email: 'test@test.test', password: '1234', password_confirmation: '1234')
      email = 'test@TEST.test'
      password = '1234'
      @login= User.authenticate_with_credentials(email, password)
    expect(@login).to eq(user)
    end
  end
end
