class Api::V1::TripsController < Api::V1::BaseController
  def create
    taxi = Taxi.find(params[:taxi_license_plate_number])

    # TODO: waiting api doc
  end
end
