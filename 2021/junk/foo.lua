Foo = {}
Foo.mt = {}
function Foo.new(o)
  setmetatable(o, Foo.mt)
  return o
end

Foo.mt.__index = function(_table, key)
  return function ()
    return "You called " .. key .. "."
  end
end
f = Foo.new({})

print(f.totally_non_existant_method())
print(f.bar())
print(f.baz())
