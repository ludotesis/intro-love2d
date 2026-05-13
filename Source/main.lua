-- =================== DECLARACION ===================
-- Imagenes
ImgArgentino = nil
ImgDracula = nil
-- Caja Jugador
Jugador = {
    x = 100,
    y = 400,
    ancho = 125,
    alto = 125,
    vel = 150,
    sprite = nil
}
-- Caja Enemigo
Enemigo_x = 0
Enemigo_y = 0
Enemigo_ancho = 125
Enemigo_alto = 125
Enemigo_x_spawn = 400
Enemigo_y_spawn = 150
Enemigo_vivo = true
-- Caja Proyectil
Proyectil_x = 400
Proyectil_y = 400
Proyectil_ancho = 30
Proyectil_alto = 30
Proyectil_vel = 250
Proyectil_activo = false
-- Banderas
gameover = false
victoria = false
-- Banderas de Colision
proyectilEnemigo = false
-- =================== MIS FUNCIONES ===================
function hayColision(x1, y1,ancho1, alto1, x2, y2, ancho2, alto2)
    return  x1 < x2 + ancho2 and
            x2 < x1 + ancho1 and
            y1 < y2 + alto2  and
            y2 < y1 + alto1
end
-- =================== INICIALIZACION ===================
function love.load()
    Jugador.sprite = love.graphics.newImage("Argentino.png")
    ImgDracula = love.graphics.newImage("Dracula.png")

    Enemigo_x = Enemigo_x_spawn
    Enemigo_y = Enemigo_y_spawn
end
-- =================== INTERACCION ===================
function love.mousepressed( x, y, button, istouch, presses )
    if button == 1 then
        --Enemigo_x = x - 62
        --Enemigo_y = y - 62
        Proyectil_activo = true
        Proyectil_x = Jugador.x + (Jugador.ancho / 2)
        Proyectil_y = Jugador.y
    end

    if button == 2 then
        --Enemigo_x = Enemigo_x_spawn
        -- Enemigo_y = Enemigo_y_spawn
        Proyectil_activo = false
    end
end
-- =================== ACTUALIZACION ===================
function love.update(dt)


    if love.keyboard.isDown("left") then
        Jugador.x = Jugador.x - (Jugador.vel * dt)
    end

    if love.keyboard.isDown("right") then
        Jugador.x = Jugador.x + (Jugador.vel * dt)
    end

    if love.keyboard.isDown("up") then
        Jugador.y = Jugador.y - (Jugador.vel * dt)
    end

    if love.keyboard.isDown("down") then
         Jugador.y = Jugador.y + (Jugador.vel * dt)
    end

    gameover = hayColision(Jugador.x,Jugador.y,Jugador.ancho,Jugador.alto, Enemigo_x, Enemigo_y, Enemigo_ancho, Enemigo_alto)
    victoria = hayColision(Jugador.x,
                           Jugador.y,
                           Jugador.ancho,
                           Jugador.alto,
                           100,
                           100,
                           100,
                           100)

    if Enemigo_vivo then
         proyectilEnemigo = hayColision(Proyectil_x,
                          Proyectil_y,
                           Proyectil_ancho,
                           Proyectil_alto,
                           Enemigo_x,
                           Enemigo_y,
                           Enemigo_alto,
                           Enemigo_ancho)
   end
   
    if proyectilEnemigo then
       Enemigo_vivo = false
       Proyectil_activo = false
    end

    if Proyectil_activo then
        Proyectil_y = Proyectil_y - (Proyectil_vel * dt)
    end

    if gameover then
        Jugador_x = 0
        Jugador_y = 0
    end

    if Proyectil_y < 0 then
        Proyectil_x = Jugador.x + (Jugador.ancho / 2)
        Proyectil_y = Jugador.y
    end

end
-- =================== RENDERIZADO ===================
function love.draw()
    
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("line", Jugador.x,Jugador.y, Jugador.ancho, Jugador.alto)
    love.graphics.rectangle("line", Enemigo_x,Enemigo_y, Enemigo_ancho, Enemigo_alto)

    love.graphics.setColor(0,1,0)
    love.graphics.rectangle("fill", 100,100, 100, 100)

    love.graphics.setColor(1,1,1)
    
    love.graphics.draw(Jugador.sprite, Jugador.x, Jugador.y)

    if Enemigo_vivo then
        love.graphics.draw(ImgDracula, Enemigo_x,Enemigo_y)
    end
    
    if Proyectil_activo then
       love.graphics.rectangle("fill", Proyectil_x, Proyectil_y, Proyectil_ancho, Proyectil_alto)
    end

    if gameover then
        love.graphics.print("GAME OVER", 400, 100)
    end

    if victoria then
        love.graphics.print("Victoria", 400, 100)
    end
end