Nave = Object:extend()

function Nave:new()
    --Posição e Tamanho--
    self.x = love.graphics.getWidth()/2
    self.y = (love.graphics.getHeight()/3)*2
    self.width = 50*wScale
    self.height = 50*wScale
    ---------------------
    
    self.health = 10
    self.speed = 300*wScale
    self.shootDamage = 1

end

function Nave:update(dt)

end

function Nave:draw()

end