local Quad = love.graphics.newQuad
local playerData = love.image.newImageData("sprite.png")
keyValue = ""

function love.load()
  playerData:mapPixel(removeMagenta)
  love.graphics.setColor(255, 191, 0)
  character = {}
  character.player = love.graphics.newImage(playerData)
  character.x = 50
  character.y = 60
  direction = "right"
  iteration = 1

  max = 8

  idle = true
  timer = 0.1
  quads = {}
  quads["right"] = {}
  quads["left"] = {}
  for index=1,8 do
    quads["right"][index] = Quad( (index-1)*32, 0, 32, 32, 256, 32 );
    quads["left"][index] = Quad( (index-1)*32, 0, 32, 32, 256, 32 );
  end
end

function love.update(dt)
  if idle == false then
    timer = timer + dt
    if timer > 0.2 then
      local touches = love.touch.getTouches()

      for i, id in ipairs(touches) do
        x, y = love.touch.getPosition(id)
          if x <= love.graphics.getWidth() / 2 then
              character.x = character.x - 5
          else
              character.x = character.x + 5
          end
      end

      timer = 0.1
      iteration = iteration + 1
      if iteration > max then
        iteration = 1
      end
    end
  end
end

function love.touchpressed(id, x, y, dx, dy, pressure)
  idle = false
  if x <= love.graphics.getWidth() / 2 then
    direction = 'left'
  elseif x > love.graphics.getWidth() / 2 then
    direction = 'right'
  end
end

function love.touchreleased(id, x, y, dx, dy, pressure)
  idle = true
  iteration = 1
  direction = 'right'
end

function love.draw()
  love.graphics.print("CM::idleValue: " .. tostring(idle))
  love.graphics.print("CM::x_value: " .. tostring(x), 0, 20)
  love.graphics.draw(character.player, quads[direction][iteration], (direction == 'right' and character.x or character.x+32), character.y, 0, (direction == 'right' and 1 or -1), 1)
  -- CM:: replace the deprecated flip function drawing in the x axis with the params:
  --      sprite = the sprite obj
  --      quad = the desired quad
  --      x = the sprite x position + sprite width size
  --      y = the sprite y position
  --      radians = the sprite radian value to rotate
  --      xs = the sprite x scale factor in negative value
  --      ys = the sprite y scale factor
  -- love.graphics.draw(sprite, quads["right"][1], 50+32, 50, 0, -1, 1)
end

function removeMagenta(x, y, r, g, b, a)
  if r == 1 and g == 0 and b == 1 then
    a = 0
  end
  return r, g, b, a
end
