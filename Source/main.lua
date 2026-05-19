-- =================== DECLARACION ===================
-- Caballero
Caballero = {
    x = 100,
    y = 400,
    ancho = 125,
    alto = 125,
    vel = 150,
    frames = {},
    indice = 1,
    sprite = nil,
    spritesheet = nil,
    quads = {}
}
-- =================== INICIALIZACION ===================
function love.load()
    --table.insert(Caballero.frames, love.graphics.newImage("img/ataque/frame1.png"))
    --table.insert(Caballero.frames, love.graphics.newImage("img/ataque/frame2.png"))
    --table.insert(Caballero.frames, love.graphics.newImage("img/ataque/frame3.png"))
    --table.insert(Caballero.frames, love.graphics.newImage("img/ataque/frame4.png"))
    --[[
    for i=1,4 do
        table.insert(Caballero.frames, love.graphics.newImage("img/ataque/frame"..i..".png"))
    end
    ]]--
    Caballero.spritesheet = love.graphics.newImage("img/Correr.png")
    --quad1 = love.graphics.newQuad(0,0,192,192, Caballero.spritesheet)
    for i=0,5 do
        table.insert(Caballero.quads, love.graphics.newQuad(192 * i,0,192,192, Caballero.spritesheet))
    end
end
-- =================== ACTUALIZACION ===================
function love.update(dt)
    Caballero.indice = Caballero.indice + 5 * dt
    if Caballero.indice >= 4 then
       Caballero.indice = 1
    end
end
-- =================== RENDERIZADO ===================
function love.draw()
    --local indiceEntero = math.floor(Caballero.indice)
    --Caballero.sprite = Caballero.frames[indiceEntero]
    love.graphics.draw(Caballero.spritesheet, quad1, Caballero.x, Caballero.y)
    love.graphics.draw(Caballero.spritesheet, quad2, Caballero.x + 192, Caballero.y)
    love.graphics.draw(Caballero.spritesheet, quad3, Caballero.x + 192 * 2, Caballero.y)
end