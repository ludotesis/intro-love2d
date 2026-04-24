-- =================== DECLARACION ===================
-- Imagenes
ImgArgentino = nil
ImgDracula = nil
-- Caja Jugador
Jugador_x = 100
Jugador_y = 400
Jugador_ancho = 125
Jugador_alto = 125
-- Caja Enemigo
Enemigo_x = 0
Enemigo_y = 0
Enemigo_ancho = 125
Enemigo_alto = 125
Enemigo_x_spawn = 400
Enemigo_y_spawn = 150
Enemigo_vivo = true
-- Banderas
gameover = false
victoria = false
-- =================== MIS FUNCIONES ===================
function hayColision(x1, y1,ancho1, alto1, x2, y2, ancho2, alto2)
    return  x1 < x2 + ancho2 and
            x2 < x1 + ancho1 and
            y1 < y2 + alto2  and
            y2 < y1 + alto1
end
-- =================== INICIALIZACION ===================
function love.load()
    ImgArgentino = love.graphics.newImage("Argentino.png")
    ImgDracula = love.graphics.newImage("Dracula.png")

    Enemigo_x = Enemigo_x_spawn
    Enemigo_y = Enemigo_y_spawn
end
-- =================== INTERACCION ===================
function love.mousepressed( x, y, button, istouch, presses )
    if button == 1 then
        Enemigo_x = x - 62
        Enemigo_y = y - 62
    end

    if button == 2 then
        Enemigo_x = Enemigo_x_spawn
        Enemigo_y = Enemigo_y_spawn
    end
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

    gameover = hayColision(Jugador_x,Jugador_y,Jugador_ancho,Jugador_alto, Enemigo_x, Enemigo_y, Enemigo_ancho, Enemigo_alto)
    victoria = hayColision(Jugador_x,
                           Jugador_y,
                           Jugador_ancho,
                           Jugador_alto,
                           100,
                           100,
                           100,
                           100)
    
    if gameover then
        Jugador_x = 0
        Jugador_y = 0
    end

end
-- =================== RENDERIZADO ===================
function love.draw()
    
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("line", Jugador_x,Jugador_y, Jugador_ancho, Jugador_alto)
    love.graphics.rectangle("line", Enemigo_x,Enemigo_y, Enemigo_ancho, Enemigo_alto)

    love.graphics.setColor(0,1,0)
    love.graphics.rectangle("fill", 100,100, 100, 100)

    love.graphics.setColor(1,1,1)
    love.graphics.draw(ImgDracula, Enemigo_x,Enemigo_y)
    love.graphics.draw(ImgArgentino, Jugador_x, Jugador_y)
    

    if gameover then
        love.graphics.print("GAME OVER", 400, 100)
    end

    if victoria then
        love.graphics.print("Victoria", 400, 100)
    end
end