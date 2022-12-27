![Serrulata Studios Banner](https://i.imgur.com/wG4hycs.gif)

# IMPORTANT
```
* Delate seatbelt.lua from qb-smallresources 
* Remove anything to do with harnes from server.lua from qb-smallresources 
# Installation
```
* Download the script and put it in the [resource] folder.

* Upload SQL found harness.sql

* Replace exports['qb-smallresources']:HasHarness() with exports['serrulata-harness']:HasHarness()

* Add Following Items to qb-core > items.lua

* Only supports cd_dispatch. Add your own dispatch in main.lua!
```
    ['harness'] = {
        ['name'] = 'harness',
        ['label'] = 'Race Harness',
        ['weight'] = 1000,
        ['type'] = 'item',
        ['image'] = 'harness.png',
        ['unique'] = false,
        ['useable'] = true,
        ['shouldClose'] = true,
        ['combinable'] = nil,
        ["decay"] = 10.0,
        ['description'] = 'Racing Harness so no matter what you stay in the car'
    },
    ['harness_remover'] = {
        ['name'] = 'harness_remover',
        ['label'] = 'Harness Removing Tool',
        ['weight'] = 1000,
        ['type'] = 'item',
        ['image'] = 'advancedscrewdriver.png',
        ['unique'] = false,
        ['useable'] = true,
        ['shouldClose'] = true,
        ['combinable'] = nil,
        ["decay"] = 10.0,
        ['description'] = 'To be able to remove harness from owned vehicles'
    },
Add the following code to your server.cfg/resouces.cfg
```
ensure serrulata-harness
```

# Dependencies
* [ps-ui](https://github.com/project-sloth/ps-ui)

# Preview 
[Serrulata-Harness](https://streamable.com/sh9b3u) 


# Discord
[![](https://dcbadge.vercel.app/api/server/NerdvuJDX7)](https://discord.gg/NerdvuJDX7)

# Developer's
#### - Gale#4864
