function love.load() -- loads all we need in game
  -- set color for our shapes RGB
  love.graphics.setColor(0, 0, 0, 255)

  -- set background color RGB
  love.graphics.setBackgroundColor(225, 153, 0)
end

function love.draw() -- function to display/draw content to screen
  -- draw circle with params(mode, x-pos, y-pos, radius, segments)
  love.graphics.circle("fill", 100, 150, 25, 25)

  -- draw rectangle with params(mode, x-pos, y-pos, width, heigth)
  love.graphics.rectangle("fill", 150, 150, 50, 50)

  -- draw an arc with params(mode, x-pos, y-pos, radius, angle1, angle2)
  love.graphics.arc("fill", 225, 150, 50, math.pi/5, math.pi/2)
end
