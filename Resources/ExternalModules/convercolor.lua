local M = {}

local function hex (hex, alpha) 
	local redColor,greenColor,blueColor=hex:match('#?(..)(..)(..)')
	redColor, greenColor, blueColor = tonumber(redColor, 16)/255, tonumber(greenColor, 16)/255, tonumber(blueColor, 16)/255
	if alpha == nil then
		return redColor, greenColor, blueColor
	end
	return vmath.vector4(redColor, greenColor, blueColor, alpha)
end

local function rgb (r, g, b)
	local redColor,greenColor,blueColor=r/255, g/255, b/255
	return vmath.vector4(redColor, greenColor, blueColor, 1)
end

local function rgba (r, g, b, alpha)
	local redColor,greenColor,blueColor=r/255, g/255, b/255
	return vmath.vector4(redColor, greenColor, blueColor, alpha)
end

M.hex = hex
M.rgb = rgb
M.rgba = rgba

-- found on https://github.com/andrewyavors/Lua-Color-Converter
-- mas n tava funcionando direito, ai eu consertei

return M