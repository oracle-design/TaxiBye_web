# == Schema Information
#
# Table name: taxis
#
#  plate_number :string           not null, primary key
#  driver       :string           default("")
#  avg_rating   :decimal(3, 1)    default(0.0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class TaxiSerializer < ActiveModel::Serializer
  attributes :plate_number, :driver, :avg_rating, :updated_at

  def updated_at
    object.updated_at.to_i
  end
end
