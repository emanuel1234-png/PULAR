local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local infiniteJumpEnabled = false

-- Criar botão
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "JumpToggleUI"

local toggleButton = Instance.new("TextButton", screenGui)
toggleButton.Size = UDim2.new(0, 150, 0, 50)
toggleButton.Position = UDim2.new(0.5, -75, 0.85, 0)
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
toggleButton.Text = "Ativar Pulo Infinito"
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.TextScaled = true
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.Active = true
toggleButton.Draggable = true

-- Lógica do botão
toggleButton.MouseButton1Click:Connect(function()
	infiniteJumpEnabled = not infiniteJumpEnabled
	if infiniteJumpEnabled then
		toggleButton.Text = "Desativar Pulo Infinito"
		toggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
	else
		toggleButton.Text = "Ativar Pulo Infinito"
		toggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	end
end)

-- Função de pulo infinito
UserInputService.JumpRequest:Connect(function()
	if infiniteJumpEnabled then
		if humanoid and humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
			humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
end)

-- Atualizar personagem se morrer
player.CharacterAdded:Connect(function(char)
	character = char
	humanoid = char:WaitForChild("Humanoid")
end)
