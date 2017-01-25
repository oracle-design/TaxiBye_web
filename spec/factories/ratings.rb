# == Schema Information
#
# Table name: ratings
#
#  id              :integer          not null, primary key
#  score           :decimal(, )
#  message         :text
#  trip_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  trip_feeling_id :integer
#

FactoryGirl.define do
  factory :rating do
    score "9.99"
    message "MyText"
    trip nil
  end
end
