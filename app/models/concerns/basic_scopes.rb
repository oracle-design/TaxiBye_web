module BasicScopes
  extend ActiveSupport::Concern

  def self.included(klass)
    klass.instance_eval do
      scope :recent, -> { order(created_at: :desc) }
    end
  end
end
