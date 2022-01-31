local typedefs = require "kong.db.schema.typedefs"

local plugin_name = ({...})[1]:match("^kong%.plugins%.([^%.]+)")

local function validate_headers(pair)
  local name, value = pair:match("^([^:]+):*(.-)$")
  if validate_header_name(name) == nil then
    return nil, string.format("'%s' is not a valid header", tostring(name))
  end
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
          -- add some validation rules across fields
          -- the following is silly because it is always true, since they are both required
          -- { at_least_one_of = { "request_header", "response_header" }, },
          -- We specify that both header-names cannot be the same
          -- { distinct = { "request_header", "response_header"} },
        },
      },
    },
  },
}

return schema
