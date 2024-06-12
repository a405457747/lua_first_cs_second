---@class gameMgr
local gameMgr=class("gameMgr");
local ver =require("game1.version");
gameMgr.sysList={};
gameMgr.uiList={};
function gameMgr:ctor(a)
    G1=self;
end

function gameMgr:awake()
    print("G1",G1,self,"awake",gameMgr,ver.ver);
    local g =GameObject.Find("Canvas/Image/txt"):GetComponent("Text");
    g.text="hello " .. "中国"
end

function gameMgr:generateGo(loadGo, parentTrans, name)
    local go = GameObject.Instantiate(loadGo);
    local canvasTrans = parentTrans;
    go.transform:SetParent(canvasTrans, false);

    if (name ~= nil) then
        go.name = name;
    end

    return go;
end

function gameMgr:test()
    ---@type UnityEngine.Transform
    local t =self.cube:GetComponent(typeof(UnityEngine.Transform));
    t.localPosition=UnityEngine.Vector3(math.random(1,3),math.random(1,3),0);
end

function gameMgr:update()

    for i, v in ipairs(self.sysList) do
        v.update();
    end

    for i, v in ipairs(self.uiList) do
        v:update();
    end
end

return gameMgr;