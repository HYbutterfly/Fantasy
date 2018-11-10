local graphics = require "fantasy.graphics"
local window = require "fantasy.window"



--[[
	--system.render
	记录node 上次的信息
	draw 的时候检查属性是否变化

]]
return function()

	local self = {}

	local sprites = {}


	-- 事件处理
	local handler = {}

	function handler.draw()
		for _,sp in ipairs(sprites) do
			graphics.draw(sp('vao'), sp('texture'))
		end
	end

	function handler.entity_join(e)
		if e('vao') then
			table.insert(sprites, e)
		end
	end

	function handler.entity_leave(e)
	end

	return setmetatable(self, {__call = function (_, event, ...)
		local f = handler[event]
		if f then
			return f(...)
		end
	end})
end