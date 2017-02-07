class Api::V1::Trips::FeelingsController < ApplicationController
  def index
    @feelings = Trip::Feeling.all

    render json: @feelings, meta: { count: @feelings.count, list_updated_at: @feelings.last.updated_at.to_i }
  end
end
