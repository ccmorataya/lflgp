local Quad = love.graphics.newQuad

function love.load()
  sprite = love.graphics.newImage("sprite.png")
  quads = {}
  quads["right"] = {}
  for index=1,8 do
    quads["right"][index] = Quad( (index-1)*32, 0, 32, 32, 256, 32 );
  end

end

function love.draw()
  -- CM:: replace the deprecated flip function drawing in the x axis with the params:
  --      sprite = the sprite obj
  --      quad = the desired quad
  --      x = the sprite x position + sprite width size
  --      y = the sprite y position
  --      radians = the sprite radian value to rotate
  --      xs = the sprite x scale factor in negative value
  --      ys = the sprite y scale factor
  love.graphics.draw(sprite, quads["right"][1], 50+32, 50, 0, -1, 1)
end
