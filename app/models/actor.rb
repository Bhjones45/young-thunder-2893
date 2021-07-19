class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.average_age_actors
    average(:age)
  end

  def self.sorts_actors_age
    order(:age)
  end
end
