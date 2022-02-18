feature 'Booking a Room' do 
  scenario 'A user can book a room' do
    visit('/book_room')
    fill_in('username',with: 'JoKing')
    fill_in('booked_date_from',with: '2022-02-22')
    fill_in('booked_date_to',with: '2022-02-25')
    click_button('Book') 

    expect(page).to have_content 'Your Booking request has been sent'
  end 
end