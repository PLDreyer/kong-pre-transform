local typedefs = require "kong.db.schema.typedefs"
local validate_header_name = require("kong.tools.utils").validate_header_name
local plugin_name = ({...})[1]:match("^kong%.plugins%.([^%.]+)")

function validate_headers(pair)
  local name, _ = pair:match("^([^:]+):*(.-)$")
  if validate_header_name(name) == nil then
    return nil, string.format("'%s' is not a valid header", tostring(name))
  end
  return true
end

local schema = {
  name = plugin_name,
  fields = {
    { consumer = typedefs.no_consumer },
    { protocols = typedefs.protocols_http },
    { config = {
        type = "record",
        fields = {
          {
            -- remove configuration
            remove = {
              type = "record",
              fields = {
                {
                  headers = {
                    type = "array",
                    elements = {
                      type = "string",
                      custom_validator = validate_headers
                    }
                  }
                }
              }
            }
          }
        },
        entity_checks = {
        },
      },
    },
  },
}

return schema
