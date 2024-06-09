local Main={};

local function init()
    print("Main init lua version ",_VERSION)

    require("lib.functions");

    unpack = unpack or table.unpack;

    UnityEngine= CS.UnityEngine;

    dbg=0;
    if(dbg==1)then
        package.cpath = package.cpath .. ';C:/Users/justi/.IntelliJIdea2019.3/config/plugins/intellij-emmylua/classes/debugger/emmy/windows/x64/?.dll'
        dbg = require('emmy_core')
        dbg.tcpConnect('localhost', 9966)
    end


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
    local targetGKeyCount =62;
    if(gKeyCount==targetGKeyCount)then
        print("GCount Right");
    end
end

init();
return Main;
