require 'list_room'
require 'rooms'

describe List_Room do
  it 'shows all rooms' do
    conn = PG.connect(dbname: 'makersbnb')
    List_Room.create_room("sapna", "nice cosy room", 100, 1, "high street", "newcastle", "north tyne side", "ne1 1ad")
    expect(Rooms.list_all).to include "sapna", "nice cosy room", 100.to_s, 1.to_s 
  end
end

