 --[[
Habitat HUD 

On Developement

*
25.5.2019: Fixed resolution,some visual improvement,Added animated player
BUGS To Fix : Low FPS Because of Animated Player.
*
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

local y = ScrH()/3
local x = 15
local bum = (245-40)

hook.Add( "HUDPaint", "HabitatHUD", function()
     
    local DrawHealth = LocalPlayer():Health() or 0
    local EchoHealth = LocalPlayer():Health() or 0
    local DrawArmor = LocalPlayer():Armor() or 0
    local EchoArmor = LocalPlayer():Armor() or 0


    if DrawHealth > 100 then DrawHealth = 100 end 
    if DrawHealth < 0 then DrawHealth = 0 end

    if DrawArmor > 100 then DrawArmor = 100 end 
    if DrawArmor < 0 then DrawArmor = 0 end


     draw.RoundedBox(4,x-35,y+335, 345,160, Color(50,50,50,250))

     draw.RoundedBox(12,x-35,y+325, 345,28, Color(87, 247, 202,250))

     draw.RoundedBox(12, x+105,y+420, 205,25, Color(40,40,40,255))

     draw.RoundedBox(12, x-10,y+440, 95,20, Color(40,40,40,255))

     draw.RoundedBox(12, x+0,y+360, 75,70, Color(40,40,40,255))


     draw.RoundedBox(12, x+105,y+380, 205,25, Color(40,40,40,255))

    draw.RoundedBox(12, x+105,y+380,bum * DrawHealth / 100, 28-4, Color(255,0,0,255))

    draw.DrawText( EchoHealth, "Trebuchet24", x+180,y+380, Color(255,255,255,255))


    draw.DrawText( LocalPlayer():Nick(),  "Trebuchet24", x+0,y+325, Color(255,255,255,255))

    draw.DrawText( "$ ",  "Trebuchet24", x+90,y+437, Color(255,255,255,255))

    draw.RoundedBox(12, x+105,y+420,bum * DrawArmor / 100, 28-4, Color(19,20,139,255))

    draw.SimpleText( LocalPlayer():getDarkRPVar( "money" ), "Trebuchet24", x+0,y+437, Color(255,255,255,255)) 

    draw.SimpleText( LocalPlayer():getDarkRPVar( "job" ), "Trebuchet24", x+115,y+325, Color(255,255,255,255)) 

    local can = Material("materials/habitat/can.png");
    local zirh = Material("materials/habitat/zirh.png");
    local silah = Material("materials/habitat/silah.png");

    surface.SetMaterial(can);
    surface.SetDrawColor(255,255,255,255) 
    surface.DrawTexturedRect(x+115,y+380,25,25); 

    surface.SetMaterial(zirh);
    surface.SetDrawColor(255,255,255,255) 
    surface.DrawTexturedRect( x+115,y+420,25,25); 

    surface.SetMaterial(silah);
    surface.SetDrawColor(255,255,255,255) 
    surface.DrawTexturedRect( x+270,y+340,45,45); 


    draw.DrawText( EchoArmor, "Trebuchet24", x+180,y+420, Color(255,255,255,255))


local icon = vgui.Create( "DModelPanel")
    function icon:LayoutEntity( Entity ) return end
    icon:SetPos(x+400,y+355)
    icon:SetSize( 75,75 )
    icon:SetFOV(12)
    icon:SetModel( LocalPlayer():GetModel() )
    icon:SetCamPos( Vector(95,-20,65))
    icon:SetLookAt( Vector(0,0,62))
    icon:SetAnimated(true)

    
    timer.Create("RefreshAvatar", 12, 0, function()
        if LocalPlayer():GetModel() ~= icon.Entity:GetModel() then
            icon:Remove()
            
            icon = vgui.Create("DModelPanel")
            icon:SetModel( LocalPlayer():GetModel())
            function icon:LayoutEntity( Entity ) return end
            icon:SetPos(1190, ScrH() * 0.90)
            icon:SetAnimated(false)
            icon:SetSize( 75,75 )
            icon:SetCamPos( Vector(85,-20,65))
            icon:SetLookAt( Vector(0,0,62))
        end
end)


--[[  Oyuncu Resimi
local Avatar = vgui.Create( "AvatarImage", Panel )
Avatar:SetSize( 75, 75 )
Avatar:SetPos( x+0,y+355 )
Avatar:SetPlayer( LocalPlayer(), 64 )
--]]


end )







