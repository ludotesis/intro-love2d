-- =================== DECLARACION ===================
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
    anim_attack_vel = 10,
    anim_correr_vel = 14,
    atacando = false
}
-- Imagenes
Spritesheet = nil
-- =================== INICIALIZACION ===================
function CargarJugador()
     -- Cargar Tabla Animacion Ataque
    for i = 1, 4 do
        table.insert(Jugador.anim_attack, love.graphics.newImage("img/ataque/frame" .. i .. ".png"))
    end
    -- Cargar Tabla Animacion Correr
    Spritesheet = love.graphics.newImage("img/Correr.png")
    for i = 0, 5, 1 do
       table.insert(Jugador.anim_correr, love.graphics.newQuad(192 * i ,0,192,192, Spritesheet))
    end
end
-- =================== INTERACCION ===================
function InteraccionJugador(key)
    if key == "space" and not Jugador.atacando then
      Jugador.atacando = true
      love.audio.stop(sonidos[clave_caminar])
      love.audio.play(sonidos[clave_ataque])
   end
end
-- =================== ACTUALIZACION ===================
function ActualizarJugador(dt)
    if Jugador.atacando then
        Jugador.index_anim_attack = Jugador.index_anim_attack + (Jugador.anim_attack_vel * dt)
        if Jugador.index_anim_attack >= #Jugador.anim_attack + 1 then
            Jugador.index_anim_attack = 1
            Jugador.atacando = false
        end
    else
        Jugador.index_anim_correr = Jugador.index_anim_correr + (Jugador.anim_correr_vel * dt)
        if Jugador.index_anim_correr >= #Jugador.anim_correr + 1 then
            Jugador.index_anim_correr = 1
        end

        if not sonidos[clave_caminar]:isPlaying() then
            love.audio.play(sonidos[clave_caminar])
        end
    end
end
-- =================== RENDERIZADO ===================
function DibujarJugador()
     if Jugador.atacando then
        local indiceAttack = math.floor(Jugador.index_anim_attack)
        love.graphics.draw(Jugador.anim_attack[indiceAttack], Jugador.x, Jugador.y)
    else
        local indiceCorrer = math.floor(Jugador.index_anim_correr)
        love.graphics.draw(Spritesheet,Jugador.anim_correr[indiceCorrer], Jugador.x, Jugador.y)
    end
end