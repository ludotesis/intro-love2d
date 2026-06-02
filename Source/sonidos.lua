-- =================== DECLARACION DE SONIDOS ===================
-- Tabla de Sonidos
sonidos = nil
clave_musica  = "musica"
clave_ataque  = "espada"
clave_caminar = "caminar"
-- =================== INICIALIZACION DE SONIDOS ===================
function CargarSonidos()
    sonidos =
    {
        [clave_musica] = love.audio.newSource("sonidos/musica.ogg", "stream"),
        [clave_ataque]  = love.audio.newSource("sonidos/"..clave_ataque..".wav", "static"),
        [clave_caminar] = love.audio.newSource("sonidos/pasos.wav", "static")
    }

    sonidos.musica:setVolume(0.1)
    sonidos.musica:setPitch(3)
    -- Iniciar Musica
    love.audio.play(sonidos[clave_musica])
end