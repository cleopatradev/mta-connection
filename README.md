# mta-connection
A dbConnection resource for MTA:SA supports create dynamic connections


#### İnstall instructions
```markdown
# Edit config on server.lua
- find dbConnect
- edit variables like dbConnect('sqlite', ':/dump.db')
- information at https://wiki.mtasa.com/wiki/dbConnect
```

```markdown
# Find which resource want to connect database and open resource meta.xml file
- add <dbConnection database="[dbname]" />
- save and close file
- restart the resource
```
##### `meta.xml` example
```xml
<meta>
  <info author="enesbayrktar" version="1.0.0" name="GTTstorage" type="script" />
  <min_mta_version server="1.5.6-9.18728" client="1.5.8-9.20698.0" />
  <dbConnection database="default" />

  <script type="shared" src="shared.lua" />
  <script type="server" src="server.lua" />
</meta>
```


```markdown
# How to integrate connection?
- open server.lua
- add lines to below of youre server.lua
```

##### `server.lua` example
```lua
dbConnection = false;

addEventHandler('onElementDataChange', resourceRoot, function(theKey, _, newValue)
    if not ( theKey == 'db-connection' ) then
      return false
    end
    dbConnection = newValue
  end
)
```
