# == Schema Information
#
# Table name: trip_feelings
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :trip_feeling, class: 'Trip::Feeling' do
    title "MyString"
  end
end
