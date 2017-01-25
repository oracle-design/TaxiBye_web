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

require 'rails_helper'

RSpec.describe Trip, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
