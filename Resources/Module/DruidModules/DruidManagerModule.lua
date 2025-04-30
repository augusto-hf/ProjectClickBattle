local druid_manager = {
}
local druid = require("druid.druid")

function druid_manager:initialization(gui_self)
	self.druid = druid.new(gui_self) -- FAVOR NAO MEXER
	self.ShopScroll = self.druid:new_scroll("Shop", "Shop_items")
	:set_horizontal_scroll(true)
end

function druid_manager:update(dt)
	self.druid:update(dt) -- FAVOR NAO MEXER
end

return druid_manager