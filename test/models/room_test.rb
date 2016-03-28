require "test_helper"

class RoomTest < ActiveSupport::TestCase
  def room
    @room ||= Room.new
  end

  def test_valid
    assert room.valid?
  end
end
