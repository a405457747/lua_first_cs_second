
-- Author: skyAllen
-- Date: 2023-09-07 15:01:08
-- Email: 894982165@qq.com
-- Copyright: © 2023 skyAllen

local event={}

local container = {};

local function addEvent(event_type, callback)
    if container[event_type] == nil then
        local callbacks = {};
        callbacks[#callbacks+1]=callback;
        container[event_type] = callbacks;
    else
        local callbacks = container[event_type];
        callbacks[#callbacks+1]=callback;
    end
end;

local function delEvent(event_type, callback)
    if container[event_type] == nil then
        error("The event type is nil");
    else
        local callbacks = container[event_type];

        for i, v in ipairs(callbacks) do
            if(callback==v)then
                table.remove(callbacks,i);
                break;
            end
        end

    end
end

local function sendEvent(event_type, ...)
    local callbacks = container[event_type];

    for i, v in ipairs(callbacks) do
        v(...);
    end
end

event.addEvent=addEvent;
event.delEvent=delEvent;
event.sendEvent=sendEvent;
return event;