class CreateTripService
  def initialize(taxi, params, device_id)
    @taxi = taxi
    @params = params
    @device_id = device_id

    normalize_params
  end

  def create_trip!
    @trip = @taxi.trips.create(trip_params)
    @taxi.update_avg_rating
    store_gpx
    @trip.update route: @file_path

    @trip
  end

  def store_gpx
    path = "/uploads/trips/#{@trip.id}/route/"
    file = "#{@trip.created_at.to_i}.gpx"
    @file_path = path + file

    FileUtils.mkdir_p("#{Rails.root}/public#{path}")
    File.open("#{Rails.root}/public#{path}#{file}", 'w') { |file| file.write @route }
  end

  private

  def trip_params
    @params.require(:data).permit(
      :started_at,
      :ended_at,
      rating_attributes: [
        :score,
        :message,
        :trip_feeling_id
      ]
    )
  end

  def route_params
    @params[:data][:route]
  end

  def normalize_params
    @params[:data].transform_keys!(&:underscore)
    @params[:data][:rating_attributes].transform_keys!(&:underscore)
    @params[:data][:started_at] = Time.at(@params[:data][:started_at]).to_s(:db)
    @params[:data][:ended_at] = Time.at(@params[:data][:ended_at]).to_s(:db)
  end
end
