local ue ={};

UnityEngine= CS.UnityEngine;

GameObject = CS.UnityEngine.GameObject;
Transform = CS.UnityEngine.Transform;
RectTransform = CS.UnityEngine.RectTransform;
Vector3 = CS.UnityEngine.Vector3;
Vector2 = CS.UnityEngine.Vector2;
UI = CS.UnityEngine.UI;
Canvas = CS.UnityEngine.Canvas
CanvasGroup = CS.UnityEngine.CanvasGroup;
Time = CS.UnityEngine.Time;
Random = CS.UnityEngine.Random;
Quaternion = CS.UnityEngine.Quaternion;
Physics2D = CS.UnityEngine.Physics2D;
--[[
AudioSource = CS.UnityEngine.AudioSource;
Resources = CS.UnityEngine.Resources;
Color = CS.UnityEngine.Color;
SpriteRenderer = CS.UnityEngine.SpriteRenderer;
Button = CS.UnityEngine.UI.Button;
Text = CS.UnityEngine.UI.Text;
InputField = CS.UnityEngine.UI.InputField;
Input = CS.UnityEngine.Input;
Image = CS.UnityEngine.UI.Image;
Text = CS.UnityEngine.UI.Text;
Slider = CS.UnityEngine.UI.Slider;
WaitForSeconds = CS.UnityEngine.WaitForSeconds;
WaitForEndOfFrame = CS.UnityEngine.WaitForEndOfFrame;
WaitUntil = CS.UnityEngine.WaitUntil;
Application = CS.UnityEngine.Application;
SceneManager = CS.UnityEngine.SceneManagement.SceneManager;
--]]


local loadGo = function(path)
    return Resources.Load(path,typeof(GameObject));
end;
ue.loadGo=loadGo;

local loadAll=function(path,loadType)
    loadType =loadType or UnityEngine.GameObject;
    local all=Resources.LoadAll(path,typeof(loadType));

    local t ={};

    for i = 1, all.Length do
        t[#t+1]=all[i-1];
    end

    return t;
end
ue.loadAll=loadAll;

local loadSp=function(path)
    return Resources.Load(path,typeof( UnityEngine.Sprite));
end
ue.loadSp=loadSp;

local loadAudio = function(path)
    error("wait audio");
end
ue.loadAudio=loadAudio;

local loadScene = function(name)
    SceneManager.LoadScene(name);
end
ue.loadScene=loadScene;

local showGo = function(go)
    go:SetActive(true);
end
ue.showGo=showGo;

local hideGo = function(go)
    go:SetActive(false);
end
ue.hideGo=hideGo;

local transChilds = function(transParent)--这个不包括自己的呢，不要多用哦
    local transList = {};

    for i = 1, transParent.childCount do
        transList[#transList+1]=transParent:GetChild(i-1);
    end

    return transList;
end
ue.transChilds=transChilds;






local getComps=function(transParent, compType,containSelf)
    containSelf=containSelf or true;

    local childs = transChilds(transParent);

    local res ={transParent:GetComponent(typeof(compType))};

    for i,item in enumerate(childs)do
        res:append(item:GetComponent(typeof(compType)))
    end

    return res;
end

--递归这样定义才对哦
local function findTransRecursion(transParent, targetName)
    local transList = transChilds(transParent)
    for i, item in enumerate(transList) do
        if item.name == targetName then
            return item;
        else
            local result = findTransRecursion(item, targetName);
            if (result ~= nil) then
                return result;
            end
        end
    end
    return nil;
end
findComp = function(transParent, targetName, compoentName)
    --这个方法2D sprite也会用到的
    compoentName = compoentName or "transform";

    local resTrans = nil
    if (transParent.name == targetName) then
        resTrans = transParent;
    else
        resTrans = findTransRecursion(transParent, targetName);
    end

    return getComp(resTrans,compoentName);-- resTrans:GetComponent(compoentName);
end

getComp = function(go, comName)--这个应该只支持字符串
    return go:GetComponent(comName);
end








return ue;