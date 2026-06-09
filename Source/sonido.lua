-- =================== DECLARACION ===================
sonidos = nil
clave = 'mi_musica_e3'
-- =================== INICIALIZACION ===================
function CargarSonidos()
    sonidos = {
        [clave] = love.audio.newSource("sonidos/musica.ogg", "stream"),
        ataque = love.audio.newSource("sonidos/espada.wav", "static"),
        caminar = love.audio.newSource("sonidos/pasos.wav", "static"), 
        colision = love.audio.newSource("sonidos/colision.wav", "static")
    }  
end

function ConfigurarSonidos()
    sonidos[clave]:setVolume(0.5) -- 1 = 100%  0.25 = 25% 05 = 5%
    sonidos[clave]:setPitch(0.5)
    love.audio.play(sonidos[clave])
end