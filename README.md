# Fishing script for QB

**[Original Script](doj-fishing: https://github.com/dojwun/doj-fishing)**
NOTE: I did not create the script I simply added more to it. My changes will be stated at the bottom.

# About
- Optimized
- Fish anywhere
- Random loot pool
- 3 diffrent skillbars to choose from
- Utilizes qb-target,qb-menu,& text ui

# Info
- **[Rent](https://streamable.com/bymhyv)** a fishing boat
- **[Return](https://streamable.com/ns3qeb)** boat for small refund
- **[Fish](https://streamable.com/ca7wo7)** spawn once caught
- **[Sell](https://streamable.com/5c8nm0)** regular fish easily & exotics no so much 
- **[Purchase](https://i.imgur.com/LIj0Rs8.png)** fishing gear to start your trip 
- **[Store](https://i.imgur.com/eeQrnD0.png)** fish you have caught
- **[Inventory Tooltip](https://i.imgur.com/vnpIb2b.png)** will display species, weight & type
 
- Catch & Sell 13 diffrent items (5 fish, 4 exotic, 2 Trash, 2 Rewards)
- Chance to find a **[Tackle Box](https://streamable.com/4e1kte)** left over from another fisherman when purchasing a boat
- ***Tackle Box*** contains a **[Pearls Seafood Card](https://i.imgur.com/xFEmoLt.png)** required to sell exotic fish
- Chance to catch a ***Small Loot Box*** & ***Treasure Chest*** while fishing
- **[Small Loot Box](https://streamable.com/4ff2ht)** contains a **[Corroded Key](https://i.imgur.com/Pyg81vH.png)** that is needed to open a **[Treasure Chest](https://i.imgur.com/dIKE1rw.png)**




# Dependencies

**[qb-menu](https://github.com/qbcore-framework/qb-menu)**


**[qb-target](https://github.com/BerkieBb/berkie-target)**


**[progressBars](https://drive.google.com/drive/folders/1uuxtWibJIZYx2yDY_7y4mnl5AbqDpSqt?usp=sharing)**

### Skillbars

**[reload-skillbar](https://github.com/Utinax/reload-skillbar)**

**[np-skillbar](https://drive.google.com/drive/folders/1BqmRG_MBBHqXnsQoPs5iB4glj8MLQphv?usp=drive_link)**

**[qb-skillbar](https://github.com/qbcore-framework/qb-skillbar)**


# images
- **Regular Fish**

![bass](https://i.imgur.com/kye5oAh.png)
![sting](https://i.imgur.com/KtUf7C6.png)
![flounder](https://i.imgur.com/O0JYxfp.png)
![codfish](https://i.imgur.com/rfwERIW.png)
![mackerel](https://i.imgur.com/A1Qrktl.png)

- **Trash items**
 
![fishingboot](https://i.imgur.com/Vuk4yHA.png)
![fishingtin](https://i.imgur.com/8G5Mx4i.png)

- **Exotic Fish**

![tiger](https://i.imgur.com/L5Zi26u.png)
![hammer](https://i.imgur.com/SpDnz4O.png)
![dolphin](https://i.imgur.com/Pisfl7A.png)
![whale](https://i.imgur.com/iB9Ky68.png)

- **Gear & items**
 
![rod](https://i.imgur.com/dzM4b7U.png)
![bait](https://i.imgur.com/A4XBvDb.png)
![anchor](https://i.imgur.com/1OYiDYa.png)
![fishingicebox](https://i.imgur.com/YnJzonA.png)

- **Rewards**
 
![tacklebox](https://i.imgur.com/DmYYb30.png)
![key](https://i.imgur.com/Pyg81vH.png)
![smallloot](https://i.imgur.com/fGsqgZQ.png)
![bigloot](https://i.imgur.com/TcCevdc.png)
![pearlscard](https://i.imgur.com/xFEmoLt.png)

# Required
- qb-core/shared/items.lua 
```
	-- Regular Fish
	flounder		= {name = 'flounder',label = 'Flounder',weight = 2500,type = 'item',image = 'flounder.png',unique = true,useable = false,shouldClose = false,combinable = nil, description = 'Flounder'},
	codfish			= {name = 'codfish',label = 'Cod',weight = 2500,type = 'item',image = 'codfish.png', unique = true,useable = false,shouldClose = false,combinable = nil, description = 'Cod'},
	mackerel		= {name = 'mackerel',label = 'Mackerel',weight = 2500,type = 'item',image = 'mackerel.png',unique = true,useable = false,shouldClose = false,combinable = nil, description = 'Mackerel'},
	bass			= {name = 'bass', label = 'Bass',weight = 1250,type = 'item',image = 'bass.png',unique = true,useable = false,shouldClose = false,combinable = nil, description = 'A normal fish Tatses pretty good!'},
	bluegill		= {name = 'bluegill',label = 'bluegill',weight = 1250,type = 'item',image = 'bluegill.png', unique = true,useable = false,shouldClose = false,combinable = nil, description = 'A normal fish Tatses pretty good!'},
	butterflyfish 	= {name = 'butterflyfish',label = 'butterflyfish',weight = 1250,type = 'item',image = 'butterflyfish.png',unique = true,useable = false,shouldClose = false,combinable = nil, description = 'A normal fish Tatses pretty good!'},
	clownfish		= {name = 'clownfish', label = 'clownfish', weight = 1250,type = 'item',image = 'clownfish.png',unique = true,useable = false,shouldClose = false,combinable = nil, description = 'A normal fish Tatses pretty good!'},
	Northern_Pike 	= {name = 'Northern_Pike',label = 'Northern_Pike',weight = 1250,type = 'item',image = 'Northern_Pike.png',unique = true,useable = false,shouldClose = false,combinable = nil, description = 'A normal fish Tatses pretty good!'},
	oceanfish		= {name = 'oceanfish', label = 'oceanfish', weight = 1250,type = 'item',image = 'oceanfish.png',unique = true,useable = false,shouldClose = false,combinable = nil, description = 'A normal fish Tatses pretty good!'},
	parrotfish		= {name = 'parrotfish', label = 'parrotfish',weight = 1250,type = 'item',image = 'parrotfish.png',unique = true,useable = false,shouldClose = false,combinable = nil, description = 'A normal fish Tatses pretty good!'},
	fish			= {name 	= "fish", label = "fish",	weight = 100,decay = 0,type = "item",image = "fish.png", created = nil,unique = false,useable = true,shouldClose = true,combinable = nil, description = ""},
	fish2			= {name = "fish2", label = "fish2",	weight = 100,decay = 0,type = "item",image = "fish2.png", created = nil,unique = false,useable = true,shouldClose = true,combinable = nil, description = ""},
	goldfish		= {name = "goldfish", label = "goldfish",	weight = 100,decay = 0,type = "item",image = "goldfish.png", created = nil,unique = false,useable = true,shouldClose = true,combinable = nil, description = ""},
	largemouthbass	= {name = "largemouthbass", label = "largemouthbass",	weight = 100,decay = 0,type = "item",image = "largemouthbass.png", created = nil,unique = false,useable = true,shouldClose = true,combinable = nil, description = ""},
	redfish			= {name = "redfish", label = "redfish",	weight = 100,decay = 0,type = "item",image = "redfish.png", created = nil,unique = false,useable = true,shouldClose = true,combinable = nil, description = ""},
	salmon			= {name = "salmon", label = "salmon",	weight = 100,decay = 0,type = "item",image = "salmon.png", created = nil,unique = false,useable = true,shouldClose = true,combinable = nil, description = ""},
	stripedbass		= {name = "stripedbass", label = "stripedbass",	weight = 100,decay = 0,type = "item",image = "stripedbass.png", created = nil,unique = false,useable = true,shouldClose = true,combinable = nil, description = ""},
	
	-- Trash Items
	fishingtin 		= {name = 'fishingtin', label = 'Fishing Tin', weight = 2500, type = 'item', image = 'fishingtin.png',unique = false,useable = false,shouldClose = false,combinable = nil, description = 'Fishing Tin'},	
	fishingboot 	= {name = 'fishingboot', label = 'Fishing Boot',weight = 2500, type = 'item', image = 'fishingboot.png',unique = false,useable = false,shouldClose = false,combinable = nil, description = 'Fishing Boot'},	
	
	-- Exotic Fish
	killerwhale 	= {name = 'killerwhale', label = 'Whale',weight = 15000,type = 'item', image = 'killerwhale.png',unique = true, useable = false,shouldClose = false,combinable = nil, description = 'Killer Whale'},	
	dolphin			= {name = 'dolphin',label = 'Dolphin',weight = 5000,type = 'item',image = 'dolphin.png', unique = true,useable = false,shouldClose = false,combinable = nil, description = 'Dolphin'},
	sharkhammer		= {name = 'sharkhammer', label = 'Shark',weight = 5000,type = 'item',image = 'sharkhammer.png',unique = true,useable = false,shouldClose = false,combinable = nil, description = 'Hammerhead Shark'},
	sharktiger		= {name = 'sharktiger', label = 'Shark', weight = 5000,type = 'item',image = 'sharktiger.png',unique = true,useable = false,shouldClose = false,combinable = nil, description = 'Tigershark'},
	seahorse		= {name = 'seahorse',label = 'seahorse',weight = 1250,type = 'item',image = 'seahorse.png', unique = true,useable = false,shouldClose = false,combinable = nil, description = 'A normal fish Tatses pretty good!'},
	seaturtle		= {name = 'seaturtle', label = 'seaturtle', weight = 1250,type = 'item',image = 'seaturtle.png',unique = true,useable = false,shouldClose = false,combinable = nil, description = 'A normal fish Tatses pretty good!'},
	catfish			= {name = "catfish", label = "catfish",	weight = 100,decay = 0,type = "item",image = "catfish.png", created = nil,unique = false,useable = true,shouldClose = true,combinable = nil, description = ""},
	catfish2		= {name = "catfish2", label = "catfish2",	weight = 100,decay = 0,type = "item",image = "catfish2.png", created = nil,unique = false,useable = true,shouldClose = true,combinable = nil, description = ""},
	whale			= {name = "whale", label = "whale",	weight = 100,decay = 0,type = "item",image = "whale.png", created = nil,unique = false,useable = true,shouldClose = true,combinable = nil, description = ""},
	whale2			= {name = "whale2", label = "whale2",	weight = 100,decay = 0,type = "item",image = "whale2.png", created = nil,unique = false,useable = true,shouldClose = true,combinable = nil, description = ""},
	stingray		= {name = 'stingray',label = 'Stingray',weight = 2500,type = 'item',image = 'stingray.png',unique = true,useable = false,shouldClose = false,combinable = nil, description = 'Stingray'},

	-- Gear
	fishbait		= {name = 'fishbait',label = 'Fish Bait', weight = 400, type = 'item', image = 'fishbait.png',unique = false,useable = true, shouldClose = true,combinable = nil, description = 'Fishing bait'},
	fishingrod		= {name = 'fishingrod', label = 'Fishing Rod', weight = 750, type = 'item', image = 'fishingrod.png',unique = false,useable = true, shouldClose = true,combinable = nil, description = 'A fishing rod for adventures with friends!!'},	
	anchor			= {name = 'anchor',label = 'Boat Anchor', weight = 2500, type = 'item', image = 'anchor.png', unique = false,useable = true, shouldClose = true,combinable = nil, description = 'Boat Anchor'},	
	fishicebox 		= {name = 'fishicebox', label = 'Fishing Ice Chest', weight = 2500, type = 'item', image = 'fishicebox.png',unique = true,useable = true, shouldClose = true,combinable = nil, description = 'Ice Box to store all of your fish'},	
	
	-- Rewards
	fishingloot 	= {name = 'fishingloot', label = 'Metal Box', weight = 500, type = 'item', image = 'fishingloot.png',unique = false,useable = true, shouldClose = true,combinable = nil, description = 'Seems to be a corroded from the salt water, Should be easy to open'},	
	fishinglootbig 	= {name = 'fishinglootbig',label = 'Treasure Chest',weight = 2500, type = 'item', image = 'fishinglootbig.png', unique = false,useable = true, shouldClose = true,combinable = nil, description = 'The lock seems to be intact, Might need a key'},	
	fishingkey 		= {name = 'fishingkey',label = 'Corroded Key',weight = 100, type = 'item', image = 'fishingkey.png', unique = false,useable = true, shouldClose = true,combinable = nil, description = 'A weathered key that looks usefull'},	
	fishtacklebox 	= {name = 'fishtacklebox',label = 'Tackle Box', weight = 1000, type = 'item', image = 'fishtacklebox.png', unique = false,useable = true, shouldClose = true,combinable = nil, description = 'Seems to be left over tackle box from another fisherman'},	
	pearlscard 		= {name = 'pearlscard', label = 'Pearls Seafood',weight = 100, type = 'item', image = 'pearlscard.png',unique = false,useable = true, shouldClose = true,combinable = nil, description = 'A special member of Pearl\'s Seafood Restaurant'},	

 ```


# Optional (if you are not using my **[qb-inventory](https://github.com/bookafishingwun/qb-inventory)**)
- This code is to display **[Inventory Tooltip](https://i.imgur.com/vnpIb2b.png)** 
- inside ```qb-inventory/html/js/app.js``` look for the ```function FormatItemInfo```
```
	else if (itemData.name == "bass") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "stingray") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "flounder") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "codfish") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "mackerel") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "dolphin") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "sharkhammer") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "sharktiger") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "killerwhale") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "fishicebox") {
            $(".item-info-title").html('<p>' + itemData.label + ' ' + itemData.info.boxid + '</p>')
            $(".item-info-description").html('<p><strong>Box Owner: </strong><span>' + itemData.info.boxOwner + '</span></p> Ice Box to store all of your fish');
        } else if (itemData.name == "bluegill") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
             $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "butterflyfish") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "clownfish") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "Northern_Pike") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "oceanfish") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "parrotfish") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "seahorse") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "seaturtle") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "fish") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "fish2") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "goldfish") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "largemouthbass") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "redfish") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "salmon") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "stripedbass") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "catfish") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "catfish2") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } else if (itemData.name == "whale") {
            $(".item-info-title").html('<p>' + itemData.label + ' ' + itemData.info.boxid + '</p>')
            $(".item-info-description").html('<p><strong>Box Owner: </strong><span>' + itemData.info.boxOwner + '</span></p> Ice Box to store all of your fish');
        } else if (itemData.name == "whale2") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
             $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        } 
```  



BOOKA:
ChangeLog: 

- Removed the use of the fishing props when catching a fish it doesnt spawn a fish on you anymore
- added all default images into images folder from imgur

# Required
- qb-core/shared/items.lua 
```
	-- Regular Fish

	-- Trash Items
	
    -- Exotic Fish
	
    -- Gear    
	
    -- Rewards

```

- inside ```qb-inventory/html/js/app.js``` look for the ```function FormatItemInfo```
```
	else if (itemData.name == "") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Species: ' + itemData.info.species + '</p>Weight: ' + itemData.info.lbs + ' lbs</p>Type: ' + itemData.info.type);
        }
```