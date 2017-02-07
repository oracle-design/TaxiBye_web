# == Schema Information
#
# Table name: trips
#
#  id                :integer          not null, primary key
#  started_at        :datetime
#  ended_at          :datetime
#  route             :string
#  taxi_plate_number :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class TripSerializer < ActiveModel::Serializer
  attributes :started_at, :ended_at, :route, :updated_at

  belongs_to :rating, serializer: RatingSerializer
  belongs_to :taxi

  def started_at
    object.updated_at.to_i
  end

  def ended_at
    object.updated_at.to_i
  end

  def updated_at
    object.updated_at.to_i
  end
end
