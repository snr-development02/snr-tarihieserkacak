QBCore = nil 

Citizen.CreateThread(function()
   while QBCore == nil do
   	TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
   	Citizen.Wait(30)
   end
end)

RegisterNetEvent('sonerbeysss:tarihieserimiverulan')
AddEventHandler('sonerbeysss:tarihieserimiverulan', function()

    if Config.tgiannbase == true then
        QBCore.Functions.TriggerCallback("tgiann-base:polis-sayi",function(AktifPolis)
        if AktifPolis >= Config.policecount then
            topluyormu = true
            local cSCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
            local spatulaspawn = CreateObject(GetHashKey(spatulamodel), cSCoords.x, cSCoords.y, cSCoords.z, 1, 1, 1)
            local netid = ObjToNet(spatulaspawn)

            TaskStartScenarioInPlace(PlayerPedId(), "world_human_gardener_plant", 0, false)
            AttachEntityToEntity(spatulaspawn,GetPlayerPed(PlayerId()),GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422),-0.005,0.0,0.0,190.0,190.0,-50.0,1,1,0,1,0,1)
            spatula_net = netid
            QBCore.Functions.Progressbar("accessing_atm", Config.searchtext, 8000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function()
                if not cancelled then
                    ClearPedTasks(PlayerPedId())
                    DetachEntity(NetToObj(spatula_net), 1, 1)
                    DeleteEntity(NetToObj(spatula_net))
                    spatula_net = nil
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('sonerbeysss:tarihieserimiverulanserver')

                    QBCore.Functions.Progressbar("accessing_atm", Config.gettinguptext, 5500, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function()

                    topluyormu = false
                    end)
                else
                end
            end)
        else
            QBCore.Functions.Notify("Yeterli sayıda polis yok", "primary", 2500)
        end
    end)
    else
            local cSCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
            local spatulaspawn = CreateObject(GetHashKey(spatulamodel), cSCoords.x, cSCoords.y, cSCoords.z, 1, 1, 1)
            local netid = ObjToNet(spatulaspawn)

            TaskStartScenarioInPlace(PlayerPedId(), "world_human_gardener_plant", 0, false)
            AttachEntityToEntity(spatulaspawn,GetPlayerPed(PlayerId()),GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422),-0.005,0.0,0.0,190.0,190.0,-50.0,1,1,0,1,0,1)
            spatula_net = netid
            QBCore.Functions.Progressbar("accessing_atm", Config.searchtext, 8000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function()
                if not cancelled then
                    ClearPedTasks(PlayerPedId())
                    DetachEntity(NetToObj(spatula_net), 1, 1)
                    DeleteEntity(NetToObj(spatula_net))
                    spatula_net = nil
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('sonerbeysss:tarihieserimiverulanserver')

                    QBCore.Functions.Progressbar("accessing_atm", Config.gettinguptext, 5500, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function()

                    topluyormu = false
                    end)
                else
                end
            end)

    end
end)


Citizen.CreateThread(function()  --BLİP DETAYLARI
    for _, info in pairs(Config.Blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.7)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)


--=========================== TARGET SİDE =====================--


exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget",
    vector3(2972.096, 2776.639, 38.455),
    2,
    2,
    {
        name = "TarihiEserTarget",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget2",
    vector3(2968.001, 2776.496, 38.519),
    2,
    2,
    {
        name = "TarihiEserTarget2",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget3",
    vector3(2963.972, 2774.541, 39.485),
    2,
    2,
    {
        name = "TarihiEserTarget3",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget4",
    vector3(2957.055, 2773.820, 39.897),
    2,
    2,
    {
        name = "TarihiEserTarget4",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 1.5
    }
)


exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget5",
    vector3(2951.087, 2768.984, 39.029),
    2,
    2,
    {
        name = "TarihiEserTarget5",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget6",
    vector3(2952.587, 2770.493, 39.024),
    2,
    2,
    {
        name = "TarihiEserTarget6",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget7",
    vector3(2948.060, 2768.281, 38.932),
    2,
    2,
    {
        name = "TarihiEserTarget7",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget8",
    vector3(2938.278, 2772.273, 39.253),
    2,
    2,
    {
        name = "TarihiEserTarget8",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget9",
    vector3(2935.288, 2784.486, 39.521),
    2,
    2,
    {
        name = "TarihiEserTarget9",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget10",
    vector3(2927.658, 2791.916, 40.417),
    2,
    2,
    {
        name = "TarihiEserTarget10",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget11",
    vector3(2922.440, 2798.633, 41.180),
    2,
    2,
    {
        name = "TarihiEserTarget11",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget12",
    vector3(2927.267, 2812.774, 44.426),
    2,
    2,
    {
        name = "TarihiEserTarget12",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget13",
    vector3(2937.948, 2813.168, 43.481),
    2,
    2,
    {
        name = "TarihiEserTarget13",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 2.5
    }
)

exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget14",
    vector3(2944.815, 2819.253, 42.870),
    2,
    2,
    {
        name = "TarihiEserTarget14",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 2.5
    }
)

exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget15",
    vector3(2948.708, 2819.665, 42.687),
    2,
    2,
    {
        name = "TarihiEserTarget15",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 1.5
    }
)


exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget16",
    vector3(2959.722, 2819.256, 43.227),
    2,
    2,
    {
        name = "TarihiEserTarget16",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget17",
    vector3(2955.469, 2819.149, 42.684),
    2,
    2,
    {
        name = "TarihiEserTarget17",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget18",
    vector3(2948.708, 2819.665, 42.687),
    2,
    2,
    {
        name = "TarihiEserTarget18",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget19",
    vector3(2980.237, 2782.467, 39.168),
    2,
    2,
    {
        name = "TarihiEserTarget19",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget20",
    vector3(2980.943, 2786.902, 40.397),
    2,
    2,
    {
        name = "TarihiEserTarget20",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget21",
    vector3(2978.802, 2790.135, 40.569),
    2,
    2,
    {
        name = "TarihiEserTarget21",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget22",
    vector3(2976.955, 2791.166, 40.558),
    2,
    2,
    {
        name = "TarihiEserTarget22",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget23",
    vector3(2971.469, 2797.742, 41.193),
    2,
    2,
    {
        name = "TarihiEserTarget23",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget24",
    vector3(2955.128, 2819.643, 42.461),
    2,
    2,
    {
        name = "TarihiEserTarget24",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget25",
    vector3(2959.530, 2819.446, 43.493),
    2,
    2,
    {
        name = "TarihiEserTarget25",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 1.5
    }
)

exports["qb-target"]:AddBoxZone(
    "TarihiEserTarget26",
    vector3(2950.684, 2815.855, 42.241),
    2,
    2,
    {
        name = "TarihiEserTarget26",
        heading = 118.60,
        debugPoly = false,
        minZ = 18.669,
        maxZ = 999.87834
    },
    {
        options = {
            {
                type = "Client",
                event = "sonerbeysss:tarihieserimiverulan",
                icon = "fas fa-circle",
                label = Config.targettext
            }
        },
        distance = 1.5
    }
)




--======================== ALICI NPC ========================--

QBCore = nil
PlayerData = {}
menu = false

Citizen.CreateThread(function()
	while QBCore == nil do
		TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
		Citizen.Wait(0)
	end

	while QBCore.Functions.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUptade')
AddEventHandler('QBCore:Client:OnJobUptade', function(job)
    PlayerData.job = job
end)

RegisterNetEvent('soner:client:tarihinpc')
AddEventHandler('soner:client:tarihinpc', function(playerData, actv)
    if Config.MeslekOlsunmu == true then
    if PlayerData.job and PlayerData.job.name == Config.MeslekIsim then
    toptancimenuac()
    Citizen.Wait(120000)
    QBCore.UI.Menu.CloseAll()
    SetNuiFocus(false, false)
    else
        QBCore.Functions.Notify(Config.MesleksizBildirim, "error")
    end
else
    toptancimenuac()
    Citizen.Wait(120000)
    QBCore.UI.Menu.CloseAll()
    SetNuiFocus(false, false)
end
end)


function toptancimenuac()
    QBCore.UI.Menu.CloseAll()
    local elements = {}

    for k,v in pairs(Config.Detaylar) do
        table.insert(elements, {label = v.VerilenEsya.labeltarih, value = k})
    end

	QBCore.UI.Menu.Open('default', GetCurrentResourceName(), 'toptanci_default', {
		title = '',
		align = 'top-left',
        elements = elements
    },function(data, menu)
		if data.current.value then
            QBCore.UI.Menu.Open('dialog', GetCurrentResourceName(), 'toptanci_dialog',
            {
                title = "Ne kadar dönüştüreceksin? (max10)"
            },
            function(data3, menu3)
                local yazilanmiktar = tonumber(data3.value)
                if yazilanmiktar < 11 then
                    TriggerServerEvent('soner:toptanci:item', data.current.value, yazilanmiktar)
                    menu3.close()
                else
                    QBCore.Functions.Notify("Hatalı Miktar!", "error")
                end
            end, function(data3, menu3)
                menu3.close()
                menuacik = false
            end)
        else
            menu.close()
		end
    end, function(data, menu)
        menu.close()
	end)
end



exports['qb-target']:AddTargetModel("a_m_y_golfer_01", {  --0xD71FE131
    options = {
        {
            type = "client",
            event = "soner:client:tarihinpc",
            icon = "fas fa-shopping-cart",
            label = Config.npctargettext,
        },
    },
    distance = 3.5,
})

Citizen.CreateThread(function()
    if Config.NPCOlsunmu == true then
        RequestModel(Config.NPCKodu)
        while not HasModelLoaded(Config.NPCKodu) do
            Wait(1)
        end
    
        sonerbeysdodoko = CreatePed(1, Config.NPCKodu, Config.NPCKonumu.x, Config.NPCKonumu.y, Config.NPCKonumu.z-1, Config.NPCKonumu.h, false, true)
        SetBlockingOfNonTemporaryEvents(sonerbeysdodoko, true)
        SetPedDiesWhenInjured(sonerbeysdodoko, false)
        SetPedCanPlayAmbientAnims(sonerbeysdodoko, true)
        SetPedCanRagdollFromPlayerImpact(sonerbeysdodoko, false)
        SetEntityInvincible(sonerbeysdodoko, true)
        FreezeEntityPosition(sonerbeysdodoko, true)
        TaskStartScenarioInPlace(sonerbeysdodoko, "WORLD_HUMAN_CLIPBOARD", 0, true);
    end
end)