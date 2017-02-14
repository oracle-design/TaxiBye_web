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

class Rating < ApplicationRecord
  belongs_to :trip
  belongs_to :feeling, class_name: 'Trip::Feeling', foreign_key: 'trip_feeling_id'

  scope :limited_ratings, ->(limit_number) { limit(limit_number) }
end
