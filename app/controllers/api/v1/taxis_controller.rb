class Api::V1::TaxisController < Api::V1::BaseController
  def ranking
    limit_number = params.fetch(:number, 10)

    @taxis = Taxi.ranking.limit(limit_number)

    render json: @taxis, meta: { limit: limit_number, count: @taxis.count }
  end

  def query
    @taxi = Taxi.where(plate_number: params[:license_plate_number]).first_or_create
  end
end
