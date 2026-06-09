require('sonido')
require('jugador')
require('animaciones')
-- =================== DECLARACION ===================
sfx_explosion = {}
sfx_fuego = {}
sfx_agua = {}
-- =================== INICIALIZACION ===================
function love.load()
   InicializarJugador()
   --CargarSonidos()
   --ConfigurarSonidos()
   CrearAnimacion(sfx_explosion,"img/efectos/Explosion.png", 9,192, 10)
   CrearAnimacion(sfx_agua,"img/efectos/Agua.png", 9,192, 10)
   CrearAnimacion(sfx_fuego,"img/efectos/Fuego.png", 12,64, 12)
end
-- =================== INTERACCION ===================
function love.keypressed(key, scancode, isrepeat)
   InteraccionJugador(key)
end
-- =================== ACTUALIZACION ===================
function love.update(dt)
   ActualizarJugador(dt)
   ReproducirUnaVez(sfx_explosion,dt)
   ActualizarAnimacion(sfx_agua, dt)
   ReproducirUnaVez(sfx_fuego,dt)
end
-- =================== RENDERIZADO ===================
function love.draw()
   DibujarJugador()
   DibujarAnimacion(sfx_explosion, Jugador.x + 100, Jugador.y)
   DibujarAnimacion(sfx_agua, Jugador.x + 200, Jugador.y)
   DibujarAnimacion(sfx_fuego, Jugador.x + 400, Jugador.y)
end
