require( "iuplua" )
require( "iupluacontrols" )
require( "iuplua_pplot"  )
require( "graphic" )
require( "ls_tree" )
require( "tree_config" )

plot = iup.pplot{
  TITLE = "Simple Line",
  MARGINBOTTOM="80",
  MARGINLEFT="80",
  AXS_XLABEL="X",
  AXS_YLABEL="Y",
  --LEGENDSHOW="YES",
  LEGENDPOS="TOPLEFT",
}

function DrawLine(plot, line )
	iup.PPlotBegin(plot, 0)
	iup.PPlotAdd(plot, line.point_begin.x, line.point_begin.y)
	iup.PPlotAdd(plot, line.point_end.x, line.point_end.y)
	iup.PPlotEnd(plot)
end

for k,v in pairs(tree_config) do
	local config = MakeTreeConfig(v)
	local ls_string = GetLSString(config)
	local line_list = DrawTree(ls_string, config)
	for i=1,#line_list do
		DrawLine(plot, line_list[i])
	end
end

for k,v in pairs(pic_config) do
	local config = MakeTreeConfig(v)
	local ls_string = GetLSString(config)
	local line_list = DrawTree(ls_string, config)
	for i=1,#line_list do
		DrawLine(plot, line_list[i])
	end
end

d = iup.dialog{plot, size="200x100", title="PPlot"}
d:show()

if (iup.MainLoopLevel()==0) then
  iup.MainLoop()
end
