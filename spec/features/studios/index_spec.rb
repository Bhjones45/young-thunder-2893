require 'rails_helper'

RSpec.describe 'studio index' do
  it 'can list all the studios with their attributes' do
    studio_1 = Studio.create!(name: 'Warner Bros.', location: "Burbank, California")
    studio_2 = Studio.create!(name: 'Columbia Pictures', location: "Culver City, California")
    studio_1.movies.create(title: "Matrix")
    studio_1.movies.create(title: "Wonder Woman")
    studio_2.movies.create(title: "Ghostbusters")

    visit '/studios'

    expect(page).to have_content(studio_1.name)
    expect(page).to have_content(studio_1.location)
    expect(page).to have_content("Matrix")
    expect(page).to have_content(studio_2.name)
    expect(page).to have_content(studio_2.location)
  end
end
