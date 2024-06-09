---@class gameMgr
local gameMgr=class("gameMgr");

---@param a number
---@param b gameMgr
---@return gameMgr
local function add(a,b)

end

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
    t.localPosition=UnityEngine.Vector3(math.random(1,10),math.random(1,10),0);

    --print(t);
end

return gameMgr;