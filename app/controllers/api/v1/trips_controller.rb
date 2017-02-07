class Api::V1::TripsController < Api::V1::BaseController
  def create
    taxi = Taxi.where(plate_number: params[:taxi_license_plate_number]).first_or_create
    user_device_id = request.headers.fetch(:DeviceID, '')

    @trip = taxi.trips.create(trip_params)
    taxi.update_avg_rating

    render json: @trip, include: ['taxi', 'rating']
  end

  private

  def trip_params
    params[:data].transform_keys! {|k| k.underscore}
    params[:data][:rating_attributes].transform_keys! {|k| k.underscore}
    params[:data][:started_at] = Time.at(params[:data][:started_at]).to_s(:db)
    params[:data][:ended_at] = Time.at(params[:data][:ended_at]).to_s(:db)

    params.require(:data).permit(
      :started_at,
      :ended_at,
      :route,
      rating_attributes: [
        :score,
        :message,
        :trip_feeling_id
      ]
    )
  end
end
