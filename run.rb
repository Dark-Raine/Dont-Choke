require 'ruby2d'
# require './player.rb'
require_relative 'TileGen.rb'
GRID_SIZE = 20
GRID_HEIGHT = Window.height
GRID_WIDTH = Window.width

score = 0
seconds = 0


test_tile = TileGen.new

update do
  clear
  if TileGen.all.length < 30
    seconds += 1
    if seconds == 65
      # puts seconds
      if score > 0
        score -= 1
      end
      test_tile = TileGen.new
      seconds = 0
    end


    Text.new('Score:', x:1, y:1, color: 'green', size:35, z: 10)
    Text.new(score.to_s, x:105, y:1, color: 'green', size:35, z: 10)
    test_tile.draw
  else
    Text.new('Game Over', x:GRID_WIDTH/3, y:GRID_HEIGHT/4, color: 'green', size:35, z: 10)
    Text.new('Final Score', x:GRID_WIDTH/3, y:GRID_HEIGHT/3, color: 'green', size:35, z: 10)
    Text.new(score.to_s, x:GRID_WIDTH/2.25, y:GRID_HEIGHT/2.5, color: 'green', size:35, z: 10)
  end

end



on :key_down do |event|
  if event.key == test_tile.tile_letter
    score += 1
    test_tile = TileGen.new
    seconds = 0
  else
    if score > 0
      score -= 1
      test_tile = TileGen.new
      seconds = 0
    end
  end
end

# on :key_up do |event|
#   player.direction = nil
# end

show