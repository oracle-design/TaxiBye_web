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

class Trip < ApplicationRecord
  belongs_to :taxi, foreign_key: 'taxi_plate_number'
  has_one :rating
end
