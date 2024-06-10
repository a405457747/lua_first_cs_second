---@class gameMgr
local gameMgr=class("gameMgr");

function gameMgr:ctor(a)
    G1=self;
end

function gameMgr:awake()
    print("G1",G1,self,"awake",gameMgr);
end

function gameMgr:test()
    ---@type UnityEngine.Transform
    local t =self.cube:GetComponent(typeof(UnityEngine.Transform));
    t.localPosition=UnityEngine.Vector3(math.random(1,3),math.random(1,3),0);
end

function gameMgr:update()
end

return gameMgr;