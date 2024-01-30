
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
    player.animations.down = anim8.newAnimation( player.grid('1-3', 1), 0.2)

    -- variable to control the current animation
    player.anim = player.animations.down


end

function love.update(dt)
    local isMoving = false

    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed
        isMoving = true
    end
    
    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed
        isMoving = true
    end

    if love.keyboard.isDown("up") then
        player.y = player.y - player.speed
        isMoving = true
    end

    if love.keyboard.isDown("down") then
        player.y = player.y + player.speed
        player.anim = player.animations.down
        isMoving = true
    end

    if isMoving == false then
        player.anim:gotoFrame(1)
    end


    player.anim:update(dt)
end

function love.draw()
    -- Set Background Color to #1b8724 (27, 135, 36)
    -- Note: Remember that Love uses 0-1 and not 0-255
    red = 27/255
    green = 135/255
    blue = 36/255
    color = { red, green, blue}
    love.graphics.setBackgroundColor( color)

    player.animations.down:draw(player.spriteSheet, player.x, player.y, nil, 10)
end



