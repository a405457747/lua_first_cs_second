local gameMgr=class("gameMgr");

function gameMgr:start()
    print("i gam game1 gameMgr");
    self.k=555;
    gameMgr.k=333;
end

local function test(self)

    local a=3;
    a=a+self.k;
    a=a*5;

    return a;

end;

function gameMgr:update()
    dbg.breakHere()
    test(gameMgr);
    print("ggk");

end

return gameMgr;