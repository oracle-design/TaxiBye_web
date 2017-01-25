# == Schema Information
#
# Table name: taxis
#
#  plate_number :string           not null
#  driver       :string           default("")
#  avg_rating   :decimal(3, 1)    default(0.0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :taxi do
    plate_number "MyString"
    driver "MyString"
    avg_rating "9.99"
  end
end
