local kite = require "kite"
local ui = require "kite.ui"
local gfx = require "graphics.core"
local fontmgr = require "kite.manager.font"


fontmgr.load('generic', 'font/generic.fnt', 'font/generic_0.png')


local tree = ui.tree {
	type="empty", x=576, y=324, script="script.game",
	{name="bg", type="sprite", x=0, y=-30, width=1152, height=648+60, image="image/bg.jpg"},

	-- left cloud
	{type="sprite", x=-576+200/2, y=324-100/2, width=200, height=100, image="image/cloud_left.png"},
	{type="sprite", x=-576+100/2, y=324-42/2, width=100, height=42, image="image/clouds_left.png"},
	
	-- right cloud	
	{type="sprite", x=576-200/2, y=324-100/2, width=200, height=100, image="image/cloud_right.png"},
	{type="sprite", x=576-100/2, y=324-42/2, width=100, height=42, image="image/clouds_right.png"},

	{type="sprite", x=0, y=-200, width=1152, height=50, image="image/cloud_bottom.png"},
	{
		x = 0, y = 130, type = "empty",
		{name="circle1", type="sprite", x=0, y=0, width=700, height=700, image="image/button_bgs.png"},
		{name="circle2", type="sprite", x=0, y=0, width=700, height=700, image="image/button_bgss.png"},
		{name="circle3", type="sprite", x=0, y=0, width=112, height=112, image="image/button_bg.png"},
		{name="music", type="sprite", x=0, y=0, width=76, height=76, image="image/music.png"}
	},

	{name="button", type="label", x=0, y=-100, width=200, height=32, text="start game", font="generic", size=28, script="script.button"},

	-- bottom
	{type="sprite", x=0, y=-324+96/2, width=1920, height=96, image="image/footerBg.jpg"},
}



local game = {}


function game.update(dt)
	tree.dispatch("update", dt)
end

function game.draw()
	tree.draw()
end


function game.mouse(what, x, y, who)
	if who == "right" then
		return
	end
	tree.dispatch("mouse_"..what, x, y)
end

function game.keyboard(what, key)
end

function game.textinput(char)
end

function game.scroll(ox, oy)
end

function game.pause()
end

function game.resume()
end

function game.exit()
end



kite.start(game)