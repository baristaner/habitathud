include("habitathud/client/habitathud.lua")
if SERVER then
	AddCSLuaFile("habitathud/fonts.lua")
	AddCSLuaFile("habitathud/client/habitathud.lua")	
	include("habitathud/config.lua")
end

if CLIENT then
	include("habitathud/client/habitathud.lua")

	include("habitathud/fonts.lua")	
end