class TaxiDetailSerializer < TaxiSerializer
  has_many :ratings

  def ratings
    Rating.limited_ratings(instance_options.fetch(:ratings_count, 5))
  end
end
