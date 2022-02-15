feature 'Creating a new account' do 
  scenario 'A user can create an account' do 
    visit('/') 
    fill_in('first_name', with: 'Jo')
    fill_in('second_name', with: 'King')
    fill_in('username', with: 'JoKing')
    fill_in('password', with: 'JoKing123')
    fill_in('email', with: 'JoKing123@gmail.com')
    fill_in('country', with: 'England')
    fill_in('number', with: '12345678912')
    click_button('Submit') 

    expect(page).to have_content 'JoKing'
  end 
end

