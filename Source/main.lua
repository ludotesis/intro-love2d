-- =================== DECLARACION ===================
-- Caballero
Caballero = {
    x = 100,
    y = 400,
    ancho = 125,
    alto = 125,
    vel = 150,
    frames = {},
    indice = 1,
    sprite = nil,
    spritesheet = nil,
    quads = {},
    atacando = false,
    maxframes = 6,
    maxAnimVel = 10
}
-- =================== INICIALIZACION ===================
function love.load()
    -- Generar Animacion para Frames
    for i=1,4 do
        table.insert(Caballero.frames, love.graphics.newImage("img/ataque/frame"..i..".png"))
    end
    -- Generar Animacion para Spritesheet 
    Caballero.spritesheet = love.graphics.newImage("img/Correr.png")
    for i=0,5 do
        table.insert(Caballero.quads, love.graphics.newQuad(192 * i,0,192,192, Caballero.spritesheet))
    end
end
-- =================== INTERACCION ===================
function love.keypressed(key, scancode, isrepeat)
   if key == "space" then
      Caballero.atacando = true
   end
end
-- =================== ACTUALIZACION ===================
function love.update(dt)
    -- Configurar animacion segun bandera de ataque
    if Caballero.atacando then
        Caballero.maxAnimVel = 8
        Caballero.maxframes  = 4
    else
        Caballero.maxAnimVel = 12
        Caballero.maxframes  = 6
    end

    Caballero.indice = Caballero.indice + Caballero.maxAnimVel * dt
    if Caballero.indice >= Caballero.maxframes then
       Caballero.indice = 1
       if Caballero.atacando then
            Caballero.atacando = false
       end
    end
end
-- =================== RENDERIZADO ===================
function love.draw()
    local indiceEntero = math.floor(Caballero.indice)
    -- Renderizado Condicional
    if Caballero.atacando then
        Caballero.sprite = Caballero.frames[indiceEntero]
        love.graphics.draw(Caballero.sprite, Caballero.x, Caballero.y)
    else
        love.graphics.draw(Caballero.spritesheet, Caballero.quads[indiceEntero], Caballero.x, Caballero.y)
    end
end