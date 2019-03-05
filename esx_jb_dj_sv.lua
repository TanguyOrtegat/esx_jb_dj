-- start INIT ESX
ESX              = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
-- end INIT ESX


RegisterServerEvent('esx_jb_dj:setcommand')
AddEventHandler('esx_jb_dj:setcommand', function(command, songname)
	TriggerClientEvent('esx_jb_dj:setmusicforeveryone', -1, command, songname)
end)