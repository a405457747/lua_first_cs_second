local Main={};



local function init()
    print("Main init lua version ",_VERSION)

    require("lib.functions");

    unpack = unpack or table.unpack;

    ue =require("lib.ue_api");

    cs_coroutine=require("lib.cs_coroutine");

    local dbg=0;
    if(dbg==1)then
        package.cpath = package.cpath .. ';C:/Users/justi/.IntelliJIdea2019.3/config/plugins/intellij-emmylua/classes/debugger/emmy/windows/x64/?.dll'
        dbg = require('emmy_core')
        dbg.tcpConnect('localhost', 9966)
    end
    bp_debug=function()
        if(type(dbg)=="number") then
            return;
        end
        dbg.breakHere();
    end

    --cs=require("lib.cs_api");
    qa=require("lib.unit_test");
    evt =require("lib.eventMgr");
    --randomKit =require("lib.randomKit");
    js=require("lib.js_api");
    _G.Main =Main;
    G1=false;
    saveData=false;

    setmetatable(_G, {
        __index = function(t, _)
            error("read nil value " .. _, 2)
        end,
        __newindex = function(t, _)
            error("write nil value " .. _, 2)
        end
    });
    local gKeyCount=0;
    for i, v in pairs(_G) do
        gKeyCount=gKeyCount+1;
    end
    --print("gCount",gKeyCount);
    local targetGKeyCount =84;
    if(gKeyCount==targetGKeyCount)then
        print("global Count is right");
    end

end

function Main.RootGo()
    error("RootGo");
end

function Main.OnBeginDrag(eventData, go)
    print("OnBeginDrag", go);
end;

function Main.OnDrag(eventData, go)
    print("OnDrag", go);
end;

function Main.OnEndDrag(eventData, go)
    print("OnEndDrag", go);
end;

function Main.OnMouseDown(go)
    print("OnMouseDown", go);
end;

function Main.OnMouseDrag(go)
    print("OnMouseDrag", go);
end;

function Main.OnMouseUp(go)
    print("OnMouseUp", go);
end;

init();
return Main;
