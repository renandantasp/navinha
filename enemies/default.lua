DefaultE = Nave:extend()

function DefaultE:new(cor)
    DefaultE.super.new(self,25)
    if love.math.random(0,1) == 1 then
        self.x = 150*wScale
    else
        self.x = 450*wScale
    end
    self.y = 0
    self.shootRate = 6
    self.shootTimer = 0
    self.bullet  = {}
    self.speed = love.math.random(2,3)/10
    self.path = Path(self,"senx")
    self.onHit = false
    self.deathTimer = 0
    
    if cor == "red"    then self.image = love.graphics.newImage("artwork/gfx/naves/e1.png") end
    if cor == "green"  then self.image = love.graphics.newImage("artwork/gfx/naves/e2.png") end
    if cor == "yellow" then self.image = love.graphics.newImage("artwork/gfx/naves/e3.png") end
    if cor == "purple" then self.image = love.graphics.newImage("artwork/gfx/naves/e4.png") end
    self.imgOnHit = love.graphics.newImage("artwork/gfx/naves/onHit.png")
    
    self.g = anim.newGrid(25,32,self.image:getWidth(), self.image:getHeight())
    self.idle = anim.newAnimation(self.g('1-2',1), 0.01)
end


function DefaultE:destroy()
    self.deathTimer = 0
end

function DefaultE:update(dt)
    self.path:update(dt)
    self.x = (self.path.x)
    self.y = (self.path.y)

    self.idle:update(dt)
    self.onHit = false
    

end


function DefaultE:draw()
    love.graphics.rectangle("line",self.x,self.y,self.width,self.height)
    self.idle:draw(self.image, self.x,self.y,0,wScale,wScale,nil,3*wScale)
    if self.onHit == true then
        love.graphics.draw(self.imgOnHit, self.x,self.y,0,wScale,wScale,nil,3*wScale)
    end

    love.graphics.print(self.speed,300*wScale,0,0,wScale,wScale)
end