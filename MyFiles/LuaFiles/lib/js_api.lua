local js={}

function js.push(t,...)
    local arg={...};
    for i, v in ipairs(arg) do
        table.insert(t,v);
    end
    return #t;
end

function js.pop(t)
    local res =t[#t];
    table.remove(t);
    return res;
end

function js.at(t,idx)--负索引还没有
    local item =t[idx];
    return item;
end

function js.unshift(t,...)
    local arg ={...};

    for i = #arg, 1 do
        table.insert(t,1,arg[i]);
    end

    return #t;
end

function js.reverse(arr)
    local l = 1;
    local r = #arr;

    while l < r do
        arr[l], arr[r] = arr[r], arr[l];
        l = l + 1;
        r = r - 1;
    end
end

function js.shift(t)
    local res = table.remove(t, 1);
    return res;
end

function js.forEach(t, func)
    for i = 1, #t do
        func(t[i], i, t);
    end
end

function js.concat(t,t2)
    local t3={};
    for i, v in ipairs(t) do
        t3[#t3+1]=v;
    end
    for i,v in ipairs(t2) do
        t3[#t3+1]=v;
    end
    return t3;
end

function js.map(t, func)
    local res = {};
    for i = 1, #t do
        res[i] = func(t[i]);
    end
    return res;
end

function js.splice(array, index, count)
    -- 存储被删除的元素
    local removedItems = {}

    -- 从数组中删除元素
    for i = 1, count do
        table.insert(removedItems, array[index]) -- 将被删除的元素添加到 removedItems 数组中
        table.remove(array, index) -- 删除指定位置的
    end

    -- 返回被删除的元素
    return removedItems
end

 function js.slice(array, startIndex, endIndex)
    -- 如果未提供 endIndex，则设置为数组长度
    endIndex = endIndex or (#array+1);

    -- 存储切片后的元素
    local slicedItems = {}

     while(startIndex <endIndex) do
         table.insert(slicedItems, array[startIndex])
         startIndex=startIndex+1;
     end
    -- 返回切片后的元素
    return slicedItems
end


function js.includes(t,val)
    for i, v in ipairs(t) do
        if(v==val)then
            return true;
        end
    end
    return false;
end

function js.filter(t, func)
    local res = {};
    for i = 1, #t do
        local item = t[i];
        if (func(item)) then
            table.insert(res, item);
        end
    end
    return res;
end

function js.indexOf(t, val)
    for i = 1, #t do
        if (t[i] == val) then
            return i;
        end
    end
    return 0;
end


function js.entries(hash)

    local res = {}
    for i, v in pairs(hash) do
        local temp = {};
        table.insert(temp, i);
        table.insert(temp, v);
        table.insert(res, temp);
    end
    return res;

end

function js.keys(hash)
    local res = {}
    for i, v in pairs(hash) do
        res[#res + 1] = i;
    end
    return res;
end

function js.values(hash)

    local res = {}
    for i, v in pairs(hash) do
        res[#res + 1] = v;
    end
    return res;
end

function js.hasOwnProperty(hash, key)
    for i, v in pairs(hash) do
        if (i == key) then
            return true;
        end
    end
    return false;
end

function js.every(arr, fn)
    local res = {};
    for i, v in ipairs(arr) do
        if fn(v) then
            res[#res + 1] = v;
        end
    end
    return res;
end

function js.some(arr, fn)
    for i, v in ipairs(arr) do
        if fn(v) then
            return true;
        end
    end
    return false;
end

function js.join(arr,flag)
    flag =flag or"";
    return table.concat(arr,flag);
end

local function test()
    local a={3,4,5,6,7,9};
    --local b =js.splice(a,2,2);--3679;
    --print(js.join(a))
    local a2=js.slice(a,1,1);
    local a3=js.slice(a,1,2);
    local a4=js.slice(a,1);
    --print(js.join(a3),js.join(a4));
    --print(js.join(a2).."ss");
end
test();
return js;