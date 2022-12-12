class Triangle
  attr_accessor :side_a, :side_b, :side_c, :kind

  def initialize(a, b, c)
    @side_a = a
    @side_b = b
    @side_c = c
  end

  def kind
    if (@side_a == 0 || @side_b == 0 || @side_c == 0)
      raise TriangleError
    elsif(@side_a < 0 || @side_b < 0 || @side_c < 0)
      raise TriangleError
    elsif(@side_a + @side_b <= @side_c || @side_b + @side_c <= @side_a || @side_c + @side_a <= @side_b)
      raise TriangleError
    elsif (@side_a == @side_b && @side_b == @side_c)
      :equilateral
    elsif ([@side_a, @side_b, @side_c].uniq.length == 2)
      :isosceles
    elsif (@side_a != @side_b && @side_b != @side_c)
      :scalene
    end
  end

  class TriangleError < StandardError
    def message
      "triangle cannot have a size of zero"
    end
  end
end
