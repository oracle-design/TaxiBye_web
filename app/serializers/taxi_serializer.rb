class TaxiSerializer < ActiveModel::Serializer
  attributes :plate_number, :driver, :avg_rating, :updated_at

  def updated_at
    object.updated_at.to_i
  end
end
