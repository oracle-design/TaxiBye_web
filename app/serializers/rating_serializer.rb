class RatingSerializer < ActiveModel::Serializer
  attributes :score, :message, :trip_feeling, :updated_at

  def trip_feeling
    object.feeling.title
  end

  def updated_at
    object.updated_at.to_i
  end
end
