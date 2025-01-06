function love.load()
    --Libaries/misc
    love.graphics.setDefaultFilter("nearest")
    wf = require "libaries/windfield"
    world = wf.newWorld()

    sti = require "libaries/sti"
    Map1 = sti("maps/Dungeon1.lua")

    --Player

    player = {}
    player.collider = world:newCircleCollider(400,300,32)
    player.sprite = love.graphics.newImage("sprites/player.png")
    player.speed = 200
    player.x = player.collider:getX()
    player.y = player.collider:getY()
    player.angle = 0
    player.wave = 2
    player.bulletTimer = 0
    player.canFire = true

    --Borders 

    borders = {}
    borders.walltop = world:newRectangleCollider(0,-11,1280,10)
    borders.walltop:setType("static")
    borders.wallbottom = world:newRectangleCollider(0,722,1280,10)
    borders.wallbottom:setType("static")
    borders.wallleft = world:newRectangleCollider(-12,0,10,720)
    borders.wallleft:setType("static")
    borders.wallright = world:newRectangleCollider(1282,0,10,720)
    borders.wallright:setType("static")

    --Enemies (We can add/change stats as we please)

    enemies = {}
    enemies.remaning = 0

    function silverKnightSpawner(sprite,x,y)
        SilverKnight = {}
        SilverKnight.sprite = love.graphics.newImage("sprites/Enemy1.png")
        SilverKnight.x = x
        SilverKnight.y = y
        table.insert(enemies,SilverKnight)
    end

    function goldKnightSpawner(sprite,x,y)
        GoldKnight = {}
        GoldKnight.sprite = love.graphics.newImage("sprites/Enemy2.png")
        GoldKnight.x = x
        GoldKnight.y = y
        table.insert(enemies,GoldKnight)
    end


    if player.wave == 1 then
        silverKnightSpawner(sprite,500,230)
        enemies.remaning = 1
    elseif player.wave == 2 then
        silverKnightSpawner(sprite,500,230)
        silverKnightSpawner(sprite,200,100)
        enemies.remaning = 2
    elseif player.wave == 3 then
        goldKnightSpawner(sprite,600,100)
    end

    bullets = {}

    function createBullet(sprite,x,y,direction)
        bullet = {}
        bullet.sprite = love.graphics.newImage("sprites/bullet.png")
        bullet.x = x
        bullet.y = y
        bullet.speed = 300
        bullet.direction = direction
        table.insert(bullets,bullet)
    end


end

function love.update(dt)

    --Movement
    local vx = 0
    local vy = 0

    if love.keyboard.isDown("d") then
        vx = player.speed
        player.angle = 3.14
    elseif love.keyboard.isDown("a") then
        vx = player.speed * -1
        player.angle = 0
    end

    if love.keyboard.isDown("w") then
        vy = player.speed * -1
        player.angle = 1.57
    elseif love.keyboard.isDown("s") then
        vy = player.speed
        player.angle = 4.71
    end

    player.collider:setLinearVelocity(vx,vy)

    --Player update
    player.x = player.collider:getX()
    player.y = player.collider:getY()

    --Timer for shooting
    local delay = 0.25
    if player.canFire == false then
        player.bulletTimer = player.bulletTimer + dt
    end

    if player.bulletTimer >= delay then
        player.canFire = true
        player.bulletTimer = 0
    end

    --Drawing bullet
    if love.keyboard.isDown("up") and player.canFire == true then
        createBullet(sprite,player.x,player.y,"up")
        player.canFire = false
        player.angle = 1.57
    elseif love.keyboard.isDown("down") and player.canFire == true then
        createBullet(sprite,player.x,player.y,"down")
        player.canFire = false
        player.angle = 4.71
    elseif love.keyboard.isDown("left") and player.canFire == true then
        createBullet(sprite,player.x,player.y,"left")
        player.canFire = false
        player.angle = 0
    elseif love.keyboard.isDown("right") and player.canFire == true then
        createBullet(sprite,player.x,player.y,"right")
        player.canFire = false
        player.angle = 3.14
    end

    --


    for i = #bullets, 1, -1 do -- Loop backwards to avoid skipping elements when removing
        local Bullet = bullets[i]

        -- Move the bullet based on its direction
        if Bullet.direction == "up" then
            Bullet.y = Bullet.y - Bullet.speed * dt
        elseif Bullet.direction == "down" then
            Bullet.y = Bullet.y + Bullet.speed * dt
        elseif Bullet.direction == "left" then
            Bullet.x = Bullet.x - Bullet.speed * dt
        elseif Bullet.direction == "right" then
            Bullet.x = Bullet.x + Bullet.speed * dt
        end

        -- Check if the bullet is offscreen
        local screenWidth = love.graphics.getWidth()
        local screenHeight = love.graphics.getHeight()

        if Bullet.x < 0 or Bullet.x > screenWidth or Bullet.y < 0 or Bullet.y > screenHeight then
            table.remove(bullets, i) -- Remove the bullet if offscreen
        end
    end

    --Drawing world hitboxes
    world:update(dt)
end

function love.draw()
    Map1:draw()
    love.graphics.draw(player.sprite,player.x,player.y,player.angle,nil,nil,32,32)
    for i, enemy in ipairs(enemies) do
        love.graphics.draw(enemy.sprite,enemy.x, enemy.y) 
    end

    for i, Bullet in ipairs(bullets) do
        love.graphics.draw(Bullet.sprite,Bullet.x, Bullet.y,nil,nil,nil,8,8) 
    end
    love.graphics.print("Enemies remaning: "..enemies.remaning.."Timer: "..player.bulletTimer)
    world:draw()
end
