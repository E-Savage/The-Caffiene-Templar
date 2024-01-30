
function love.load()
    anim8 = require 'libraries/anim8'

    love.graphics.setDefaultFilter("nearest", "nearest")
    player = {}
    player.x = 400
    player.y = 200
    player.speed = 2
    player.sprite = love.graphics.newImage("gamesprites/coffeeKnight/CoffeeKnight.png")
    player.spriteSheet = love.graphics.newImage("gamesprites/coffeeKnight/CoffeeKnightWalkV1.png")
    player.grid = anim8.newGrid(16, 16, player.spriteSheet:getWidth(),  player.spriteSheet:getHeight())

    player.animations = {}

    -- Create other animations this is the first test to see what the animation looks like
    player.animations.down = anim8.newAnimation( player.grid('1-4', 1), 0.2)
end

function love.update(dt)
    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed
    end
    
    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed
    end

    if love.keyboard.isDown("up") then
        player.y = player.y - player.speed
    end

    if love.keyboard.isDown("down") then
        player.y = player.y + player.speed
    end

end

function love.draw()
    -- Set Background Color to #1b8724 (27, 135, 36)
    -- Note: Remember that Love uses 0-1 and not 0-255
    red = 27/255
    green = 135/255
    blue = 36/255
    color = { red, green, blue}
    love.graphics.setBackgroundColor( color)

    love.graphics.draw(player.sprite, player.x, player.y, 0, 8, 8)

end



