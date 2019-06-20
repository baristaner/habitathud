local function PrintNoArguments()
	print( "[HABITATHUD]!" )
end

timer.Create( "UniqueName3", 60, 0, PrintNoArguments )

hook.Add( "Initialize", "Timer Example", CreateSomeTimers )