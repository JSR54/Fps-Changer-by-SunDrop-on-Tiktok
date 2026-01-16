print("FPS Changer by SunDrop loaded successfully!")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local Window = Rayfield:CreateWindow({
   Name = "FPS Changer by SunDrop on TikTok",
   LoadingTitle = "FPS Changer",
   LoadingSubtitle = "by SunDrop",
   ConfigurationSaving = { Enabled = false }
})

local Tab = Window:CreateTab("Performance", 4483362458)

-- LOW FPS
Tab:CreateToggle({
   Name = "Low FPS Mode",
   CurrentValue = false,
   Callback = function(Value)
      if setfpscap then
         if Value then
            setfpscap(30)
         else
            setfpscap(0)
         end
      end
   end,
})

-- FPS COUNTER
local fpsCounterEnabled = false

Tab:CreateToggle({
   Name = "FPS Counter (Console)",
   CurrentValue = false,
   Callback = function(Value)
      fpsCounterEnabled = Value
      if Value then
         task.spawn(function()
            while fpsCounterEnabled do
               local fps = math.floor(1 / RunService.RenderStepped:Wait())
               print("FPS: " .. fps)
            end
         end)
      end
   end,
})
