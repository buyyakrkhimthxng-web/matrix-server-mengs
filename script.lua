-- MATRIX HUB FULL SCRIPT 1-100

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false

local main = Instance.new("Frame")
main.Size = UDim2.new(0,500,0,400)
main.Position = UDim2.new(0.5,-250,0.5,-200)
main.BackgroundColor3 = Color3.fromRGB(10,10,10)
main.Parent = gui

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(0,255,0)
stroke.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "MATRIX HUB"
title.TextColor3 = Color3.fromRGB(0,255,0)
title.Parent = main

local close = Instance.new("TextButton")
close.Size = UDim2.new(0,30,0,30)
close.Position = UDim2.new(1,-35,0,5)
close.Text = "X"
close.TextColor3 = Color3.fromRGB(255,0,0)
close.Parent = main

close.MouseButton1Click:Connect(function()
gui:Destroy()
end)

local categoryFrame = Instance.new("Frame")
categoryFrame.Size = UDim2.new(0,150,1,-40)
categoryFrame.Position = UDim2.new(0,0,0,40)
categoryFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
categoryFrame.Parent = main

local skillFrame = Instance.new("ScrollingFrame")
skillFrame.Size = UDim2.new(1,-150,1,-40)
skillFrame.Position = UDim2.new(0,150,0,40)
skillFrame.CanvasSize = UDim2.new(0,0,0,3000)
skillFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)
skillFrame.Parent = main

local layout = Instance.new("UIListLayout")
layout.Parent = skillFrame

local function createSkill(name)

local b = Instance.new("TextButton")
b.Size = UDim2.new(1,-10,0,30)
b.Text = name
b.BackgroundColor3 = Color3.fromRGB(20,20,20)
b.TextColor3 = Color3.fromRGB(0,255,0)
b.Parent = skillFrame

b.MouseButton1Click:Connect(function()
print("Skill : "..name)
end)

end

local function clearSkills()

for _,v in pairs(skillFrame:GetChildren()) do
if v:IsA("TextButton") then
v:Destroy()
end
end

end

local categories = {}
local categoryNames = {}

for i=1,15 do

local name = "Category "..i
table.insert(categoryNames,name)

local b = Instance.new("TextButton")
b.Size = UDim2.new(1,0,0,30)
b.Text = name
b.BackgroundColor3 = Color3.fromRGB(20,20,20)
b.TextColor3 = Color3.fromRGB(0,255,0)
b.Parent = categoryFrame

categories[name] = b

end

local function loadSkills(cat)

clearSkills()

for i=1,50 do
createSkill(cat.." Skill "..i)
end

end

for name,btn in pairs(categories) do

btn.MouseButton1Click:Connect(function()
loadSkills(name)
end)

end

local function notify(text)

local n = Instance.new("TextLabel")
n.Size = UDim2.new(0,200,0,30)
n.Position = UDim2.new(1,-210,1,-40)
n.BackgroundColor3 = Color3.fromRGB(10,10,10)
n.TextColor3 = Color3.fromRGB(0,255,0)
n.Text = text
n.Parent = gui

task.delay(3,function()
n:Destroy()
end)

end

notify("Hub Loading")

local timer = Instance.new("TextLabel")
timer.Size = UDim2.new(0,200,0,20)
timer.Position = UDim2.new(1,-210,0,50)
timer.BackgroundTransparency = 1
timer.TextColor3 = Color3.fromRGB(0,255,0)
timer.Parent = gui

local t = 0

task.spawn(function()

while true do

t = t + 1
timer.Text = "Time : "..t

task.wait(1)

end

end)

local ping = Instance.new("TextLabel")
ping.Size = UDim2.new(0,200,0,20)
ping.Position = UDim2.new(1,-210,0,70)
ping.BackgroundTransparency = 1
ping.TextColor3 = Color3.fromRGB(0,255,0)
ping.Parent = gui

task.spawn(function()

while true do

ping.Text = "Ping : "..math.random(20,80)

task.wait(5)

end

end)

local clock = Instance.new("TextLabel")
clock.Size = UDim2.new(0,200,0,20)
clock.Position = UDim2.new(1,-210,0,90)
clock.BackgroundTransparency = 1
clock.TextColor3 = Color3.fromRGB(0,255,0)
clock.Parent = gui

task.spawn(function()

while true do

clock.Text = os.date("%H:%M:%S")

task.wait(1)

end

end)

local themes = {
Color3.fromRGB(0,255,0),
Color3.fromRGB(0,200,255),
Color3.fromRGB(255,100,0)
}

local themeIndex = 1

local function applyTheme(color)

for _,v in pairs(gui:GetDescendants()) do

if v:IsA("TextLabel") then
v.TextColor3 = color
end

if v:IsA("TextButton") then
v.TextColor3 = color
end

end

stroke.Color = color

end

task.spawn(function()

while true do

for i=1,#themes do

applyTheme(themes[i])

task.wait(15)

end

end

end)

local activeSkills = {}

local function toggleSkill(name)

if activeSkills[name] then
activeSkills[name] = nil
notify(name.." Disabled")
else
activeSkills[name] = true
notify(name.." Enabled")
end

end

for _,v in pairs(skillFrame:GetChildren()) do

if v:IsA("TextButton") then

v.MouseButton1Click:Connect(function()
toggleSkill(v.Text)
end)

end

end

task.spawn(function()

while true do

for _,v in pairs(skillFrame:GetChildren()) do

if v:IsA("TextButton") then

v.TextTransparency = 0
task.wait(0.02)
v.TextTransparency = 0.2

end

end

end

end)

notify("System Check Complete")
notify("Database Ready")
notify("Security OK")
notify("UI Ready")
notify("Skill Engine Ready")
notify("Matrix Hub Fully Loaded")
-- CODE 101 : MATRIX RAIN EFFECT

local rainFolder = Instance.new("Folder")
rainFolder.Parent = gui

for i=1,30 do

local r = Instance.new("TextLabel")
r.Size = UDim2.new(0,20,0,20)
r.Position = UDim2.new(math.random(),0,-1,0)
r.BackgroundTransparency = 1
r.TextColor3 = Color3.fromRGB(0,255,0)
r.Text = tostring(math.random(0,9))
r.Parent = rainFolder

task.spawn(function()

while true do

r.Position = r.Position + UDim2.new(0,0,0,5)

if r.Position.Y.Offset > 800 then
r.Position = UDim2.new(math.random(),0,-1,0)
end

task.wait(0.03)

end

end)

end


-- CODE 102 : RANDOM CHARACTER STREAM

task.spawn(function()

local chars = {"0","1","A","B","C","D","E","F"}

while true do

for _,v in pairs(rainFolder:GetChildren()) do

if v:IsA("TextLabel") then
v.Text = chars[math.random(1,#chars)]
end

end

task.wait(0.1)

end

end)


-- CODE 103 : HUB DRAG SYSTEM

local UIS = game:GetService("UserInputService")
local dragging
local dragInput
local dragStart
local startPos

main.InputBegan:Connect(function(input)

if input.UserInputType == Enum.UserInputType.MouseButton1 then

dragging = true
dragStart = input.Position
startPos = main.Position

end

end)

main.InputEnded:Connect(function(input)

if input.UserInputType == Enum.UserInputType.MouseButton1 then
dragging = false
end

end)

UIS.InputChanged:Connect(function(input)

if dragging then

local delta = input.Position - dragStart

main.Position = UDim2.new(
startPos.X.Scale,
startPos.X.Offset + delta.X,
startPos.Y.Scale,
startPos.Y.Offset + delta.Y
)

end

end)


-- CODE 104 : RANDOM BORDER COLOR

task.spawn(function()

while true do

stroke.Color = Color3.fromRGB(
math.random(0,255),
math.random(100,255),
math.random(0,255)
)

task.wait(8)

end

end)


-- CODE 105 : BUTTON HOVER EFFECT

for _,v in pairs(main:GetDescendants()) do

if v:IsA("TextButton") then

v.MouseEnter:Connect(function()
v.BackgroundColor3 = Color3.fromRGB(30,30,30)
end)

v.MouseLeave:Connect(function()
v.BackgroundColor3 = Color3.fromRGB(20,20,20)
end)

end

end


-- CODE 106 : RANDOM HUB MESSAGE

local msgs = {
"Scanning System",
"Connecting Database",
"Loading Module",
"Verifying User",
"Decrypting Data"
}

task.spawn(function()

while true do

notify(msgs[math.random(1,#msgs)])

task.wait(25)

end

end)


-- CODE 107 : RANDOM SKILL COLOR

task.spawn(function()

while true do

for _,v in pairs(skillFrame:GetChildren()) do

if v:IsA("TextButton") then

v.TextColor3 = Color3.fromRGB(
math.random(0,255),
255,
math.random(0,255)
)

end

end

task.wait(5)

end

end)


-- CODE 108 : HUB ROTATION PULSE

task.spawn(function()

while true do

main.Rotation = 1
task.wait(0.2)
main.Rotation = 0

task.wait(10)

end

end)


-- CODE 109 : RANDOM SIZE EFFECT

task.spawn(function()

while true do

for _,v in pairs(skillFrame:GetChildren()) do

if v:IsA("TextButton") then

v.Size = UDim2.new(1,-10,0,30)

task.wait(0.02)

end

end

end

end)


-- CODE 110 : CATEGORY FLASH

task.spawn(function()

while true do

for _,v in pairs(categoryFrame:GetChildren()) do

if v:IsA("TextButton") then

v.TextTransparency = 0
task.wait(0.05)
v.TextTransparency = 0.2

end

end

end

end)


-- CODE 111 : AUTO SKILL TEST

local function autoTest()

for _,v in pairs(skillFrame:GetChildren()) do

if v:IsA("TextButton") then

v:Activate()

task.wait(0.1)

end

end

end


-- CODE 112 : AUTO TEST LOOP

task.spawn(function()

while true do

task.wait(120)
autoTest()

end

end)


-- CODE 113 : RANDOM TIMER COLOR

task.spawn(function()

while true do

timer.TextColor3 = Color3.fromRGB(
math.random(0,255),
255,
math.random(0,255)
)

task.wait(3)

end

end)


-- CODE 114 : CLOCK FLASH

task.spawn(function()

while true do

clock.Visible = true
task.wait(1)
clock.Visible = false
task.wait(1)

end

end)


-- CODE 115 : PING COLOR CHANGE

task.spawn(function()

while true do

ping.TextColor3 = Color3.fromRGB(
math.random(100,255),
math.random(255),
math.random(100)
)

task.wait(4)

end

end)


-- CODE 116 : RANDOM NOTIFY

task.spawn(function()

while true do

notify("System Scan Complete")

task.wait(60)

end

end)


-- CODE 117 : RANDOM MATRIX SPEED

task.spawn(function()

while true do

for _,v in pairs(rainFolder:GetChildren()) do

if v:IsA("TextLabel") then
v.Position = v.Position + UDim2.new(0,0,0,math.random(2,8))
end

end

task.wait(0.03)

end

end)


-- CODE 118 : HUB SHAKE

local function shake()

for i=1,5 do

main.Position = main.Position + UDim2.new(0,math.random(-3,3),0,math.random(-3,3))

task.wait(0.03)

end

end


-- CODE 119 : SHAKE EVERY MINUTE

task.spawn(function()

while true do

task.wait(60)
shake()

end

end)


-- CODE 120 : SYSTEM READY MESSAGE

notify("Module 120 Loaded")


-- CODE 121-199 : RANDOM MODULE LOADER

for i=121,199 do

notify("Module "..i.." Loaded")

task.wait()

end


-- CODE 200 : FINAL SYSTEM MESSAGE

notify("Matrix Hub System 200 Modules Loaded")
