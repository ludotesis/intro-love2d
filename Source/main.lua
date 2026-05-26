-- =================== DECLARACION ===================
-- Jugador
Jugador = {
    x = 100,
    y = 400,
    ancho = 125,
    alto = 125,
    vel = 150,
    sprite = nil,
    anim_attack = {},
    anim_correr = {},
    index_anim_attack = 1,
    index_anim_correr = 1,
    anim_attack_dur = 5,
    anim_correr_dur = 7,
    anim_attack_vel = 10,
    anim_correr_vel = 14,
    atacando = false
}
-- Imagenes
Spritesheet = nil
-- =================== INICIALIZACION ===================
function love.load()
    -- Cargar Tabla Animacion Ataque
    --table.insert(Jugador.anim_attack,love.graphics.newImage("img/ataque/frame1.png"))   -- 1
    --table.insert(Jugador.anim_attack,love.graphics.newImage("img/ataque/frame2.png"))   -- 2
    --table.insert(Jugador.anim_attack,love.graphics.newImage("img/ataque/frame3.png"))   -- 3
    --table.insert(Jugador.anim_attack,love.graphics.newImage("img/ataque/frame4.png"))   -- 4
    -- Cargar Tabla Animacion Ataque con For
    for i = 1, 4 do
        table.insert(Jugador.anim_attack, love.graphics.newImage("img/ataque/frame" .. i .. ".png"))
    end
    -- Cargar Tabla Animacion Correr
    Spritesheet = love.graphics.newImage("img/Correr.png")
    --table.insert(Jugador.anim_correr, love.graphics.newQuad(192 * 0 ,0,192,192, Spritesheet))   -- 1
    --table.insert(Jugador.anim_correr,love.graphics.newQuad(192 * 1 ,0,192,192, Spritesheet))    -- 2
    --table.insert(Jugador.anim_correr,love.graphics.newQuad(192 * 2 ,0,192,192, Spritesheet))    -- 3
    --table.insert(Jugador.anim_correr,love.graphics.newQuad(192 * 3 ,0,192,192, Spritesheet))    -- 4
    --table.insert(Jugador.anim_correr,love.graphics.newQuad(192 * 4 ,0,192,192, Spritesheet))    -- 5
    --table.insert(Jugador.anim_correr,love.graphics.newQuad(192 * 5 ,0,192,192, Spritesheet))    -- 6
    for i = 0, 5, 1 do
       table.insert(Jugador.anim_correr, love.graphics.newQuad(192 * i ,0,192,192, Spritesheet))
    end
end
-- =================== INTERACCION ===================
function love.keypressed(key, scancode, isrepeat)
   if key == "space" and not Jugador.atacando then
      Jugador.atacando = true
   end
end
-- =================== ACTUALIZACION ===================
function love.update(dt)
    --[[
    -- Avanzar indices en cada frame
    Jugador.index_anim_attack = Jugador.index_anim_attack + (Jugador.anim_attack_vel * dt)
    Jugador.index_anim_correr = Jugador.index_anim_correr + (Jugador.anim_attack_vel * dt)
    -- Reiniciar indices si alcanzaron duracion
    if Jugador.index_anim_attack >= #Jugador.anim_attack + 1 then
        Jugador.index_anim_attack = 1
    end

    
    ]]

    if Jugador.atacando then
        Jugador.index_anim_attack = Jugador.index_anim_attack + (Jugador.anim_attack_vel * dt)
        if Jugador.index_anim_attack >= #Jugador.anim_attack + 1 then
            Jugador.index_anim_attack = 1
        end
    else
        Jugador.index_anim_correr = Jugador.index_anim_correr + (Jugador.anim_attack_vel * dt)
        if Jugador.index_anim_correr >= #Jugador.anim_correr + 1 then
            Jugador.index_anim_correr = 1
        end
    end

    
end
-- =================== RENDERIZADO ===================
function love.draw()
    -- Redondear indices 
    local indiceAttack = math.floor(Jugador.index_anim_attack)
    local indiceCorrer = math.floor(Jugador.index_anim_correr)
    -- Dibujar con indice
    love.graphics.draw(Jugador.anim_attack[indiceAttack], Jugador.x, Jugador.y)
    love.graphics.draw(Spritesheet,Jugador.anim_correr[indiceCorrer], Jugador.x, Jugador.y - Jugador.ancho)
    -- Ver Longitud Tablas
    love.graphics.printf("Frames Anim Correr "..#Jugador.anim_correr,300, 300, 200,"center")
    love.graphics.printf("Frames Anim Attack "..#Jugador.anim_attack,300, 500, 200,"center")
end
