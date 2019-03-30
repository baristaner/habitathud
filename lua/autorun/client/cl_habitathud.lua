--[[
Habitat HUD 

On Developement
--]]

local habitat = { ["CHudAmmo"] = true, ["DarkRP_HUD"] = false,["DarkRP_EntityDisplay"] = false,["DarkRP_ZombieInfo"] = true,["DarkRP_LocalPlayerHUD"] = true,["DarkRP_Hungermod"] = true,["DarkRP_Agenda"] = false}
function deaktif(element)
    if habitat[element] then return false end
end
hook.Add("HUDShouldDraw", "deaktif", deaktif)

if SERVER then
    resource.AddFile("materials/habitat/can.png")
    resource.AddFile("materials/habitat/zirh.png")
    resource.AddFile("materials/habitat/silah.png")
end    


hook.Add( "HUDPaint", "HabitatHUD", function()

     draw.RoundedBox(4, ScrW() - 1300, ScrH () - 120 - 10, 345,325, Color(50,50,50,250))

     draw.RoundedBox(4, ScrW() - 1300, ScrH () - 146 - 10, 345,28, Color(204,199,163,250))

     draw.RoundedBox(4, ScrW() - 1160, ScrH () - 88 - 10, 205,25, Color(40,40,40,255))

     draw.RoundedBox(4, ScrW() - 1160, ScrH () - 50 - 10, 205,25, Color(40,40,40,255))

     draw.RoundedBox(4, ScrW() - 1260, ScrH () - 32 - 10, 95,20, Color(40,40,40,255))

     draw.RoundedBox(4, ScrW() - 1267, ScrH () - 115 - 10, 80,80, Color(40,40,40,255))

    local DrawHealth = LocalPlayer():Health() or 0
    local EchoHealth = LocalPlayer():Health() or 0
    local DrawArmor = LocalPlayer():Armor() or 0
    local EchoArmor = LocalPlayer():Armor() or 0

    draw.RoundedBox(4, ScrW () - 1163 + 2, ScrH () - 108 + 10, (245-40) * DrawHealth / 100, 28-4, Color(255,0,0,255))

    draw.DrawText( EchoHealth, "Trebuchet24", ScrW() - 1085+ 2, ScrH () - 100 + 2, Color(255,255,255,255))


    draw.DrawText( LocalPlayer():Nick(),  "Trebuchet24", ScrW() - 1250 + 2, ScrH () - 165 + 10, Color(255,255,255,255))

    draw.RoundedBox(4, ScrW () - 1163 + 2, ScrH () - 70 + 10, (245-40) * DrawArmor / 100, 28-4, Color(19,20,139,255))

    draw.SimpleText( LocalPlayer():getDarkRPVar( "job" ), "Trebuchet24", ScrW() /10,  ScrH() /1.273 , Color(255,255,255,255)) 

    local can = Material("materials/habitat/can.png");
    local zirh = Material("materials/habitat/zirh.png");
    local silah = Material("materials/habitat/silah.png");

    surface.SetMaterial(can);
    surface.SetDrawColor(255,255,255,255) 
    surface.DrawTexturedRect( ScrW()/1-1150, 621,  25,25); 

    surface.SetMaterial(zirh);
    surface.SetDrawColor(255,255,255,255) 
    surface.DrawTexturedRect( ScrW()/1-1150, 660,  25,25); 

    surface.SetMaterial(silah);
    surface.SetDrawColor(255,255,255,255) 
    surface.DrawTexturedRect( ScrW()/1-1000, 580,  50,50); 


    draw.DrawText( EchoArmor, "Trebuchet24", ScrW() - 1085+ 2, ScrH () - 60 + 2, Color(255,255,255,255))

local Avatar = vgui.Create( "AvatarImage", Panel )
Avatar:SetSize( 75, 75 )
Avatar:SetPos( 18, 596 )
Avatar:SetPlayer( LocalPlayer(), 64 )


end )







