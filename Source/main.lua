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
    sprite = nil
}
-- =================== INICIALIZACION ===================
function love.load()
    table.insert(Caballero.frames, love.graphics.newImage("img/ataque/frame1.png"))
    table.insert(Caballero.frames, love.graphics.newImage("img/ataque/frame2.png"))
    table.insert(Caballero.frames, love.graphics.newImage("img/ataque/frame3.png"))
    table.insert(Caballero.frames, love.graphics.newImage("img/ataque/frame4.png"))
end
-- =================== ACTUALIZACION ===================
function love.update(dt)
    Caballero.indice = Caballero.indice + 10 * dt
    if Caballero.indice >= 4 then
       Caballero.indice = 1
    end
end
-- =================== RENDERIZADO ===================
function love.draw()
    local indiceEntero = math.floor(Caballero.indice)
    Caballero.sprite = Caballero.frames[indiceEntero]
    love.graphics.draw(Caballero.sprite, Caballero.x, Caballero.y)
end