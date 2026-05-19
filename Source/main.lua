-- =================== DECLARACION ===================
-- Jugador
Jugador = {
    x = 100,
    y = 400,
    ancho = 125,
    alto = 125,
    vel = 150,
    sprite = nil
}
-- =================== INICIALIZACION ===================
function love.load()
    Jugador.sprite = love.graphics.newImage("img/ataque/frame1.png")
end
-- =================== RENDERIZADO ===================
function love.draw()
    love.graphics.draw(Jugador.sprite, Jugador.x, Jugador.y)
end