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

require 'rails_helper'

RSpec.describe Rating, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
