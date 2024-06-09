local Main={};

local function test()
    local a=3;
    a=a+5;
    a=a*5;
    return a;
end;

local function init()
    print("Main init lua version ",_VERSION)

    require("lib.functions");

    unpack = unpack or table.unpack;

    UnityEngine= CS.UnityEngine;

    dbg=0;
    if(dbg==1)then
        package.cpath = package.cpath .. ';C:/Users/justi/.IntelliJIdea2019.3/config/plugins/intellij-emmylua/classes/debugger/emmy/windows/x64/?.dll';
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
end


test();
init();

return Main;
