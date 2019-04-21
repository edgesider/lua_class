Shape = {}

function Shape:new(side)
    -- As metatable. The table attached can access Shape's methods.
    Shape.__index = Shape

    side = side or 0
    o = { side = side }
    setmetatable(o, self)
    return o
end

function Shape:print()
    print(self.side * self.side)
end

s = Shape:new()
s.side = 10
s:print()

-- can be override
function Shape:print()
    print('area: ' .. self.side * self.side)
end

s2 = Shape:new(100)
s2:print()


-- Tip: store data in instance and store methods in metatable


-- inherit
SquareShape = {}

function SquareShape:new (side)
    self.__index = self
    setmetatable(self, Shape)
    -- If not found in self, then find it in Shape

    o = {}
    Shape.new(o)
    setmetatable(o, self)
    return o
end

o = SquareShape:new()
o:print()
print(Shape)
print(SquareShape)
print(o.__index)
