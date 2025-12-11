local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/kismiletest/test1/refs/heads/main/UI.lua"))()
local win = ui:new("测试")
local UITab1 = win:Tab("测试")
local UITab2 = win:Tab("测试1")
local UITab3 = win:Tab("测试2")
local Tab = UITab1:section("测试", true)
Tab:Slider("视角缩放距离", "Slider", 128, 128, 10000, false, function(Value)
    game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = Value
end)
about:Label("-----------")
Tab:Slider("移动速度滑块1", "WalkSpeedSlider", 16, 500, 16, function(Value)
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = Value
    end
end)
about:Label("-----------")
Tab:Slider("速度设置1", "WalkSpeed", game.Players.LocalPlayer.Character.Humanoid.WalkSpeed, 16, 400, false, function(Speed)
  spawn(function() while task.wait() do game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed end end)
end)
about:Label("-----------")
Tab:Textbox("速度设置2", "WalkSpeed", "输入速度值2", function(Value)
    local tspeed = tonumber(Value)
    if tspeed then
        local hb = game:GetService("RunService").Heartbeat
        local tpwalking = true
        local player = game:GetService("Players")
        local lplr = player.LocalPlayer
        local chr = lplr.Character
        local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
        while tpwalking and hb:Wait() and chr and hum and hum.Parent do
          if hum.MoveDirection.Magnitude > 0 then
            if tspeed then
              chr:TranslateBy(hum.MoveDirection * tspeed)
            else
              chr:TranslateBy(hum.MoveDirection)
            end
          end
        end
    end
end)
