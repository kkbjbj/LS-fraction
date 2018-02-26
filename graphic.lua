require ("base_class")
require ("math")

QPoint = QPoint or BaseClass()
function QPoint:__init(x,y)
	self.x = x or 0
	self.y = y or 0
end
function QPoint:SetPos(x, y)
	self.x = x
	self.y = y
end
function QPoint:GetPos()
	return self.x ,self.y
end

QLine = QLine or BaseClass()
function QLine:__init(pos1, pos2)
	self.point_begin = pos1 or QPoint.New()
	self.point_end = pos2 or QPoint.New()
end
function QLine:SetPointBegin(pos1)
	self.point_begin = pos1
end
function QLine:SetPointEnd(pos2)
	self.point_end = pos2
end
function QLine:MakeLine(pos1, angle, length)
	angle = angle % 360
	self.point_begin = pos1
	local pos2 = QPoint.New()
	if	angle == 0 then
		pos2.x = pos1.x + length
		pos2.y = pos1.y
	elseif angle == 90 then
		pos2.x = pos1.x 
		pos2.y = pos1.y + length
	elseif angle == 180 then
		pos2.x = pos1.x - length
		pos2.y = pos1.y 
	elseif angle == 270 then
		pos2.x = pos1.x 
		pos2.y = pos1.y - length
	else
		pos2.x = pos1.x + length * math.cos(math.rad(angle))
		pos2.y = pos1.y + length * math.sin(math.rad(angle))
	end
	self.point_end = pos2
end
