# require 'pry'
# require 'ruby2d'
class TileGen 
    GRID_SIZE = 20
    GRID_HEIGHT = Window.height 
    GRID_WIDTH = Window.width 
    @@all = []
    
    attr_reader :x, :y, :tile_letter

    def initialize()
        new_coords = gen_tile
        @x = new_coords[0]
        @y = new_coords[1]
        @tile_letter = gen_tile_letter
        @@all << self
    end

    def gen_tile
        tile_coords = []
        tile_coords << rand(1..GRID_WIDTH-GRID_SIZE)
        tile_coords << rand(1..GRID_HEIGHT-GRID_SIZE)
        tile_coords
    end

    def gen_tile_letter
        ('a'..'z').to_a[rand(26)]
    end
   

    def draw
       Square.new(x: @x, y: @y, size: GRID_SIZE+GRID_SIZE, color: 'white', z:1) 
       Text.new(@tile_letter,x: @x, y: @y, size:GRID_SIZE+GRID_SIZE, z:2, color: 'red')
    #    puts @x, @y
    end

    def self.all
        @@all
    end

end
# binding.pry
# p 'eof'