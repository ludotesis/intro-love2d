require('sonido')
require('jugador')
require('animaciones')
-- =================== DECLARACION ===================
sfx_explosion = {}
sfx_fuego = {}
sfx_agua = {}

img_particula = nil
particula = nil

alarma = 3
-- =================== INICIALIZACION ===================
function love.load()
   InicializarJugador()
   --CargarSonidos()
   --ConfigurarSonidos()
   CrearAnimacion(sfx_explosion,"img/efectos/Explosion.png", 9,192, 10)
   CrearAnimacion(sfx_agua,"img/efectos/Agua.png", 9,192, 10)
   CrearAnimacion(sfx_fuego,"img/efectos/Fuego.png", 12,64, 12)
   -- Crea Particula
   img_particula = love.graphics.newImage('img/efectos/estrella.png')
   particula = love.graphics.newParticleSystem(img_particula, 32)
   particula:setParticleLifetime(2, 5) -- Particles live at least 2s and at most 5s.
	particula:setEmissionRate(5)
	particula:setSizeVariation(1)
	particula:setLinearAcceleration(-20, -20, 20, 20) -- Random movement in all directions.
	particula:setColors(0, 1, 0, 1,   1, 0, 0, 0)
end
-- =================== INTERACCION ===================
function love.keypressed(key, scancode, isrepeat)
   InteraccionJugador(key)
end
-- =================== ACTUALIZACION ===================
function love.update(dt)
   ActualizarJugador(dt)
   ActualizarAnimacion(sfx_agua, dt)

   alarma = alarma - dt
   if alarma < 0 then
      ReproducirUnaVez(sfx_explosion,dt)
      ReproducirUnaVez(sfx_fuego,dt)
   end

   particula:update(dt)
end
-- =================== RENDERIZADO ===================
function love.draw()
   DibujarJugador()
   DibujarAnimacion(sfx_agua, Jugador.x + 200, Jugador.y)
   if alarma < 0 then
      DibujarAnimacion(sfx_explosion, Jugador.x + 100, Jugador.y)
      DibujarAnimacion(sfx_fuego, Jugador.x + 400, Jugador.y)
   end
   love.graphics.draw(particula, love.graphics.getWidth() * 0.5, love.graphics.getHeight() * 0.5)
end
