--DO-NOT-EDIT-BELLOW-THIS-LINE--
-- Init ESX
ESX = nil
local GUI                       = {}
GUI.Time                        = 0
local PlayerData                = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)
-- Fin init ESX

function exitmarkerdancefloor()
	-- ESX.UI.Menu.CloseAll()
	-- SendNUIMessage({musiccommand = "pause"})
	SendNUIMessage({setvolume = 0.0})
end

function exitmarkerdjbooth()
	ESX.UI.Menu.CloseAll()
end


--fonctions jobs
RegisterNetEvent('esx_jb_dj:enabledjbooth')
AddEventHandler('esx_jb_dj:enabledjbooth', function(enabled)
    for k,v in pairs(Config.nightclubs) do
		if enabled then
			exports.ft_libs:EnableArea("esx_jb_dj_"..k.."_djbooth")
		else
			exports.ft_libs:DisableArea("esx_jb_dj_"..k.."_djbooth")
		end
	end
end)


RegisterNetEvent("ft_libs:OnClientReady")
AddEventHandler('ft_libs:OnClientReady', function()
	for k,v in pairs (Config.nightclubs) do
		exports.ft_libs:AddArea("esx_jb_dj_"..k.."_dancefloor", {
			trigger = {
				weight = v.dancefloor.Marker.w,
				active = {
					callback = function()
						local ped = GetPlayerPed(-1)
						local coords      = GetEntityCoords(ped)
						local distance = GetDistanceBetweenCoords(coords, v.dancefloor.Pos.x, v.dancefloor.Pos.y, v.dancefloor.Pos.z, true)
						-- local number =distance/v.dancefloor.Marker.w
						-- local volume = round((1-number), 2)
						local number =distance/v.dancefloor.Marker.w
						local volume = round(((1-number)/10), 2)
						SendNUIMessage({setvolume = volume})	
					end,
				},
				exit = {
					callback = exitmarkerdancefloor
				},
			},
			locations = {
				{
					x = v.dancefloor.Pos.x,
					y = v.dancefloor.Pos.y,
					z = v.dancefloor.Pos.z,
				},
			},
		})
		
		exports.ft_libs:AddArea("esx_jb_dj_"..k.."_djbooth", {
			enable = false,
			marker = {
				weight = v.djbooth.Marker.w,
				height = v.djbooth.Marker.h,
				red = v.djbooth.Marker.r,
				green = v.djbooth.Marker.g,
				blue = v.djbooth.Marker.b,
			},
			trigger = {
				weight = v.djbooth.Marker.w,
				active = {
					callback = function()
						exports.ft_libs:HelpPromt(v.djbooth.HelpPrompt)
						if IsControlJustPressed(1, 38) and GetLastInputMethod(2) and (GetGameTimer() - GUI.Time) > 150 then
							OpenDjMenu()
							GUI.Time = GetGameTimer()
						end
					end,
				},
				exit = {
					callback = exitmarkerdjbooth
				},
			},
			locations = {
				{
					x = v.djbooth.Pos.x,
					y = v.djbooth.Pos.y,
					z = v.djbooth.Pos.z,
				},
			},
		})
	end
end)

function OpenDjMenu()
	local elements = {}
	table.insert(elements, {label = 'Résumer la musique', value = 'play_music'})
	table.insert(elements, {label = 'Pause la musique', value = 'pause_music'})
	table.insert(elements, {label = 'Stop la musique', value = 'stop_music'})
	for k,v in pairs (Config.Songs) do
		table.insert(elements, {label = v.label, value = v.song})
	end
	
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'menuperso_gpsrapide',
		{
			title    = 'Playlist chansons',
			align    = 'top-left',
			elements = elements,
		},
		function(data2, menu2)
			if data2.current.value == "pause_music" then
				TriggerServerEvent('esx_jb_dj:setcommand', "pause", nil)
			elseif data2.current.value == "play_music" then
				TriggerServerEvent('esx_jb_dj:setcommand', "play", nil)
			elseif data2.current.value == "stop_music" then
				TriggerServerEvent('esx_jb_dj:setcommand', "stop", nil)
			else
				TriggerServerEvent('esx_jb_dj:setcommand', "playsong", data2.current.value)
			end
		end,
		function(data2, menu2)
			menu2.close()
		end
	)
end

RegisterNetEvent('esx_jb_dj:setmusicforeveryone')
AddEventHandler('esx_jb_dj:setmusicforeveryone', function(command, songname)
	SendNUIMessage({musiccommand = command, songname = songname})
end)

function round(num, dec)
  local mult = 10^(dec or 0)
  return math.floor(num * mult + 0.5) / mult
end

function dump(o, nb)
  if nb == nil then
    nb = 0
  end
   if type(o) == 'table' then
      local s = ''
      for i = 1, nb + 1, 1 do
        s = s .. "    "
      end
      s = '{\n'
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
          for i = 1, nb, 1 do
            s = s .. "    "
          end
         s = s .. '['..k..'] = ' .. dump(v, nb + 1) .. ',\n'
      end
      for i = 1, nb, 1 do
        s = s .. "    "
      end
      return s .. '}'
   else
      return tostring(o)
   end
end