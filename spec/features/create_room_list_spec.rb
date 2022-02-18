feature 'Creating a new property' do 
  scenario 'A user can create an room listing' do
    visit('/list_room')
    fill_in('room_name',with: 'sapna123')
    fill_in('room_description',with: 'nice cosy room')
    fill_in('price',with: 100)
    fill_in('street',with: 'high street')
    fill_in('city',with: 'newcastle')
    fill_in('county',with: 'north tyne side')
    fill_in('postcode',with: 'ne1 1ad')
    click_button('Submit') 

    expect(page).to have_content 'sapna123'
  end 
end