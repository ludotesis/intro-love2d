-- =================== DECLARACION ===================
-- Caballero
Caballero = {
    x = 100,
    y = 400,
    ancho = 125,
    alto = 125,
    vel = 150,
    frames = {},
    indice = 4,
    sprite = nil
}
-- =================== INICIALIZACION ===================
function love.load()
    table.insert(Caballero.frames, love.graphics.newImage("img/ataque/frame1.png"))
    table.insert(Caballero.frames, love.graphics.newImage("img/ataque/frame2.png"))
    table.insert(Caballero.frames, love.graphics.newImage("img/ataque/frame3.png"))
    table.insert(Caballero.frames, love.graphics.newImage("img/ataque/frame4.png"))
    Caballero.sprite = Caballero.frames[Caballero.indice]
end
-- =================== RENDERIZADO ===================
function love.draw()
    love.graphics.draw(Caballero.sprite, Caballero.x, Caballero.y)
end