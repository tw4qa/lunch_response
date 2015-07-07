require 'rails_helper'

describe Statistic do

  before :each do
    LunchUserResponse.create(year: 2015,
       month: 8, day: 23,
       vote: 1, user_name: 'Josh Smith', comment: 'Bad really')
    
    LunchUserResponse.create(year: 2015,
       month: 8, day: 23,
       vote: 2, user_name: 'Bob Big', comment: 'Bad really')

    LunchUserResponse.create(year: 2015,
       month: 8, day: 23,
       vote: 3, user_name: 'Vitaly T', comment: 'So so')

    LunchUserResponse.create(year: 2015,
       month: 8, day: 23,
       vote: 0, user_name: 'Alex Zh', comment: 'Bad really')

    LunchUserResponse.create(year: 2015,
       month: 8, day: 23,
       vote: 5, user_name: 'Viktor K', comment: 'Good !!!')

    LunchUserResponse.create(year: 2015,
       month: 8, day: 23,
       vote: 4, user_name: 'Ivan Ko', comment: 'Not Bad')

    LunchUserResponse.create(year: 2015,
       month: 8, day: 23,
       vote: 4, user_name: 'Bob Bimba', comment: 'Not Bad')

    LunchUserResponse.create(year: 2015,
       month: 8, day: 24,
       vote: 1, user_name: 'Josh Smith', comment: 'Bad really')

    LunchUserResponse.create(year: 2015,
       month: 7, day: 23,
       vote: 2, user_name: 'Josh Smith', comment: 'Bad really')
  end

  it 'should calculate' do
    st = Statistic.new(year: 2015, month: 8, day: 23)

    st.calculate!
    expect(st.votes_count).to eq(7)
    expect(st.average).to be(2.71)
    expect(st.votes_stats).to eq({'Worst'=>1, 'Bad'=>1, 'So so'=>1, 'Not bad'=>1, 'Good'=>2, 'Best'=>1})
  end
end