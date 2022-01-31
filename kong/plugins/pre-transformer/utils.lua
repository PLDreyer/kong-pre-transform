local M = {}

local header_cache = {

}

local function remove_headers(headers)
  for header in headers do
    ngx.req.clear_header(header)
  end
end

local function remove_properties(remove_table)
  remove_headers(remove_table.headers)
end

local function check_headers(headers)
  for header in headers do
    if
  end
end

local function check_properties(remove_table)
  check_headers(remove_table.headers)
end

function M.get_config(plugin_config)
  return {
    remove = plugin_config.remove,
    add = plugin_config.add,
  }
end

function M.transform(transform_config)
  for key, value in pairs(transform_config) do
    if key == "remove" then
      remove_properties(value)
    end
  end
end

function M.some_property_exists(transform_config)
  for key, value in pairs(transform_config) do
    if key == "remove" then
      check_properties(value)
    end
  end
end

return M
