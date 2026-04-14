-- =================== DECLARACION ===================
-- Imagenes
ImgArgentino = nil
ImgDevil = nil
ImgDoctor = nil
ImgRey = nil
ImgDracula= nil
-- Posiciones
PosXArgentino = 0
PosXDracula = 600
PosXtxt = 100
PosYimg = 400
-- Texto
NombreJugador = "Jugador 1"
RangoJugador = "Junior"
-- Banderas
PuedoDibujar = true
-- Tiempo
Tiempo = 0
-- =================== INICIALIZACION ===================
function love.load()
    NombreJugador = "El MejorJugador"
    ImgArgentino = love.graphics.newImage("Argentino.jpeg")
    ImgDracula = love.graphics.newImage("Dracula.jpeg")
    Tiempo = 0
end
-- =================== ACTUALIZACION ===================
function love.update(dt)
    PosXtxt = PosXtxt + 1
    --imgPosY = imgPosY - (500 * dt)
    if PosXArgentino < PosXDracula then
        PosXArgentino = PosXArgentino + (400 * dt)
    else
        PosXArgentino = 0
    end

    Tiempo = Tiempo + dt
    if Tiempo > 2 then
        PuedoDibujar = false
    end
end
-- =================== RENDERIZADO ===================
function love.draw()
    love.graphics.print("Posicion X Argentino "..PosXArgentino, 250, 50)
    love.graphics.print("Tiempo Acumulado "..Tiempo, 250, 100)
    if PuedoDibujar then
        love.graphics.print("CONDICIONAL", PosXtxt, 200)
    end
    love.graphics.print(RangoJugador.." "..NombreJugador, PosXtxt, 300)
    love.graphics.draw(ImgArgentino, PosXArgentino, PosYimg,0,0.25,0.25)
    love.graphics.draw(ImgDracula, PosXDracula,200,0,0.25,0.25)
end