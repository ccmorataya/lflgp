-- variables
local angle = 0
local width = 10
local height = 10
local x, y = 0

function love.load() -- loads all we need in game
  -- set background color RGB
  love.graphics.setBackgroundColor(225, 153, 0)
end

function love.draw() -- function to display/draw content to screen
  -- debug
  love.graphics.print("CM::angle: " .. tostring(angle), 10, 10)
  love.graphics.print("CM::x: " .. tostring(x), 10, 30)
  -- rotate
  love.graphics.rotate(angle)

  -- draw a blue rectangle
  love.graphics.setColor(0, 0, 255, 255)
  love.graphics.rectangle("fill", 150, 200, width, height)
end

-- update
function love.update(dt)
  -- store the touch screen interaction
  local touches = love.touch.getTouches()

  for i, id in ipairs(touches) do
    x, y = love.touch.getPosition(id)

    -- on right press, rotate to right
    if x > ( love.graphics.getWidth() /2 ) then
      angle = angle + math.pi * dt
      -- on left press, rotate to left
    elseif x < ( love.graphics.getWidth() /2 ) then
      angle = angle - math.pi * dt
    end
  end

end
