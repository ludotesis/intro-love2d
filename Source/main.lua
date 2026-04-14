-- DECLARACION
ImgArgentino = nil
ImgDevil = nil
ImgDoctor = nil
ImgRey = nil
ImgDracula= nil

nombreJugador = "Jugador 1"
rangoJugador = "Junior"

txtPosX = 100
imgPosY = 400
imgArgentinoPosX = 0
imgDraculaPosX = 600

puedoDibujar = false

tiempo = 0
-- INICIALIZACION
function love.load()
    nombreJugador = "El MejorJugador"
    ImgArgentino = love.graphics.newImage("Argentino.jpeg")
    ImgDracula = love.graphics.newImage("Dracula.jpeg")
    tiempo = 0
end
-- ACTUALIZACION
function love.update(dt)
    txtPosX = txtPosX + 1
    --imgPosY = imgPosY - (500 * dt)
    if imgArgentinoPosX < imgDraculaPosX then
          imgArgentinoPosX = imgArgentinoPosX + (400 * dt)
    else
        imgArgentinoPosX = 0
    end

    tiempo = tiempo + dt
    if tiempo < 1 then
        
    end
end
-- RENDERIZADO
function love.draw()
    love.graphics.print("Posicion X Argentino "..imgArgentinoPosX, 400, 100)
    if true then
        love.graphics.print("CONDICIONAL", txtPosX, 200)
    end
    love.graphics.print(rangoJugador.." "..nombreJugador, txtPosX, 300)
    love.graphics.draw(ImgArgentino, imgArgentinoPosX, imgPosY,0,0.25,0.25)
    love.graphics.draw(ImgDracula, imgDraculaPosX,200,0,0.25,0.25)
end