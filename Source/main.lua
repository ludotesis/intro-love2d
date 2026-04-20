-- =================== DECLARACION ===================
-- Imagenes
ImgArgentino = nil
ImgDracula = nil
-- Posiciones
Jugador_x = 100
Jugador_y = 400
Enemigo_x = 400
Enemigo_y = 400
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
    love.graphics.draw(ImgDracula, Enemigo_x,Enemigo_y)
    love.graphics.draw(ImgArgentino, Jugador_x,Jugador_y)
end