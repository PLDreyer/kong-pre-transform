local utils = require("kong.plugins.pre-transform.utils")

local plugin = {
  -- highest priority
  -- execute plugin at first
  PRIORITY = 1000001,
  VERSION = "0.1",
}

function plugin:access(plugin_conf)
  transform_request(plugin_conf)
end

function transform_request(plugin_conf)
  local transform_config = utils.get_config(plugin_conf)
  utils.transform_request(transform_config)
end

return plugin
