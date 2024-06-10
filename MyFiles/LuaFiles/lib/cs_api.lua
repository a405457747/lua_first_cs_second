local cs ={}


function cs.add(t,item)
    t[#t+1]=item;
end

function cs.clear(t)
    while #t >0  do
        table.remove(t);
    end
end

function cs.insert(arr,idx,item)
        table.insert(arr,idx,item)
end

function cs.remove(arr,item)
    local idx =cs.indexOf(arr,item);
    if(idx~=0)then
        table.remove(arr,idx);
    end
end

function cs.indexOf(arr,item)
    for i, v in ipairs(arr) do
        if(v==item)then
            return i;
        end
    end
    return 0;
end

function cs.count(arr)
    return #arr;
end

function cs.removeAt(arr,idx)
    table.remove(arr,idx);
end

function cs.reverse(arr)
    local l = 1;
    local r = #arr;

    while l < r do
        arr[l], arr[r] = arr[r], arr[l];
        l = l + 1;
        r = r - 1;
    end
end

function cs.addRange(arr, range)
    for i, v in ipairs(range) do
        arr[#arr + 1] = v;
    end
end

function cs.contains(arr, val)
    for i, v in ipairs(arr) do
        if val == v then
            return true;
        end
    end
    return false;
end

function cs.forEach(t, func)
    for i = 1, #t do
        func(t[i]);
    end
end

function cs.in_case(val_item)
    if val_item==0 then
        return false;
    elseif val_item=="" then
        return false
    end
    return val_item;
end;

local function test()
    --print(true .. "woaini");
end
test();
return cs;