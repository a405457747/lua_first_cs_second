local cs_coroutine =require("lib.cs_coroutine");
local WaitForSeconds =CS.UnityEngine.WaitForSeconds;
local UnityEngine=CS.UnityEngine;
local Vector3 =CS.UnityEngine.Vector3;

local py= require("lib.increasePython");local list =py.list;local range =py.range;local enumerate=py.enumerate;


local G1=class("G1");


local sysList=list{};
local uiList=list{};

function G1:start()
    print("G1 start!");

    do
        cs_coroutine.start(function()
            coroutine.yield(WaitForSeconds(5))
            local go = UnityEngine.GameObject.Find("Cube");
            go.name = "moveCube";
            go.transform:DOMove(Vector3(3, 2, 0), 2):OnComplete(function()
                print("move over");
            end)
            print("delay 5s !!");
        end)
    end
end

function G1:update()

    for i, item in enumerate(sysList) do
        if (item.Update) then
            item.Update();
        end
    end

    for i, item in enumerate(uiList) do
        if (item.update) then
            item.update(item);--这个是小写注意哦
        end
    end
end

return G1;