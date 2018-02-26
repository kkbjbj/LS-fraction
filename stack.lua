require ("base_class")
Stack = Stack or BaseClass()

function Stack:__init()
	self.data_table = {}
	self.top = 0
end

function Stack:Clear()
	self.data_table = nil
	self.data_table = {}
	self.top = 0
end

function Stack:IsEmpty()
	return self.top == 0
end

function Stack:Size()
	return self.top
end

function Stack:Top()
	return self.data_table[self.top]
end

function Stack:Push(value)
	self.top = self.top + 1
	self.data_table[self.top] = value
end

function Stack:Pop()
	if self:IsEmpty() then
		return nil
	end
	local value = self.data_table[self.top]	 
	self.top = self.top - 1
	return value
end