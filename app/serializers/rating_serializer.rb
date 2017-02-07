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

class RatingSerializer < ActiveModel::Serializer
  attributes :score, :message, :trip_feeling, :updated_at

  def trip_feeling
    object.feeling.title
  end

  def updated_at
    object.updated_at.to_i
  end
end
