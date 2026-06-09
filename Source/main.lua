require('sonido')
require('jugador')
require('animaciones')
-- =================== DECLARACION ===================
--[[
sfx = {
   quads = {},
   spritesheet = nil,
   indice = 1,
   velocidad = 10
}
]]
sfx = {}
-- =================== INICIALIZACION ===================
function love.load()
   InicializarJugador()
   --CargarSonidos()
   --ConfigurarSonidos()
   --[[
   sfx.spritesheet = love.graphics.newImage("img/efectos/Explosion.png")
   for i = 0, 9, 1 do
      table.insert(sfx.quads, love.graphics.newQuad(192 * i ,0,192,192,  sfx.spritesheet))
   end
   ]]
   --CrearAnimacion(sfx,"img/efectos/Explosion.png", 9,192, 10)
   --CrearAnimacion(sfx,"img/efectos/Agua.png", 9,192, 10)
   CrearAnimacion(sfx,"img/efectos/Fuego.png", 12,64, 12)
end
-- =================== INTERACCION ===================
function love.keypressed(key, scancode, isrepeat)
   InteraccionJugador(key)
end
-- =================== ACTUALIZACION ===================
function love.update(dt)
   ActualizarJugador(dt)
   sfx.indice = sfx.indice + (sfx.velocidad * dt)
   if sfx.indice >= #sfx.quads + 1 then
      sfx.indice = 1
   end
end
-- =================== RENDERIZADO ===================
function love.draw()
   DibujarJugador()
   local indiceSFX = math.floor(sfx.indice)
   love.graphics.draw(sfx.spritesheet,sfx.quads[indiceSFX], Jugador.x + 50, Jugador.y)
end
