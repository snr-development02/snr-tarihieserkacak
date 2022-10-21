


--===================== ALICI NPC ============================--
Config = { --SELLER NPC İTEMS
    Detaylar = {
        ["Gunes Kursu"] = {
            GerekliItemler = {
                {Esya = 'guneskurs', Miktar = 1, TemizParaMiktar = 1}
            },
            VerilenEsya = {Item = 'cash', labeltarih = 'Gunes KursU', Miktar = 20000, TemizParaMiktar = 5000}
        },
        ["Mamut Disi"] = {
            GerekliItemler = {
                {Esya = 'mamutdisi', Miktar = 1, TemizParaMiktar = 1}
            },
            VerilenEsya = {Item = 'cash', labeltarih = 'Mamut Disi', Miktar = 20000, TemizParaMiktar = 5000}
        },
        ["Lucinin Tırnağı"] = {
            GerekliItemler = {
                {Esya = 'lucinintirnagi', Miktar = 1, TemizParaMiktar = 1}
            },
            VerilenEsya = {Item = 'cash', labeltarih = 'Lucinin Tırnağı', Miktar = 6000, TemizParaMiktar = 4000}
        },
        ["Gunes Kurs Kolyesi"] = {
            GerekliItemler = {
                {Esya = 'guneskurskolyesi', Miktar = 1, TemizParaMiktar = 1}
            },
            VerilenEsya = {Item = 'cash', labeltarih = 'Gunes Kurs Kolyesi', Miktar = 6000, TemizParaMiktar = 4000}
        },
        ["Astek Un Totemi"] = {
            GerekliItemler = {
                {Esya = 'astekuntotemi', Miktar = 1, TemizParaMiktar = 1}
            },
            VerilenEsya = {Item = 'cash', labeltarih = 'Astek Un Totemi', Miktar = 6000, TemizParaMiktar = 4000}
        },
        ["Atena Baykus Parasi"] = {
            GerekliItemler = {
                {Esya = 'atenabaykusparasi', Miktar = 1, TemizParaMiktar = 1}
            },
            VerilenEsya = {Item = 'cash', labeltarih = 'Atena Baykus Parasi', Miktar = 3000, TemizParaMiktar = 2000}
        },
        ["Altin Sikke"] = {
            GerekliItemler = {
                {Esya = 'altinsikke', Miktar = 1, TemizParaMiktar = 1}
            },
            VerilenEsya = {Item = 'cash', labeltarih = 'Altin Sikke', Miktar = 3000, TemizParaMiktar = 2000}
        },
        ["Gümüş Sikke"] = {
            GerekliItemler = {
                {Esya = 'gumussikke', Miktar = 1, TemizParaMiktar = 1}
            },
            VerilenEsya = {Item = 'cash', labeltarih = 'Gümüş Sikke', Miktar = 3000, TemizParaMiktar = 2000}
        },
        ["Hitit Kolyesi"] = {
            GerekliItemler = {
                {Esya = 'hititkolyesi', Miktar = 1, TemizParaMiktar = 1}
            },
            VerilenEsya = {Item = 'cash', labeltarih = 'Hitit Kolyesi', Miktar = 3000, TemizParaMiktar = 2000}
        }
    }
}

Config.NPCOlsunmu = true -- Do you want npc?(true/false) // NPC istiyormusun?(true/false)
Config.NPCKodu = "a_m_y_golfer_01" -- NPC Hash
Config.NPCKonumu = {x = 2706.870, y = 2776.603, z = 37.877, h = 100.00 } --NPC Coords // NPC Kordinatlari
Config.NPCLOGwebhook = 'X' --ADD YOUR WEBHOOK // WEBHOOK EKLEYİN

Config.MeslekOlsunmu = false -- Do you want add job to npc?(true/false) // Meslek sorgusu aç/kapat(true/false)
Config.MeslekIsim = "freq" --İf you select true which job open npc? // Meslek Sorgusunu aktif ettiysen hangi meslek açsın?
Config.MesleksizBildirim = "Seni tanıdığımı düşünmüyorum." 

Config.tgiannbase = true -- İf you using tgiann-base set true
Config.policecount = 0 -- need tgiann-base

Config.searchtext = "Tarihi eser arıyorsun..." -- Text for search
Config.gettinguptext = "Ayaklanıyorsun..." -- Text for getting up
Config.targettext = "Taşın Dibini Kaz" -- Text for target name
Config.npctargettext = "Tarihi Eser Çeviricisi"-- Text for NPC Target name

--============================================================--


--============================================================--
Config.Blips = { -- BLİPS
    {title="Göbeksiz Tepe", colour=1, id=256 , x = 2950.405, y = 2785.190, z = 40.754},
}
--============================================================--



--============================================================--
Config.TarihiItemler = {  --Add to server.lua // server.lua yada ekleyin
    ["guneskurs"] = {},
    ["mamutdisi"] = {},
    ["lucinintirnagi"] = {},
    ["guneskurskolyesi"] = {},
    ["astekuntotemi"] = {},
    ["atenabaykusparasi"] = {},
    ["altinsikke"] = {},
    ["gumussikke"] = {},
    ["hititkolyesi"] = {},
}
--============================================================--