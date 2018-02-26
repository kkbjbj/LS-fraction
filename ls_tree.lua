require("stack")
require("math")
require( "graphic" )

local default_config = {
	statement = "F",
    replacement = "F[+F]F[-F]F",
    level = 5,
    direction = math.pi/2,
    winkle = math.pi/180*25,
    endX = 600,
    endY = 50,
    step = 4,
}

function GetLSString(config)
	local result = config.statement	
	for i=1,config.level do
		local new_statement = ""
		for i=1,string.len(result) do
			local char = string.sub(result, i, i)
			if char == "F" then
				new_statement = new_statement .. config.replacement
			else
				new_statement = new_statement .. char
			end
		end
		result = new_statement
		--print(result)
	end
	return result
end

function DrawTree(ls_string, config)
	local end_x = config.endX
	local end_y = config.endY
	local direction = config.direction
	local stack = Stack.New()
	local line_list = {}
	local line_count = 0

	for i=1,string.len(ls_string) do
		local char = string.sub(ls_string, i, i)
		if char == "F" then
			local x = end_x
			local y = end_y
			end_x = x + config.step*(math.cos(direction))
			end_y = y + config.step*(math.sin(direction))
			line_count = line_count + 1
			line_list[line_count] = QLine.New(QPoint.New(x, y), QPoint.New(end_x, end_y))
		elseif char == "-" then
			direction = direction - config.winkle
		elseif char == "+" then
			direction = direction + config.winkle
		elseif char == "[" then
			local point= {}
			point.x = end_x
			point.y = end_y
			point.dir = direction
			stack:Push(point)
		elseif char == "]" then
			local point = stack:Pop()
			if point then
				end_x = point.x
				end_y = point.y
				direction = point.dir
			end
		end
	end

	return line_list
end



