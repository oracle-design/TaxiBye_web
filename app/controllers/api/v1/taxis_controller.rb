class Api::V1::TaxisController < Api::V1::BaseController
  def show
    @taxi = Taxi.find(params[:license_plate_number])
    ratings_count = params.fetch(:ratingsCount, 5)

    render json: @taxi,
      include: ['ratings'],
      meta: { total_ratings_count: @taxi.ratings.count },
      ratings_count: ratings_count,
      serializer: TaxiDetailSerializer
  end

  def ranking
    limit_number = params.fetch(:number, 10)

    @taxis = Taxi.ranking.limit(limit_number)

    render json: @taxis, meta: { limit: limit_number, count: @taxis.count }
  end

  def query
    @taxi = Taxi.where(plate_number: params[:license_plate_number]).first_or_create

    render json: @taxi
  end
end
