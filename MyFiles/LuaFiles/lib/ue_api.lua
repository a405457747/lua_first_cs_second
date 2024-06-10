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

local loadAll=function(path,loadType)
    loadType =loadType or UnityEngine.GameObject;
    local all=Resources.LoadAll(path,typeof(loadType));

    local t ={};

    for i = 1, all.Length do

    end

    local l =list{};
    for i in range(0,all.Length) do
        l:append(all[i]);
    end


    return l;
end

loadSp=function(path)
    return Resources.Load(path,typeof( UnityEngine.Sprite));
end

loadAudio = function(path)
    error("wait audio");
end

loadScene = function(name)
    SceneManager.LoadScene(name);
end

showGo = function(go)
    go:SetActive(true);
end

hideGo = function(go)
    go:SetActive(false);
end


transChilds = function(transParent)--这个不包括自己的呢，不要多用哦
    local transList = list {};
    for i in range(0, transParent.childCount) do
        transList:append(transParent:GetChild(i));
    end
    return transList,transList:dataTable();
end










return ue;