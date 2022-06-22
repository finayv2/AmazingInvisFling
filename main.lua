iyflyspeed = 1

FLYING = false
			QEfly = true
			iyflyspeed = 1
			vehicleflyspeed = 1
			local IYMouse = game.Players.LocalPlayer:GetMouse()
			local Players = game.Players
			function sFLY(vfly)
				repeat wait() until Players.LocalPlayer and Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.HumanoidRootPart and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
				repeat wait() until IYMouse
				if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end

				local T = game.Players.LocalPlayer.Character.HumanoidRootPart
				local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
				local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
				local SPEED = 0

				local function FLY()
					FLYING = true
					local BG = Instance.new('BodyGyro')
					local BV = Instance.new('BodyVelocity')
					BG.P = 9e4
					BG.Parent = T
					BV.Parent = T
					BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
					BG.cframe = T.CFrame
					BV.velocity = Vector3.new(0, 0, 0)
					BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
					task.spawn(function()
						repeat wait()
							if not vfly and Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
								Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
							end
							if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
								SPEED = 50
							elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
								SPEED = 0
							end
							if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
								BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
								lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
							elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
								BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
							else
								BV.velocity = Vector3.new(0, 0, 0)
							end
							BG.cframe = workspace.CurrentCamera.CoordinateFrame
						until not FLYING
						CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
						lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
						SPEED = 0
						BG:Destroy()
						BV:Destroy()
						if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
							Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
						end
					end)
				end
				flyKeyDown = IYMouse.KeyDown:Connect(function(KEY)
					if KEY:lower() == 'w' then
						CONTROL.F = (vfly and vehicleflyspeed or iyflyspeed)
					elseif KEY:lower() == 's' then
						CONTROL.B = - (vfly and vehicleflyspeed or iyflyspeed)
					elseif KEY:lower() == 'a' then
						CONTROL.L = - (vfly and vehicleflyspeed or iyflyspeed)
					elseif KEY:lower() == 'd' then 
						CONTROL.R = (vfly and vehicleflyspeed or iyflyspeed)
					elseif QEfly and KEY:lower() == 'e' then
						CONTROL.Q = (vfly and vehicleflyspeed or iyflyspeed)*2
					elseif QEfly and KEY:lower() == 'q' then
						CONTROL.E = -(vfly and vehicleflyspeed or iyflyspeed)*2
					end
					pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
				end)
				flyKeyUp = IYMouse.KeyUp:Connect(function(KEY)
					if KEY:lower() == 'w' then
						CONTROL.F = 0
					elseif KEY:lower() == 's' then
						CONTROL.B = 0
					elseif KEY:lower() == 'a' then
						CONTROL.L = 0
					elseif KEY:lower() == 'd' then
						CONTROL.R = 0
					elseif KEY:lower() == 'e' then
						CONTROL.Q = 0
					elseif KEY:lower() == 'q' then
						CONTROL.E = 0
					end
				end)
				FLY()
			end

			local speaker = game.Players.LocalPlayer
			local ch = game.Players.LocalPlayer.Character
			local prt=Instance.new("Model")
			prt.Parent = game.Players.LocalPlayer.Character
			local z1 = Instance.new("Part")
			z1.Name="Torso"
			z1.CanCollide = false
			z1.Anchored = true
			local z2 = Instance.new("Part")
			z2.Name="Head"
			z2.Parent = prt
			z2.Anchored = true
			z2.CanCollide = false
			local z3 =Instance.new("Humanoid")
			z3.Name="Humanoid"
			z3.Parent = prt
			z1.Position = Vector3.new(0,9999,0)
			game.Players.LocalPlayer.Character=prt
			wait(3)
			game.Players.LocalPlayer.Character=ch
			wait(3)
			local Hum = Instance.new("Humanoid")
			z2:Clone()
			Hum.Parent = game.Players.LocalPlayer.Character
			local root =  game.Players.LocalPlayer.Character.HumanoidRootPart
			for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if v ~= root and  v.Name ~= "Humanoid" and v.Name ~= "CharacterHandler" then
					v:Destroy()
				end
			end
			root.Transparency = 0
			root.Color = Color3.new(1, 1, 1)
			local invisflingStepped
			invisflingStepped = game:GetService('RunService').Stepped:Connect(function()
				if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.HumanoidRootPart then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
				else
					invisflingStepped:Disconnect()
				end
			end)
			sFLY()
			workspace.CurrentCamera.CameraSubject = root
			local bambam = Instance.new("BodyThrust")
			bambam.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
			bambam.Force = Vector3.new(99999,99999*10,99999)
			bambam.Location = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
