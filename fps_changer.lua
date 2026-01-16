print("FPS Changer by SunDrop loaded!")

local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end)

if not success then
    warn("Rayfield failed to load!")
    return
end

local RunService = game:GetService("RunService")

local Window = Rayfield:CreateWindow({
   Name = "FPS Changer by SunDrop on TikTok",
   LoadingTitle = "FPS Changer",
   LoadingSubtitle = "by SunDrop",
   ConfigurationSaving = { Enabled = false }
})

local Tab = Window:CreateTab("Performance", 4483362458)

-- LOW FPS
Tab:CreateToggle({
   Name = "Low FPS Mode (30)",
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

-- HIGH FPS
Tab:CreateToggle({
   Name = "High FPS Mode (Uncap)",
   CurrentValue = false,
   Callback = function(Value)
      if setfpscap then
         if Value then
            setfpscap(999)
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
