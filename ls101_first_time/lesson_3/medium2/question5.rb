# How could the unnecessary duplication in this method be removed?

def color_valid(color)
  color == "blue" || color == "green"
end

p color_valid("blue")
p color_valid("green")
p color_valid("red")