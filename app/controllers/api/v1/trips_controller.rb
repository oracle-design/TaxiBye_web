class Api::V1::TripsController < Api::V1::BaseController
  def create
    taxi = Taxi.where(plate_number: params[:taxi_license_plate_number]).first_or_create
    user_device_id = request.headers.fetch(:DeviceID, '')

    @trip = CreateTripService.new(taxi, params, user_device_id).create_trip!

    render json: @trip, include: ['taxi', 'rating']
  end
end
