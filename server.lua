QBCore = nil 

Citizen.CreateThread(function()
   while QBCore == nil do
   	TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
   	Citizen.Wait(30)
   end
end)


RegisterServerEvent('sonerbeysss:tarihieserimiverulanserver')
AddEventHandler('sonerbeysss:tarihieserimiverulanserver', function(cabin, house)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local luck = math.random(1, 100)
    local itemFound = true
    local itemCount = 1

	if itemFound then
        for i = 1, itemCount, 1 do
            local randomItem = Config.TarihiItemler["type"]math.random(1, 2)
            local itemInfo = QBCore.Shared.Items[randomItem]
            if luck == 100 then
                randomItem = "guneskurs" -- Gunes Kurs
                itemInfo = QBCore.Shared.Items[randomItem]
                Player.Functions.AddItem(randomItem, 1)
				TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
			elseif luck >= 99 and luck <= 100 then
				randomItem = "mamutdisi" -- Mamut Dişi
				itemInfo = QBCore.Shared.Items[randomItem]
                Player.Functions.AddItem(randomItem, 1)
				TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
			elseif luck >= 98 and luck <= 99 then
				randomItem = "lucinintirnagi" -- Luci'nin Tırnağı
				itemInfo = QBCore.Shared.Items[randomItem]
                Player.Functions.AddItem(randomItem, 1)
				TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
			elseif luck >= 97 and luck <= 98 then
				randomItem = "guneskurskolyesi" -- Güneş Kurs Kolyesi
				itemInfo = QBCore.Shared.Items[randomItem]
                Player.Functions.AddItem(randomItem, 1)
				TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
			elseif luck >= 95 and luck <= 97 then
				randomItem = "astekuntotemi" -- Astek Un Totemi
				itemInfo = QBCore.Shared.Items[randomItem]
                Player.Functions.AddItem(randomItem, 1)
				TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
			elseif luck >= 93 and luck <= 95 then
                randomItem = "atenabaykusparasi" -- Atena Baykuş Parası
				itemInfo = QBCore.Shared.Items[randomItem]
                Player.Functions.AddItem(randomItem, 1)
				TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
			elseif luck >= 90 and luck <= 93 then
				randomItem = "altinsikke" -- Altın Sikke
				itemInfo = QBCore.Shared.Items[randomItem]
                Player.Functions.AddItem(randomItem, 1)
				TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
			elseif luck >= 85 and luck <= 90 then
				randomItem = "gumussikke" -- Gümüş Sikke
				itemInfo = QBCore.Shared.Items[randomItem]
                Player.Functions.AddItem(randomItem, 1)
				TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
			elseif luck >= 80 and luck <= 85 then
				randomItem = "hititkolyesi" --Hitit Kolyesi
				itemInfo = QBCore.Shared.Items[randomItem]
                Player.Functions.AddItem(randomItem, 1)
				TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
			elseif luck >= 70 and luck <= 80 then
				TriggerClientEvent("QBCore:Notify", source, 'Topraktan başka bir şey bulamadın :/', "error")
			elseif luck >= 0 and luck <= 70 then
				TriggerClientEvent("QBCore:Notify", source, 'Topraktan başka bir şey bulamadın :/', "error")
            end
            Citizen.Wait(500)
        end
	end
end)




--============================== NPC ALICI ==============================--
QBCore = nil
local DISCORDS_NAME = "Tarihi Eser Çevirici Log"
local DISCORDS_IMAGE = ""

RegisterServerEvent('soner:toptanci:item')
AddEventHandler('soner:toptanci:item', function(item, miktar)
    local xPlayer = QBCore.Functions.GetPlayer(source)

    for k,v in pairs(Config.Detaylar[item].GerekliItemler) do
        if xPlayer.Functions.GetItemByName(v.Esya).amount >= miktar then
            paramiktar = Config.Detaylar[item].VerilenEsya.Miktar * miktar
			--temizyarrak = Config.Detaylar[item].VerilenEsya.TemizParaMiktar * miktar
			xPlayer.Functions.RemoveItem(v.Esya, miktar)
			xPlayer.Functions.AddItem('ipara', paramiktar)
			--xPlayer.Functions.AddMoney('cash', temizyarrak)
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cash'],'add', paramiktar)
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[v.Esya],'remove', miktar)

            sendToDiscord("EMLAK - Satış", " **"..getPlayerInfo(source).."** kişisi toptancıya **".. miktar .. "x " ..item .."** sattı, **" .. paramiktar .. "$** kazandı.", 16744576, Config.NPCLOGwebhook)
			TriggerClientEvent("QBCore:Notify", source, ''.. miktar ..'x '.. item .. ' sattın, ' .. paramiktar .. '$ kazandın.', "success")
        else
			TriggerClientEvent("QBCore:Notify", source, 'Üzerinizde '..miktar..'x ' ..item..' yok!', "error")
        end
    end
end)

function sendToDiscord(name, message, color, selam)
	local connect = {
		  {
			  ["color"] = color,
			  ["title"] = "**".. name .."**",
			  ["description"] = message,
			  ["footer"] = {
			  ["text"] = os.date('!%Y-%m-%d - %H:%M:%S') .. " - X Roleplay",
			  },
		  }
	  }
	PerformHttpRequest(selam, function(err, text, headers) end, 'POST', json.encode({username = DISCORDS_NAME, embeds = connect, avatar_url = DISCORDS_IMAGE}), { ['Content-Type'] = 'application/json' })
end

function getPlayerInfo(player)
	local _player = player
	local infoString = GetPlayerName(_player) .. " (" .. _player .. ")"
	-- if Config.BilgileriPaylas then
		for k,v in pairs(GetPlayerIdentifiers(_player)) do
			if string.sub(v, 1, string.len("discord:")) == "discord:" then
				infoString = infoString .. "\n<@" .. string.gsub(v,"discord:","") .. ">"
			else
				infoString = infoString .. "\n" .. v
			end
		end
	-- end
	return infoString
end