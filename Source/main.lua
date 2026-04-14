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
nombreJugador = "Jugador 1"
rangoJugador = "Junior"
-- Banderas
puedoDibujar = false
-- Tiempo
tiempo = 0
-- =================== INICIALIZACION ===================
function love.load()
    nombreJugador = "El MejorJugador"
    ImgArgentino = love.graphics.newImage("Argentino.jpeg")
    ImgDracula = love.graphics.newImage("Dracula.jpeg")
    tiempo = 0
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

    tiempo = tiempo + dt
    if tiempo > 2 then
        puedoDibujar = false
    end
end
-- =================== RENDERIZADO ===================
function love.draw()
    love.graphics.print("Posicion X Argentino "..PosXArgentino, 250, 50)
    if true then
        love.graphics.print("CONDICIONAL", PosXtxt, 200)
    end
    love.graphics.print(rangoJugador.." "..nombreJugador, PosXtxt, 300)
    love.graphics.draw(ImgArgentino, PosXArgentino, PosYimg,0,0.25,0.25)
    love.graphics.draw(ImgDracula, PosXDracula,200,0,0.25,0.25)
end