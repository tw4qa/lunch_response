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

  it 'should know vote label' do
    @lr = LunchUserResponse.new(year: 2015, month: 'May', day: 'Tuesday', user_name: 'Anonymous', vote: 0)
    expect(@lr.vote_label).to eq('Worst')

    @lr.vote = 1
    expect(@lr.vote_label).to eq('Bad')

    @lr.vote = 2
    expect(@lr.vote_label).to eq('So so')

    @lr.vote = 3

    expect(@lr.vote_label).to eq('Not bad')

    @lr.vote = 4
    expect(@lr.vote_label).to eq('Good')

    @lr.vote = 5
    expect(@lr.vote_label).to eq('Best')
  end

  it 'should convert vote index' do
    expect(LunchUserResponse.vote_label(5)).to eq('Best')
    expect(LunchUserResponse.vote_label(4)).to eq('Good')
    expect(LunchUserResponse.vote_label(3.6)).to eq('Good')
    expect(LunchUserResponse.vote_label(1.8)).to eq('So so')
    expect(LunchUserResponse.vote_label(4.1)).to eq('Good')
  end

end