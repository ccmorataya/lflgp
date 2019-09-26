local Quad = love.graphics.newQuad
keyValue = ""

function love.load()
  love.graphics.setColor(255, 191, 0)
  love.keyboard.setTextInput(true)
  character = {}
  character.player = love.graphics.newImage("sprite.png")
  character.x = 50
  character.y = 50
  direction = "right"
  iteration = 1

  max = 8

  idle = true
  timer = 0.1
  quads = {}
  quads["right"] = {}
  for index=1,8 do
    quads["right"][index] = Quad( (index-1)*32, 0, 32, 32, 256, 32 );
  end
end

function love.update(dt)
  if idle == false then
    timer = timer + dt
    if timer > 0.2 then
      timer = 0.1
      iteration = iteration + 1
      -- CM:: replace this snippet with touch validations
      if love.keyboard.isDown("right") then
        keyValue = 'R'
        character.x = character.x + 5
      end
      if love.keyboard.isDown("left") then
        keyValue = 'L'
        character.x = character.x - 5
      end
      if iteration > max then
        iteration = 1
      end
      -- CM:: end of replace
    end
  end
end

-- CM:: replace this snippet with touch validations
function love.keypressed(key)
  keyValue = key
  if quads[key] then
    direction = key
    idle = false
  end
end

-- CM:: replace this snippet with touch validations
function love.keyreleased(key)
  if quads[key] and direction == key then
    idle = true
    iteration = 1
    direction = "right"
  end
end

function love.draw()
  love.graphics.print("CM::keyValue: " .. keyValue)
  love.graphics.print("CM::idleValue: " .. tostring(idle), 0, 100)
  love.graphics.draw(character.player, quads[direction][iteration], character.x, character.y)
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
