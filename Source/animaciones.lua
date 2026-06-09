-- =================== LIBRERIA ANIMACIONES CON QUADS ===================
-- =================== INICIALIZACION ===================
function CrearAnimacion(tabla, imagen, cantidad_quads, ancho, velocidad)
    tabla.spritesheet = love.graphics.newImage(imagen)
    tabla.indice = 1
    tabla.velocidad = velocidad
    tabla.quads = {}
    tabla.activada = true
    for i = 0, cantidad_quads, 1 do
        table.insert(tabla.quads, love.graphics.newQuad(ancho * i ,0,ancho,ancho, tabla.spritesheet))
    end
end
-- =================== ACTUALIZACION ===================
function ActualizarAnimacion(tabla,dt)
   tabla.indice = tabla.indice + (tabla.velocidad * dt)
   if tabla.indice >= #tabla.quads + 1 then
      tabla.indice = 1
   end
end

function ReproducirUnaVez(tabla,dt)
   tabla.indice = tabla.indice + (tabla.velocidad * dt)
   if tabla.indice >= #tabla.quads + 1 then
      tabla.indice = 1
      tabla.activada = false
   end
end
-- =================== RENDERIZADO ===================
function DibujarAnimacion(tabla, x, y)
    if tabla.activada then
        local i = math.floor(tabla.indice)
        love.graphics.draw(tabla.spritesheet,tabla.quads[i], x, y)
    end
end