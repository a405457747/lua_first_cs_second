local Main={};

local function init()
    print("Main init lua version ",_VERSION)

    require("lib.functions");

    unpack = unpack or table.unpack;

    ue =require("lib.ue_api");

    cs_coroutine=require("lib.cs_coroutine");

    dbg=0;
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

    cs=require("lib.cs_api");
    qa=require("lib.unit_test");
    evt =require("lib.eventMgr");
    randomKit =require("lib.randomKit");
    G1=nil;

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

init();
return Main;
