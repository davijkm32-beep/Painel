local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")

local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "MeuPainel"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(300, 220)
main.Position = UDim2.new(0.5, -150, 0.5, -110)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
main.BorderSizePixel = 0
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = main

-- Título
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -50, 0, 45)
title.Position = UDim2.fromOffset(15, 5)
title.BackgroundTransparency = 1
title.Text = "✨ MEU PAINEL"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 20
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

-- Fechar
local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(35, 35)
close.Position = UDim2.new(1, -42, 0, 10)
close.BackgroundColor3 = Color3.fromRGB(45, 45, 52)
close.Text = "×"
close.TextColor3 = Color3.new(1, 1, 1)
close.TextSize = 22
close.Font = Enum.Font.GothamBold
close.Parent = main

Instance.new("UICorner", close).CornerRadius = UDim.new(0, 9)

close.MouseButton1Click:Connect(function()
	gui.Enabled = false
end)

-- Botão de shader
local shaderButton = Instance.new("TextButton")
shaderButton.Size = UDim2.new(1, -30, 0, 50)
shaderButton.Position = UDim2.fromOffset(15, 60)
shaderButton.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
shaderButton.Text = "✨ SHADERS: OFF"
shaderButton.TextColor3 = Color3.new(1, 1, 1)
shaderButton.TextSize = 17
shaderButton.Font = Enum.Font.GothamBold
shaderButton.Parent = main

Instance.new("UICorner", shaderButton).CornerRadius = UDim.new(0, 10)

local shadersOn = false

shaderButton.MouseButton1Click:Connect(function()
	shadersOn = not shadersOn

	if shadersOn then
		shaderButton.Text = "✨ SHADERS: ON"

		local bloom = Lighting:FindFirstChild("MeuBloom")
		if not bloom then
			bloom = Instance.new("BloomEffect")
			bloom.Name = "MeuBloom"
			bloom.Intensity = 0.35
			bloom.Size = 24
			bloom.Threshold = 1
			bloom.Parent = Lighting
		end

		local color = Lighting:FindFirstChild("MeuColor")
		if not color then
			color = Instance.new("ColorCorrectionEffect")
			color.Name = "MeuColor"
			color.Brightness = 0.03
			color.Contrast = 0.12
			color.Saturation = 0.08
			color.Parent = Lighting
		end

	else
		shaderButton.Text = "✨ SHADERS: OFF"

		local bloom = Lighting:FindFirstChild("MeuBloom")
		if bloom then
			bloom:Destroy()
		end

		local color = Lighting:FindFirstChild("MeuColor")
		if color then
			color:Destroy()
		end
	end
end)

-- Créditos
local credit = Instance.new("TextLabel")
credit.Size = UDim2.new(1, -30, 0, 30)
credit.Position = UDim2.fromOffset(15, 125)
credit.BackgroundTransparency = 1
credit.Text = "Criado por você ✦"
credit.TextColor3 = Color3.fromRGB(170, 170, 180)
credit.TextSize = 13
credit.Font = Enum.Font.Gotham
credit.Parent = main--fim
