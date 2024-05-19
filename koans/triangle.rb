# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  sides = [a, b, c]
  total = sides.uniq.length

  fail TriangleError unless _triangle_preprocess(sides)

  if total == 1
    :equilateral
  elsif total == 2
    :isosceles
  else
    :scalene
  end
end

# Check is valid triangle
def _triangle_preprocess(sides)
  # base check
  return false if sides[0] <= 0 || sides[1] <= 0 || sides[2] <= 0
  # simple triangle inequality theorem
  return false if sides[0] + sides[1] <= sides[2]
  return false if sides[1] + sides[2] <= sides[0]
  return false if sides[2] + sides[0] <= sides[1]

  true
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
