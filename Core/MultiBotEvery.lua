-- Confirmation popup for Autogear
if not StaticPopupDialogs["MULTIBOT_AUTOGEAR_CONFIRM"] then
  StaticPopupDialogs["MULTIBOT_AUTOGEAR_CONFIRM"] = {
    text = MultiBot.tips.every.autogearpopup,
    button1 = ACCEPT,
    button2 = CANCEL,
    OnAccept = function(self, data)
      if data and data.target then
        SendChatMessage("autogear", "WHISPER", nil, data.target)
      end
    end,
    timeout = 0,
    whileDead = 1,
    hideOnEscape = 1,
    preferredIndex = 3, -- évite les conflits d’index avec d’autres popups
  }
end

MultiBot.addEvery = function(pFrame, pCombat, pNormal)
	
    -- MENU MISC --------------------------------------------
    -- Crée un sous-frame « Misc » au-dessus du bouton
    local tMisc = pFrame.addFrame("Misc",  64,  29)
    tMisc:Hide()
 
    -- Bouton parent « Misc »
    local btnMisc = pFrame.addButton("Misc",  64,  0, "inv_misc_enggizmos_swissarmy", MultiBot.tips.every.misc)
    btnMisc.doLeft = function(self)
       if tMisc:IsShown() then
          tMisc:Hide()
       else
          tMisc:Show()
       end
    end

	local dy = 26
	local y  = 0
	
	for _, data in ipairs{
		{ "Wipe",        "Achievement_Halloween_Ghost_01", MultiBot.tips.every.wipe,        function(b) MultiBot.ActionToTarget("wipe", b.getName()) end },
		--{ "Autogear",    "inv_misc_enggizmos_30",     MultiBot.tips.every.autogear,    function(b) SendChatMessage("autogear", "WHISPER", nil, b.getName()) end },
		{ "Autogear",    "inv_misc_enggizmos_30",          MultiBot.tips.every.autogear,   function(b)
            StaticPopup_Show("MULTIBOT_AUTOGEAR_CONFIRM", b.getName(), nil, { target = b.getName() })
          end
        },
		{ "Maintenance", "Achievement_Halloween_Smiley_01",     MultiBot.tips.every.maintenance, function(b) SendChatMessage("maintenance", "WHISPER", nil, b.getName()) end },
	} do
		local btn = tMisc.addButton(data[1], 0, y, data[2], data[3])
		btn.doLeft = data[4]
		y = y + dy	
	end
	
    --[[-- Favorite toggle
    local btnFav = tMisc.addButton("Favorite", 0, y, "Interface\\Icons\\INV_Misc_Star_01", MultiBot.tips.every.favorite)
    btnFav.doLeft = function(b)
        local name = b.getName() or (b.parent and b.parent.name)
        if name then
            MultiBot.ToggleFavorite(name)
            -- Feedback optionnel
            if MultiBot.IsFavorite(name) then
                DEFAULT_CHAT_FRAME:AddMessage("|cffFFD700[MultiBot]|r " .. name .. " " .. (MultiBot.tips and MultiBot.tips.every and MultiBot.tips.every.favorited or "is now a Favorite."))
            else
                DEFAULT_CHAT_FRAME:AddMessage("|cffFFD700[MultiBot]|r " .. name .. " " .. (MultiBot.tips and MultiBot.tips.every and MultiBot.tips.every.unfavorited or "removed from Favorites."))
            end
        end
    end
    y = y + dy]]--
    -- Favorite toggle
    local FAV_ON_TEX = "Interface\\RaidFrame\\ReadyCheck-Ready"     -- cœur
    local FAV_OFF_TEX     = "Interface\\RaidFrame\\ReadyCheck-NotReady"    -- X

    local btnFav = tMisc.addButton("Favorite", 0, y, FAV_ON_TEX, MultiBot.tips.every.favorite)

    local function SetBtnIcon(b, tex)
      if not b then return end
      -- API de ta fabrique si dispo
      if b.setTexture then
        pcall(b.setTexture, tex)
        return
      end
      -- Fallback: bouton/frame Blizzard
      local f = (b.frame and b.frame.SetNormalTexture and b.frame)
             or (b.button and b.button.SetNormalTexture and b.button)
             or b
      if f and f.SetNormalTexture then
        f:SetNormalTexture(tex)
      end
    end

    local function UpdateFavoriteIcon(b)
      local name = (b.getName and b.getName()) or (b.parent and b.parent.name)
      local isFav = name and MultiBot.IsFavorite(name)
      SetBtnIcon(b, isFav and FAV_OFF_TEX or FAV_ON_TEX)
    end

    btnFav.doLeft = function(b)
      local name = b.getName() or (b.parent and b.parent.name)
      if not name then return end
      MultiBot.ToggleFavorite(name)
      UpdateFavoriteIcon(b)
      -- Feedback optionnel
      if MultiBot.IsFavorite(name) then
        DEFAULT_CHAT_FRAME:AddMessage("|cffFFD700[MultiBot]|r " .. name .. " " .. (MultiBot.tips and MultiBot.tips.every and MultiBot.tips.every.favorited or "is now a Favorite."))
      else
        DEFAULT_CHAT_FRAME:AddMessage("|cffFFD700[MultiBot]|r " .. name .. " " .. (MultiBot.tips and MultiBot.tips.every and MultiBot.tips.every.unfavorited or "removed from Favorites."))
      end
    end

    -- Met la bonne icône quand le sous-menu s'affiche (au cas où l'état a changé ailleurs)
    if tMisc and tMisc.HookScript then
      tMisc:HookScript("OnShow", function() UpdateFavoriteIcon(btnFav) end)
    end
    UpdateFavoriteIcon(btnFav)
    y = y + dy

    -- MENU MISC END-----------------------------------------
	   
	pFrame.addButton("Summon", 94, 0, "ability_hunter_beastcall", MultiBot.tips.every.summon)
	.doLeft = function(pButton)
		MultiBot.ActionToTarget("summon", pButton.getName())
	end
	
	pFrame.addButton("Uninvite", 124, 0, "inv_misc_grouplooking", MultiBot.tips.every.uninvite).doShow()
	.doLeft = function(pButton)
		MultiBot.doSlash("/uninvite", pButton.getName())
		pButton.getButton("Invite").doShow()
		pButton.doHide()
	end
	
	pFrame.addButton("Invite", 124, 0, "inv_misc_groupneedmore", MultiBot.tips.every.invite).doHide()
	.doLeft = function(pButton)
		MultiBot.doSlash("/invite", pButton.getName())
		pButton.getButton("Uninvite").doShow()
		pButton.doHide()
	end
	
	pFrame.addButton("Food", 154, 0, "inv_drink_24_sealwhey", MultiBot.tips.every.food).setDisable()
	.doLeft = function(pButton)
		MultiBot.OnOffActionToTarget(pButton, "nc +food,?", "nc -food,?", pButton.getName())
	end
	
	pFrame.addButton("Loot", 184, 0, "inv_misc_coin_16", MultiBot.tips.every.loot).setDisable()
	.doLeft = function(pButton)
		MultiBot.OnOffActionToTarget(pButton, "nc +loot,?", "nc -loot,?", pButton.getName())
	end
	
	pFrame.addButton("Gather", 214, 0, "trade_mining", MultiBot.tips.every.gather).setDisable()
	.doLeft = function(pButton)
		MultiBot.OnOffActionToTarget(pButton, "nc +gather,?", "nc -gather,?", pButton.getName())
	end

	-- Selfbot is not allowed to use these Tools --
	if(pFrame.getName() == UnitName("player")) then return end
	
	pFrame.addButton("Inventory", 244, 0, "inv_misc_bag_08", MultiBot.tips.every.inventory).setDisable()
	.doLeft = function(pButton)
		if(pButton.state) then
			MultiBot.inventory:Hide()
			pButton.setDisable()
		else
			local tUnits = MultiBot.frames["MultiBar"].frames["Units"]
			for key, value in pairs(MultiBot.index.actives) do 
				if(tUnits.buttons[value].name ~= UnitName("player")) then
					tUnits.frames[value].getButton("Inventory").setDisable()
				end
			end
			
			pButton.setEnable()
			MultiBot.inventory.name = pButton.getName()
			tUnits.buttons[MultiBot.inventory.name].waitFor = "INVENTORY"
			SendChatMessage("items", "WHISPER", nil, pButton.getName())
		end
	end
	
	pFrame.addButton("Spellbook", 274, 0, "inv_misc_book_09", MultiBot.tips.every.spellbook).setDisable()
	.doLeft = function(pButton)
		if(pButton.state) then
			MultiBot.spellbook:Hide()
			pButton.setDisable()
		else
			local tUnits = MultiBot.frames["MultiBar"].frames["Units"]
			for key, value in pairs(MultiBot.index.actives) do
				if(tUnits.buttons[value].name ~= UnitName("player")) then
					tUnits.frames[value].getButton("Spellbook").setDisable()
				end
			end
			
			pButton.setEnable()
			MultiBot.spellbook.name = pButton.getName()
			tUnits.buttons[MultiBot.spellbook.name].waitFor = "SPELLBOOK"
			SendChatMessage("spells", "WHISPER", nil, pButton.getName())
		end
	end
	
	pFrame.addButton("Talent", 304, 0, "ability_marksmanship", MultiBot.tips.every.talent).setDisable()
	.doLeft = function(pButton)
		if(pButton.state) then
			pButton.setDisable()
			MultiBot.talent:Hide()
		elseif(UnitLevel(MultiBot.toUnit(pButton.getName())) < 10) then
			SendChatMessage(MultiBot.info.talent.Level, "SAY")
		elseif(CheckInteractDistance(MultiBot.toUnit(pButton.getName()), 1) == nil) then
			SendChatMessage(MultiBot.info.talent.OutOfRange, "SAY")
		else
			MultiBot.talent:Hide()
			MultiBot.talent.doClear()
			
			local tUnits = MultiBot.frames["MultiBar"].frames["Units"]
			for key, value in pairs(MultiBot.index.actives) do
				if(tUnits.buttons[value].name ~= UnitName("player")) then
					tUnits.frames[value].getButton("Talent").setDisable()
				end
			end
			
			InspectUnit(MultiBot.toUnit(pButton.getName()))
			pButton.setEnable()
			
			MultiBot.talent.name = pButton.getName()
			MultiBot.talent.class = pButton.getClass()
			MultiBot.auto.talent = true
		end
	end
	
	-- BOUTON SETTALENTS : toggle affichage de la barre des specs
    local btn = pFrame
        .addButton("SetTalents", 334, 0, "inv_sword_22", MultiBot.tips.every.settalent)
    -- état initial : toujours désactivé (zen, pas de barre affichée au load)
    btn:setDisable()
	
    btn.doLeft = function(self)
      -- si le dropdown existe et est visible → on le ferme
      if MultiBot.spec.dropdown and MultiBot.spec.dropdown:IsShown() then
        MultiBot.spec:HideDropdown()
        self:setDisable()
      else
        -- sinon on envoie la requête au bot, et on active le bouton
        MultiBot.spec:RequestList(self:getName(), self)
        self:setEnable()
      end
    end
	
-- STRATEGIES --
	
	if(MultiBot.isInside(pNormal, "food")) then pFrame.getButton("Food").setEnable() end
	if(MultiBot.isInside(pNormal, "loot")) then pFrame.getButton("Loot").setEnable() end
	if(MultiBot.isInside(pNormal, "gather")) then pFrame.getButton("Gather").setEnable() end
end