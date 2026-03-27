puntaje = 0
textPuntaje = ""
sprite = nil

centroX = 0
centroY = 0

centroSpriteX  = 0
centroSpriteY  = 0

musica = nil
sfx = nil

escala = 0.4
escalaMaxima = 0.4

function love.load()
    textPuntaje = "Puntaje "
    
    centroX = love.graphics.getWidth()/2
    centroY = love.graphics.getHeight()/2
    sprite = love.graphics.newImage("Rey.jpeg")

    centroSpriteX = sprite:getWidth() / 2
    centroSpriteY = sprite:getHeight()/2 

    musica = love.audio.newSource("Musica.wav", "stream")
    sfx = love.audio.newSource("Clic.wav", "static")
    musica:setLooping(true)
    love.audio.play(musica)
end

function love.update(dt)
    if escala < escalaMaxima then
         escala = escala + (0.2 * dt)
    end
end

function love.mousepressed(x, y, boton)
    if boton == 1 then
        distacia = math.sqrt((x - centroX)^2 + (y - centroY)^2)
        if distacia < 100 then
           puntaje = puntaje + 1
           love.audio.play(sfx)
           escala = 0.25
        end
    end
end

function love.draw()
    love.graphics.print(textPuntaje..puntaje, centroX - 60 , 20, 0, 2)
    love.graphics.draw(sprite, centroX, centroY, 0,escala,escala, centroSpriteX, centroSpriteY)
end