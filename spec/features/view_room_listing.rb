feature 'checks if the page contains a list of the rooms' do
  scenario 'browse to the room lisitng page and see a room on the list' do
    visit '/rooms'
    expect(page).to have_content "Jaabir's bedroom"
  end
end