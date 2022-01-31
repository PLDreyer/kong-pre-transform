local M = {}

-- remove request headers with defined header array
local function remove_headers(headers)
  for _, header in ipairs(headers) do
    value = kong.request.get_header(header)
    if value then
      kong.log.info("Header found and removed: "..header.."-"..value)
      kong.service.request.clear_header(header)
    end
  end
end

-- remove request properties with configured remove table
local function remove_properties(remove_table)
  remove_headers(remove_table.headers)
end

-- convert plugin config to transform config
function M.get_config(plugin_config)
  return {
    remove = plugin_config.remove,
  }
end

-- apply transform on request with transform config
function M.transform_request(transform_config)
  for key, value in pairs(transform_config) do
    if key == "remove" then
      remove_properties(value)
    end
  end
end

return M
