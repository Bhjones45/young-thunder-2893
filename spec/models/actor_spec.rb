require 'rails_helper'

RSpec.describe Actor do
  describe "relationships" do
    it { should have_many(:actor_movies) }
    it { should have_many(:movies).through(:actor_movies)}
  end

  describe '::average_age_actors' do
    it 'returns average age of all actors in a movie' do
      studio = Studio.create!(name: 'Warner Bros.', location: "Burbank, California")
      movie = studio.movies.create!(title: 'Matrix', creation_year: '1999', genre: 'Science Fiction')
      actor_1 = Actor.create!(name: "Keanu", age: "28")
      actor_2 = Actor.create!(name: "Carrie-Anne", age: "29")
      actor_3 = Actor.create!(name: "Laurence Fishburne", age: "42")

      expect(Actor.average_age_actors).to eq(33)
    end

    describe "::sorts_actors_age" do
      it 'can sort actors in a movie age' do
        studio = Studio.create!(name: 'Warner Bros.', location: "Burbank, California")
        movie = studio.movies.create!(title: 'Matrix', creation_year: '1999', genre: 'Science Fiction')
        actor_1 = Actor.create!(name: "Carrie-Anne", age: "29")
        actor_2 = Actor.create!(name: "Keanu", age: "28")
        actor_3 = Actor.create!(name: "Laurence Fishburne", age: "42")

        expected = [actor_2, actor_1, actor_3]

        expect(Actor.sorts_actors_age).to eq(expected)
      end
    end
  end
end
