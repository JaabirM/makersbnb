require 'rooms'

describe Rooms do
  it 'shows all rooms' do
    conn = PG.connect(dbname: 'makersbnb')

    expect(Rooms.list_all).to include("nice cosy room")
  end
end