feature 'the website is connectable' do
  scenario 'browse to the test page' do
    visit '/test'
    expect(page).to have_content "Testing..."
  end
end