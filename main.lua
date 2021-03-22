-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local composer = require( "composer" )

local E1M1 = audio.loadStream("D_E1M1.wav")
audio.setVolume( 1, { channel=1 } )
audio.play(E1M1, { channel=1, loops=-1 })

local pistol_sound = audio.loadSound("DSPISTOL.wav")

local background = display.newImageRect("background.png", 1080, 780)
background.x = display.contentCenterX
background.y = display.contentCenterY

local doomguy = display.newImageRect("doomguy.png", 60, 80 )
doomguy.x = display.contentCenterX+220
doomguy.y = display.contentHeight-200 
local doomguy_fire = display.newImageRect("doomguy_fire.png", 60, 80 )
doomguy_fire.isVisible = false

local left_arrow = display.newImageRect("LeftArrow.png", 66, 65)
left_arrow.x = display.contentCenterX-220
left_arrow.y = display.contentHeight-100

local right_arrow = display.newImageRect("RightArrow.png", 66, 65)
right_arrow.x = display.contentCenterX-120
right_arrow.y = display.contentHeight-100

local up_arrow = display.newImageRect("UpArrow.png", 66, 65)
up_arrow.x = display.contentCenterX-170
up_arrow.y = display.contentHeight-150

local down_arrow = display.newImageRect("DownArrow.png", 66, 65)
down_arrow.x = display.contentCenterX-170
down_arrow.y = display.contentHeight-50

local fire_button = display.newImageRect("fireButton.png", 87, 86)
fire_button.x = display.contentCenterX+170
fire_button.y = display.contentHeight-100

local logo = display.newImageRect("doom_8.png", 111, 80)
logo.x = display.contentCenterX
logo.y = display.contentHeight-50

local zombieman = display.newImageRect("zombieman.png", 56, 85)
zombieman.x = display.contentCenterX-220
zombieman.y = display.contentHeight-200 
local zombieman_ded = display.newImageRect("zombieman_ded.png", 56, 25)
zombieman_ded.isVisible = false

local boolet = display.newImageRect("boolet.png", 5, 5)
boolet.isVisible = false

local function moveLeft()
    doomguy.x = doomguy.x-10
end
local function moveRight()
    doomguy.x = doomguy.x+10
end
local function moveUp()
    doomguy.y = doomguy.y-10
end
local function moveDown()
    doomguy.y = doomguy.y+10
end

local function defire()
	doomguy.isVisible = true
	doomguy_fire.isVisible = false
end

local function undie()
	zombieman.isVisible = true
	zombieman_ded.isVisible = false
end

local function booletdie()
	boolet.isVisible = false
end

local function fireWeapon()
	doomguy_fire.x = doomguy.x-25
	doomguy_fire.y = doomguy.y
	zombieman_ded.x = zombieman.x
	zombieman_ded.y = zombieman.y+25
	boolet.x = zombieman.x
	boolet.y = zombieman.y-8
	doomguy.isVisible = false
	boolet.isVisible = true
	doomguy_fire.isVisible = true
	audio.play(pistol_sound)
	zombieman.isVisible = false
	zombieman_ded.isVisible = true
	timer.performWithDelay(100, booletdie)
	timer.performWithDelay(500, defire)
	timer.performWithDelay(3000, undie)
end

left_arrow:addEventListener("touch", moveLeft)
right_arrow:addEventListener("touch", moveRight)
up_arrow:addEventListener("touch", moveUp)
down_arrow:addEventListener("touch", moveDown)
fire_button:addEventListener("tap", fireWeapon)
