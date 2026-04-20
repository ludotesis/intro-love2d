-- =================== DECLARACION ===================
-- Imagenes
ImgArgentino = nil
ImgDracula = nil
-- Caja Jugador
Jugador_x = 100
Jugador_y = 400
Jugador_alto  = 125
Jugador_ancho = 125
-- Caja Enemigo
Enemigo_x = 400
Enemigo_y = 400
Enemigo_alto  = 125
Enemigo_ancho = 125
-- =================== INICIALIZACION ===================
function love.load()
    ImgArgentino = love.graphics.newImage("Argentino.png")
    ImgDracula = love.graphics.newImage("Dracula.png")
end
-- =================== ACTUALIZACION ===================
function love.update(dt)
    if love.keyboard.isDown("left") then
        Jugador_x = Jugador_x - (100 * dt)
    end

    if love.keyboard.isDown("right") then
        Jugador_x = Jugador_x + (100 * dt)
    end

    if love.keyboard.isDown("up") then
       Jugador_y = Jugador_y - (100 * dt)
    end

    if love.keyboard.isDown("down") then
         Jugador_y = Jugador_y + (100 * dt)
    end
end
-- =================== RENDERIZADO ===================
function love.draw()
     -- Depurar
    love.graphics.setColor(1,0, 0)
    love.graphics.rectangle("line", Enemigo_x, Enemigo_y, Enemigo_ancho, Enemigo_alto)
    love.graphics.rectangle("line", Jugador_x, Jugador_y, Jugador_ancho, Jugador_alto)
    
    love.graphics.setColor(1,1, 1)
    love.graphics.draw(ImgDracula, Enemigo_x,Enemigo_y)
    love.graphics.draw(ImgArgentino, Jugador_x,Jugador_y)
end