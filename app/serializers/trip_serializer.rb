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
