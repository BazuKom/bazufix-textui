local currentText = nil
local currentPos = nil
local textVisible = false

local function HideText()
    if textVisible then
        SendNUIMessage({ type = 'HIDE_UI' })
        textVisible = false
        currentText = nil
        currentPos = nil
    end
end

local function ShowText(msg, pos)
    local valid = {["left-center"]=true, ["center"]=true, ["right-center"]=true}
    if type(pos) ~= "string" or not valid[pos] then
        pos = "left-center"
    end
    msg = msg or ''

    if textVisible and currentText == msg and currentPos == pos then return end

    SendNUIMessage({
        type = 'SHOW_UI',
        payload = { text = msg, position = pos }
    })

    currentText = msg
    currentPos = pos
    textVisible = true
end

local function UpdateText(msg, pos)
    local valid = {["left-center"]=true, ["center"]=true, ["right-center"]=true}
    if type(pos) ~= "string" or not valid[pos] then
        pos = "left-center"
    end
    msg = msg or ''

    if currentText == msg and currentPos == pos then return end

    SendNUIMessage({
        type = 'UPDATE_UI',
        payload = { text = msg, position = pos }
    })

    currentText = msg
    currentPos = pos
    textVisible = true
end

local function PressedKey()
    SendNUIMessage({ type = 'KEY_UI' })
end

RegisterNetEvent('bazufix-textui:v2:Show', function(msg, pos) ShowText(msg, pos) end)
RegisterNetEvent('bazufix-textui:v2:Update', function(msg, pos) UpdateText(msg, pos) end)
RegisterNetEvent('bazufix-textui:v2:Hide', function() HideText() end)
RegisterNetEvent('bazufix-textui:v2:Pressed', function() PressedKey() end)

exports('ShowText', ShowText)
exports('UpdateText', UpdateText)
exports('HideText', HideText)
exports('PressedKey', PressedKey)