local utils = require("kong.plugins.utils")

local plugin = {
  -- highest priority
  PRIORITY = 1000001,
  VERSION = "0.1",
}

function plugin:init_worker()
  kong.log.debug("Pre-Transformer activated")
end

function plugin:access(plugin_conf)


  kong.log.inspect(plugin_conf)   -- check the logs for a pretty-printed config!
  kong.service.request.set_header(plugin_conf.request_header, "this is on a request")

end


function plugin:log(plugin_conf)

  -- your custom code here
  kong.log.debug("saying hi from the 'log' handler")

end


-- return our plugin object
return plugin
