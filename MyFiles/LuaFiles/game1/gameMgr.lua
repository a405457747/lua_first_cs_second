---@class gameMgr
local gameMgr=class("gameMgr");

function gameMgr:ctor(a)
   --print("ctor",a);
    ---@UnityEngine.GameObject
    self.cube=UnityEngine.GameObject.Find("Cube");
    print(self.cube);
end

function gameMgr:ggk()

end

function gameMgr:update()
    ---@type UnityEngine.Transform
    local t =self.cube:GetComponent(typeof(UnityEngine.Transform));
    t.localPosition=UnityEngine.Vector3(math.random(1,3),math.random(1,3),0);

    --print(t);
end

return gameMgr;