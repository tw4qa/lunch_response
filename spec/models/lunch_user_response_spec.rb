require 'rails_helper'

describe LunchUserResponse do

  it 'should create an object' do
    lr = LunchUserResponse.create(year: 2015, month: 'May', day: 'Monday')
    expect(lr.id).to be
  end

  it 'should have a proper collection of objects' do
    LunchUserResponse.create(year: 2015, month: 'May', day: 'Monday', user_name: 'Josh Smith')
    LunchUserResponse.create(year: 2015, month: 'May', day: 'Monday', user_name: 'Just Bob')
    LunchUserResponse.create(year: 2015, month: 'May', day: 'Tuesday', user_name: 'Anonymous')

    expect(LunchUserResponse.all.map(&:user_name).sort).to eq(['Josh Smith', 'Just Bob', 'Anonymous'].sort)
  end
end