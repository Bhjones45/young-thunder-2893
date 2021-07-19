require 'rails_helper'

RSpec.describe 'movie show page' do
  it 'can show list of all movies with attributes' do
      studio = Studio.create!(name: 'Warner Bros.', location: "Burbank, California")
      movie = studio.movies.create!(title: 'Matrix', creation_year: '1999', genre: 'Science Fiction')
      actor_1 = Actor.create!(name: "Carrie-Anne", age: "29")
      actor_2 = Actor.create!(name: "Keanu", age: "28")
      actor_3 = Actor.create!(name: "Laurence", age: "42")
      ActorMovie.create!(movie: movie, actor: actor_1)
      ActorMovie.create!(movie: movie, actor: actor_2)
      ActorMovie.create!(movie: movie, actor: actor_3)

      visit "/movies/#{movie.id}"

      expect(page).to have_content('Matrix')
      expect(page).to have_content('1999')
      expect(page).to have_content('Science Fiction')
      expect(actor_2.name).to appear_before(actor_1.name)
      expect(page).to have_content('Average age: 33')
    end

    it 'can see form to add an actor to movie' do
      studio = Studio.create!(name: 'Warner Bros.', location: "Burbank, California")
      movie = studio.movies.create!(title: 'Matrix', creation_year: '1999', genre: 'Science Fiction')
      actor_1 = Actor.create!(name: "Carrie-Anne", age: "29")
      actor_2 = Actor.create!(name: "Keanu", age: "28")
      actor_3 = Actor.create!(name: "Laurence Fishburne", age: "42")

      visit "/movies/#{movie.id}"

      fill_in :name, with: 'Hugo'
      click_button 'Add Actor'

      expect(page).to have_content("Hugo")
    end
end
