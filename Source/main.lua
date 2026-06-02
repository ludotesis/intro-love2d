-- =================== IMPORTAR ===================
require("sonidos")
require("jugador")
-- =================== DECLARACION ===================
-- =================== INICIALIZACION ===================
function love.load()
    CargarSonidos()
    CargarJugador()
end
-- =================== INTERACCION ===================
function love.keypressed(key, scancode, isrepeat)
    InteraccionJugador(key)
end
-- =================== ACTUALIZACION ===================
function love.update(dt)
    ActualizarJugador(dt)
end
-- =================== RENDERIZADO ===================
function love.draw()
    DibujarJugador()
end
