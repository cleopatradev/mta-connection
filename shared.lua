local getResourceName = getResourceName
local xmlLoadFile = xmlLoadFile
local xmlFindChild = xmlFindChild
local xmlNodeGetAttribute = xmlNodeGetAttribute
local tonumber = tonumber
local assert = assert
local type = type

function toboolean(v)
  return v and ( ( type(v) == 'number' ) and ( v == 1 ) or ( ( type(v) == 'string' ) and ( v== 'true' ) ) )
end

function xmlLoadMeta(metaPath, readOnly)
  assert(metaPath, '@ Failed to load meta-path')
  assert(type(readOnly) == 'boolean', '@ Failed to load read-only')

  local xmlNode = xmlLoadFile(metaPath, readOnly)
  if not xmlNode then
    return false
  end

  local xmlChild = xmlFindChild(xmlNode, 'dbConnection', 0)
  if xmlChild == nil then
    return false
  end

  local dbConnection = xmlNodeGetAttribute(xmlChild, 'value')
  if not dbConnection then
    return false
  end

  xmlUnloadFile(xmlNode)
  xmlNode = nil

  collectgarbage()

  return toboolean(dbConnection)
end