class StoreRouteToGpxService
  attr_reader :path

  def initialize(trip, route)
    @trip = trip
    @route = route
    @path = "./public/uploads/trips/#{@trip.id}/route/"
    @file = "#{@trip.created_at.to_i}.gpx"
  end

  def store_gpx!
    FileUtils::mkdir_p(@path)
    new_route_file = File.open(@path+@file, 'w') { |file| file.write @route }
  end
end
