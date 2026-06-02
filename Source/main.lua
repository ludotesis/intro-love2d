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
    anim_attack_vel = 10,
    anim_correr_vel = 14,
    atacando = false
}
-- Imagenes
Spritesheet = nil
-- Sonidos
musica  = nil
ataque  = nil
caminar = nil
-- =================== INICIALIZACION ===================
function love.load()
    -- Cargar Tabla Animacion Ataque
    for i = 1, 4 do
        table.insert(Jugador.anim_attack, love.graphics.newImage("img/ataque/frame" .. i .. ".png"))
    end
    -- Cargar Tabla Animacion Correr
    Spritesheet = love.graphics.newImage("img/Correr.png")
    for i = 0, 5, 1 do
       table.insert(Jugador.anim_correr, love.graphics.newQuad(192 * i ,0,192,192, Spritesheet))
    end
    -- Cargar Sonidos
    musica = love.audio.newSource("sonidos/musica.ogg", "stream")
    musica:setVolume(0.25)
    musica:setPitch(3)
    ataque  = love.audio.newSource("sonidos/espada.wav", "static")
    caminar = love.audio.newSource("sonidos/pasos.wav", "static")
    -- Iniciar Musica
    --love.audio.play(musica)
end
-- =================== INTERACCION ===================
function love.keypressed(key, scancode, isrepeat)
   if key == "space" and not Jugador.atacando then
      Jugador.atacando = true
      love.audio.stop(caminar)
      love.audio.play(ataque)
   end
end
-- =================== ACTUALIZACION ===================
function love.update(dt)
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
        love.audio.play(caminar)
    end
end
-- =================== RENDERIZADO ===================
function love.draw()
    if Jugador.atacando then
        local indiceAttack = math.floor(Jugador.index_anim_attack)
        love.graphics.draw(Jugador.anim_attack[indiceAttack], Jugador.x, Jugador.y)
    else
        local indiceCorrer = math.floor(Jugador.index_anim_correr)
        love.graphics.draw(Spritesheet,Jugador.anim_correr[indiceCorrer], Jugador.x, Jugador.y)
    end
end
