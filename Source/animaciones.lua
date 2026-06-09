--[[
    sfx = {
   quads = {},
   spritesheet = nil,
   indice = 1,
   velocidad = 10
}

sfx.spritesheet = love.graphics.newImage("img/efectos/Explosion.png")
for i = 0, 9, 1 do
   table.insert(sfx.quads, love.graphics.newQuad(192 * i ,0,192,192,  sfx.spritesheet))
end

]]

function CrearAnimacion(tabla, imagen, cantidad_quads, ancho, velocidad)
    tabla.spritesheet = love.graphics.newImage(imagen)
    tabla.indice = 1
    tabla.velocidad = velocidad
    tabla.quads = {}
    for i = 0, cantidad_quads, 1 do
        table.insert(tabla.quads, love.graphics.newQuad(ancho * i ,0,ancho,ancho, tabla.spritesheet))
    end
end

--[[
 sfx.indice = sfx.indice + (sfx.velocidad * dt)
   if sfx.indice >= #sfx.quads + 1 then
      sfx.indice = 1
   end
]]

function ActualizarAnimacion(tabla,dt)
   tabla.indice = tabla.indice + (tabla.velocidad * dt)
   if tabla.indice >= #tabla.quads + 1 then
      tabla.indice = 1
   end
end