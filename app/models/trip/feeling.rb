# == Schema Information
#
# Table name: trip_feelings
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Trip::Feeling < ApplicationRecord
  belongs_to :rating
end
