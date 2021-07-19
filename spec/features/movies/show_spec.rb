require 'rails_helper'

RSpec.describe 'movie show page' do
  it 'can show list of all moveis with attributes' do
      studio = Studio.create!(name: 'Warner Bros.', location: "Burbank, California")
      movie = studio.movies.create!(title: 'Matrix', creation_year: '1999', genre: 'Science Fiction')

      visit "/movies/#{movie.id}"
      
      expect(page).to have_content('Matrix')
    end
end
