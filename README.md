# lb-wallet

Wallet script to create wallets/purses items as stashes.

* Original Backpack Script by [snipe-scripts](https://github.com/snipe-scripts/snipe-backpack)
* Deconvolutes Inventory
* Robbable
* Only Stores items that weigh 0.0
  
Add the following items to shared.lua/items.lua

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

Make the following changes in inventory/html/app.js to display the backpack id when you hover over the item (optional)

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
            $(".item-info-description").html("<p>Lab: " + itemData.info.lab + "</p><p style=\"font-size:11px\"><b>Weight: </b>" + itemData.weight + " | <b>Amount: </b> " + itemData.amount + " | <b>Quality: </b> " + "<a style=\"font-size:11px;color:green\">" + Math.floor(itemData.info.quality) + "</a>");
        } else if (itemData.name == "labkey") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html("<p>Lab: " + itemData.info.lab + "</p>");
        } else if (itemData.name == "wallet") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html("<p>Wallet ID: " + itemData.info.walletid + "</p>");
        } else if (itemData.name == "lvwallet") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html("<p>Louis Vuitton Wallet ID: " + itemData.info.walletid + "</p>");
        } else if (itemData.name == "gucciwallet") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html("<p>Gucci Wallet ID: " + itemData.info.walletid + "</p>");
        } else if (itemData.name == "spadeclutch") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html("<p>Kate Spade Clutch ID: " + itemData.info.clutchid + "</p>");
        } else if (itemData.name == "spadepurse") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html("<p>Kate Spade Purse ID: " + itemData.info.purseid + "</p>");
        } else if (itemData.name == "lvclutch") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html("<p>Louis Vuitton Clutch ID: " + itemData.info.clutchid + "</p>");
        } else if (itemData.name == "lvpurse") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html("<p>Louis Vuitton Purse ID: " + itemData.info.purseid + "</p>");
        } else if (itemData.name == "gucciclutch") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html("<p>Gucci Clutch ID: " + itemData.info.clutchid + "</p>");
        } else if (itemData.name == "guccipurse") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html("<p>Gucci Purse ID: " + itemData.info.purseid + "</p>");
        } else if (itemData.name == "chanelclutch") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html("<p>Chanel Clutch ID: " + itemData.info.clutchid + "</p>");
        } else if (itemData.name == "chanelpurse") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html("<p>Chanel Purse ID: " + itemData.info.purseid + "</p>");
        }
