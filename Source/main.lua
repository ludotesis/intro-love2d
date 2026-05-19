-- =================== DECLARACION ===================
-- Caballero
Caballero = {
    x = 100,
    y = 400,
    ancho = 125,
    alto = 125,
    vel = 150,
    --sprite = nil
    frames = {}
}
-- =================== INICIALIZACION ===================
function love.load()
    --Caballero.sprite = love.graphics.newImage("img/ataque/frame1.png")
    table.insert(Caballero.frames, love.graphics.newImage("img/ataque/frame1.png"))
end
-- =================== RENDERIZADO ===================
function love.draw()
    love.graphics.draw(Caballero.frames[1], Caballero.x, Caballero.y)
end