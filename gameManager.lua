GameManager = Object:extend()

function GameManager:new()
    self.buff = Buff('power', 30, 100, 0)
    self.enemies = {DefaultE()}
    self.player = Player()
end

function GameManager:update(dt)
    self.player:update(dt)
    self.enemies[1]:update(dt)
    --[[if  not(next(self.player.bullet) == nil) and not(next(self.enemies) == nil) then
        self.collide(self.player.bullet,self.enemies)
    end]]--
    
    self.buff:update(dt)
end

function GameManager:draw()
    self.player:draw()
    self.enemies[1]:draw()
    self.buff:draw()
    love.graphics.setColor(0.3,0.3,0.3)
    love.graphics.rectangle("fill",0,0,700*wScale,1200*wScale)
    love.graphics.setColor(1,1,1)
    love.graphics.print("NAVINHA",120*wScale,100*wScale,0,4,4)
end

function GameManager:collide(blts, enemies)
    for n,blt in ipairs(blts) do
        for m, enem in ipairs(enemies) do
        Dx =  blt.x - (self.x+self.width/2)
        Dy =  blt.y - (self.y+self.height/2)
            if Dx <= self.width/2 and Dy <= self.height/2 then
                return true
            else
                return false
            end
        end
    end
end