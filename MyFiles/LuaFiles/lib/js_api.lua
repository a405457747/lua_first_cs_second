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

function js.at(t,idx)
    local item =t[idx];
    return item;
end

function js.form(t)
    local res={};
    for i, v in ipairs(t) do
        res[#res+1]=v;
    end
    return res;
end

function js.unshift(t,...)
    local arg ={...};

    for i = #arg, 1 do
        table.insert(t,1,arg[i]);
    end

    return #t;
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

function js.fill()

end

function js.includes(t,val)
    for i, v in ipairs(t) do
        if(v==val)then
            return true;
        end
    end
    return false;
end

function js.some()

end


function js.find()

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

function table.indexOf(t, val)
    for i = 1, #t do
        if (t[i] == val) then
            return i;
        end
    end
    return 0;
end