class Tank

  attr_reader :size, :tank_points, :fish, :height, :width, :restricted_zones

  def initialize(height=3, width=5)
    @height = height + 1
    @width = width + 1
    @tank_points =[]
    @fish = []
    @restricted_zones = []
    create_tank
  end



  private

  def create_tank
    (0...width).each do |x|
      (0...height).each do |y|
        @tank_points << [x,y]
      end
    end
    @tank_points.reverse!
  end

end

# tank = Tank.new
# print tank.tank_points
