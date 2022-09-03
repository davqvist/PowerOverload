local shared = require "shared"

data:extend{
  {
    type = "bool-setting",
    name = "power-overload-disconnect-different-poles",
    setting_type = "runtime-global",
    default_value = true,
    order = "a"
  },
  {
    type = "string-setting",
    name = "power-overload-on-pole-overload",
    setting_type = "runtime-global",
    default_value = "destroy",
    allowed_values = {"destroy", "damage", "fire"},
    order = "b"
  },
  {
    type = "bool-setting",
    name = "power-overload-log-to-chat",
    setting_type = "runtime-global",
    default_value = true,
    order = "c"
  },
  {
    type = "double-setting",
    name = "power-overload-transformer-efficiency",
    setting_type = "runtime-global",
    default_value = 0.98,
    minimum_value = 0,
    maximum_value = 1,
    order = "d"
  },
  {
    type = "double-setting",
    name = "power-overload-fire-probability",
    setting_type = "runtime-global",
    default_value = 1.1,
    minimum_value = 1,
    maximum_value = 10,
    order = "e"
  },
}

order = 0
for pole_name, default_power in pairs(shared.get_pole_names(mods)) do
  data:extend{
    {
      type = "string-setting",
      name = "power-overload-max-power-" .. pole_name,
      localised_name = {"", {"description.max-energy-consumption"}, ": ", {"mod-setting-name.power-overload-entity", pole_name}},

      setting_type = "startup",
      default_value = default_power,
      order = tostring(order)  -- Doesn't really work with more than 10 types of pole
    }
  }
  order = order + 1
end
  