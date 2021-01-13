local dbConnection = nil;
local dbConnect = dbConnect
local addEventHandler = addEventHandler
local getResourceName = getResourceName
local getResourceRootElement = getResourceRootElement
local assert = assert
local setElementData = setElementData
local fstring = string.format

addEventHandler('onResourceStart', root, function(resource)
    dbConnection = dbConnection or dbConnect('sqlite', ':/dump.db')
    if not dbConnection then
      return false
    end

    local resourceMeta = xmlLoadMeta(fstring(':%s/meta.xml', getResourceName(resource)), true)
    if not resourceMeta then
      return
    end

    resourceMeta = nil

    return setElementData(getResourceRootElement(resource), 'db-connection', dbConnection, false)
  end
)

-- example
--addEventHandler('onElementDataChange', resourceRoot, function(theKey, _, newValue)
--  if not ( theKey == 'db-connection' ) then
--    return false
--  end
--  dbConnection = newValue
--end
--)
