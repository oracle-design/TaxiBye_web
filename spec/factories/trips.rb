# == Schema Information
#
# Table name: trips
#
#  id                :integer          not null, primary key
#  started_at        :datetime
#  ended_at          :datetime
#  route             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  taxi_plate_number :string
#

FactoryGirl.define do
  factory :trip do
    started_at "2017-01-26 02:20:46"
    ended_at "2017-01-26 02:20:46"
    route "MyString"
    taxi nil
  end
end
