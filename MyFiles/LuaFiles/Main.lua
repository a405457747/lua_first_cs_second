
--不推荐有lua的组件，不推荐lua用unity开发方式
local Main={};

local function init()
    print("Main init",_VERSION)
    require("lib.functions");
    class=class;
    unpack = unpack or table.unpack;
    if(nil)then
        package.cpath = package.cpath .. ';C:/Users/skyAllen/.IntelliJIdea2019.3/config/plugins/intellij-emmylua/classes/debugger/emmy/windows/x64/?.dll';
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

    local py= require("lib.increasePython");local list =py.list;local range =py.range;local enumerate=py.enumerate;

    --[[
    local tList =list{'a','b','c','d'};
    for i,item in enumerate(tList) do
        print(i,item);
    end
    --]]

    CS.UnityEngine.SceneManagement.SceneManager.LoadScene("G1");
end

init();
return Main;
