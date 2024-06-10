local qa={}

function qa.num(val);
    assert(type(val)=="number",val..":is not number");
end

local function test()

end

test();
return qa;