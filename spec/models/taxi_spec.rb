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

require 'rails_helper'

RSpec.describe Taxi, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
