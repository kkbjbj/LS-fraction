pic_config = 
{
	--statement, replacement, level, direction, winkle, endX, endY, step, statement, replacement
	[2] = { "", "", 5, 2, 3, -200,  -200, 	1, "F", 		"F-F++F-F" },
	[3] = { "", "", 5, 1, 3, -100,  -200, 	1, "F++F++F", 	"F-F++F-F-F" },
	[4] = { "", "", 5, 1, 3, 200,  	-300, 	1, "F--F--F", 	"F-F++F-F" },
	[5] = { "", "", 3, 1, 2, 300,  	-200, 	1, "F+F+F+F", 	"F+F-F-FFF+F+F-F" },
	[6] = { "", "", 3, 1, 2, 350,  	-200, 	2, "F-F-F-F-", 	"FF-F-F-F-F-F+F" },
	[7] = { "", "", 3, 1, 2, 500,  	-200, 	2, "F-F-F-F", 	"FF[-F-F-F]F" },
	[8] = { "", "", 3, 1, 2, 600,  	-200, 	2, "F-F-F-F", 	"F[F]-F+F[--F]+F-F" },
}

tree_config = 
{
	--statement, replacement, level, direction, winkle, endX, endY, step, statement, replacement
	[1] = { "", "", 4, 2, 7.2, 50,   30, 	3, "F", 		"F[-F]F[+F]F" },
	[2] = { "", "", 5, 2, 7.2, 150,  30, 	3, "F", 		"F[+F]F[-F][F]" },
	[3] = { "", "", 5, 2, 7.2, 250,  30, 	3, "F", 		"F[+F]F[-F+F]" },
	[4] = { "", "", 4, 2, 9,   350,  30, 	3, "F", 		"FF+[+F-F-F]-[-F+F+F]" },
	[5] = { "", "", 6, 2, 7.2, 450,  30, 	3, "F", 		"F[-F][+F]F" },
	[6] = { "", "", 4, 2, 9,   550,  30, 	3, "F", 		"F[-F][+F][--F]F[++F]F" },
	[7] = { "", "", 3, 2, 9,   650,  30, 	3, "F", 		"F[+F]F[-F]+F" },
	[8] = { "", "", 3, 2, 8,   750,  30, 	3, "F", 		"F[+F]F[-F]+F" },

}


local math = require( "math" )

function MakeTreeConfig(config)
	local tree = {}
	tree.statement = config[1]
	tree.replacement = config[2]
	tree.level = config[3]
	tree.direction = math.pi/config[4]
	tree.winkle = math.pi/config[5]
	tree.endX = config[6]
	tree.endY = config[7]
	tree.step = config[8]
	tree.statement = config[9]
	tree.replacement = config[10]
	tree.line_char = config[11] or {}
	return tree	
end
