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
PosYDracula = 200
PosXtxt = 100
PosYimg = 400
PosXRey = 100
PosYRey = 100
-- Texto
NombreJugador = "Jugador 1"
RangoJugador = "Junior"
-- Banderas
PuedoDibujar = true
ActivarDoctor = false
-- Tiempo
Tiempo = 0
-- =================== INICIALIZACION ===================
function love.load()
    NombreJugador = "El MejorJugador"
    ImgArgentino = love.graphics.newImage("Argentino.jpeg")
    ImgDracula = love.graphics.newImage("Dracula.jpeg")
    ImgDoctor = love.graphics.newImage("Doctor.jpeg")
    ImgRey = love.graphics.newImage("Rey.jpeg")
    Tiempo = 0
end
-- =================== INTERACCION ===================
function love.keypressed(key, scancode, isrepeat)
   if key == "d" then
      ActivarDoctor = true
   end
end

function love.keyreleased(key)
   if key == "d" then
      ActivarDoctor = false
   end
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then 
       PosXRey = x - 100
       PosYRey = y - 100
    end
end
-- =================== ACTUALIZACION ===================
function love.update(dt)
    PosXtxt = PosXtxt + 1
  
    if PosXArgentino < PosXDracula then
        PosXArgentino = PosXArgentino + (400 * dt)
    else
        PosXArgentino = 0
    end

    Tiempo = Tiempo + dt
    if Tiempo > 2 then
        PuedoDibujar = false
    end

    if love.keyboard.isDown("left") then
        PosXDracula = PosXDracula - (100 * dt)
    end

    if love.keyboard.isDown("right") then
        PosXDracula = PosXDracula + (100 * dt)
    end

    if love.keyboard.isDown("up") then
        PosYDracula = PosYDracula - (100 * dt)
    end

    if love.keyboard.isDown("down") then
         PosYDracula = PosYDracula + (100 * dt)
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
    love.graphics.draw(ImgDracula, PosXDracula,PosYDracula,0,0.25,0.25)
    if ActivarDoctor then
        love.graphics.draw(ImgDoctor, 0,0,0,0.25,0.25)
    end
    love.graphics.draw(ImgRey, PosXRey,PosYRey,0,0.25,0.25)
end