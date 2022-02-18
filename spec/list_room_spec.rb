require 'list_room'

describe List_Room do
  it 'shows list of rooms which has been added' do
    conn = PG.connect(dbname: 'makersbnb')

    expect(List_Room.create_room).to include "sapna", "nice cosy room", 100, "high street", "newcastle", "north tyne side", "ne1 1ad"
  end
end