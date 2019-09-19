-- variables
local x, y = 0
MOVEMENT = 300

function love.load() -- loads all we need in game
  -- create character table (rectangle shape) with initial position defined in the table
  character = {}
  character.x = 150
  character.y = 200
  -- set background color RGB
  love.graphics.setBackgroundColor(0, 0, 0)
  -- paint the character
  love.graphics.setColor(255, 191, 0, 255)
end

function love.draw() -- function to display/draw content to screen
  -- debug
  love.graphics.print("CM::x_touch: " .. tostring(x), 10, 10)
  love.graphics.print("CM::y_touch: " .. tostring(y), 10, 30)
  love.graphics.print("CM::character_x: " .. tostring(character.x), 10, 50)

  love.graphics.rectangle("fill", character.x, character.y, 50, 50)
end

function love.update(dt)
  -- store the touch screen interaction
  local touches = love.touch.getTouches()
  local oneThree = love.graphics.getWidth() / 3

  for i, id in ipairs(touches) do
    x, y = love.touch.getPosition(id)

    -- on right press, rotate to right
    if x >= ( oneThree * 2 ) and x < love.graphics.getWidth() and y > love.graphics.getHeight() / 2 then
      character.x = character.x + MOVEMENT * dt
      -- on left press, rotate to left
    elseif x < oneThree and y > love.graphics.getHeight() / 2 then
      character.x = character.x - MOVEMENT * dt
    elseif x > oneThree and x < oneThree * 2 and y < love.graphics.getHeight() / 2 then
      character.y = character.y - MOVEMENT * dt
    elseif x > oneThree and x < oneThree * 2 and y > love.graphics.getHeight() / 2 then
      character.y = character.y + MOVEMENT * dt
    end
  end

end
