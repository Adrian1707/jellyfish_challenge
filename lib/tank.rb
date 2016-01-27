class Tank

  attr_reader :size, :tank_points, :fish

  def initialize(size=51)
    @size = size
    @tank_points =[]
    @fish = []
    create_tank
  end


  private

  def create_tank
    (0...size).each do |x|
      (0...size).each do |y|
        @tank_points << [x,y]
      end
    end
    @tank_points.reverse!
  end

end


# tank = Tank.new

# print tank.tank_points
