# lb-wallet
Wallet script to create wallets/purses items as stashes


-  Add the following items to shared.lua/items.lua

```lua
["wallet"]              = {["name"] = "wallet",         ["label"] = "Leather Wallet", 		    ["weight"] = 2000, 		["type"] = "item", 		["image"] = "backpack.png", ["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "Leather Wallet"},
	["lvwallet"]            = {["name"] = "lvwallet",       ["label"] = "Louis Vuitton Wallet", 	["weight"] = 2000, 		["type"] = "item", 		["image"] = "backpack.png", ["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "Louis Vuitton Wallet"},
	["gucciwallet"]         = {["name"] = "gucciwallet",    ["label"] = "Gucci Wallet", 		    ["weight"] = 2000, 		["type"] = "item", 		["image"] = "backpack.png", ["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "Gucci Wallet"},
    ["spadeclutch"]         = {["name"] = "spadeclutch",    ["label"] = "Kate Spade Clutch", 		["weight"] = 2000, 		["type"] = "item", 		["image"] = "backpack.png", ["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "Kate Spade Clutch"},
	["spadepurse"]          = {["name"] = "spadepurse",     ["label"] = "Kate Spade Purse", 		["weight"] = 2000, 		["type"] = "item", 		["image"] = "backpack.png", ["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "Kate Spade Purse"},
	["lvclutch"]            = {["name"] = "lvclutch",       ["label"] = "Louis Vuitton Clutch", 	["weight"] = 2000, 		["type"] = "item", 		["image"] = "backpack.png", ["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "Louis Vuitton Clutch"},
    ["lvpurse"]             = {["name"] = "lvpurse",        ["label"] = "Louis Vuitton Purse", 	    ["weight"] = 2000, 		["type"] = "item", 		["image"] = "backpack.png", ["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "Louis Vuitton Purse"},
	["gucciclutch"]         = {["name"] = "gucciclutch",    ["label"] = "Gucci Clutch", 		    ["weight"] = 2000, 		["type"] = "item", 		["image"] = "backpack.png", ["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "Gucci Clutch"},
	["guccipurse"]          = {["name"] = "guccipurse",     ["label"] = "Gucci Purse", 		        ["weight"] = 2000, 		["type"] = "item", 		["image"] = "backpack.png", ["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "Gucci Purse"},
    ["chanelclutch"]        = {["name"] = "chanelclutch",   ["label"] = "Chanel Clutch", 		    ["weight"] = 2000, 		["type"] = "item", 		["image"] = "backpack.png", ["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "Chanel Clutch"},
	["chanelpurse"]         = {["name"] = "chanelpurse",    ["label"] = "Chanel Purse", 		    ["weight"] = 2000, 		["type"] = "item", 		["image"] = "backpack.png", ["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "Chanel Purse"},

```

- Make the following changes in inventory/html/app.js to display the backpack id when you hover over the item (optional)

Look for this logic
```js
else if (itemData.name == "labkey") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html("<p>Lab: " + itemData.info.lab + "</p>");
            
        } 
```

and add the following lines below it, like this

```js
else if (itemData.name == "labkey") {
    $(".item-info-title").html("<p>" + itemData.label + "</p>");
    $(".item-info-description").html("<p>Lab: " + itemData.info.lab + "</p>");
} else if (itemData.name == "smallbackpack") {
    $(".item-info-title").html("<p>" + itemData.label + "</p>");
    $(".item-info-description").html("<p>Backpack ID: " + itemData.info.backpackid + "</p>");
} else if (itemData.name == "mediumbackpack") {
    $(".item-info-title").html("<p>" + itemData.label + "</p>");
    $(".item-info-description").html("<p>Backpack ID: " + itemData.info.backpackid + "</p>");
} else if (itemData.name == "largebackpack") {
    $(".item-info-title").html("<p>" + itemData.label + "</p>");
    $(".item-info-description").html("<p>Backpack ID: " + itemData.info.backpackid + "</p>");
}
