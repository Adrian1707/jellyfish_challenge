class Tank

  attr_reader :size, :tank_points

  def initialize(size=51)
    @size = size
    @tank_points =[]
    (0...size).each do |x|
      (0...size).each do |y|
        @tank_points << [x,y]
      end
    end
  end

end
