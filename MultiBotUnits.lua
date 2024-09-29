MultiBot.newUnits = function(pParent, pX, pY, pSize)	local frame = CreateFrame("Frame", nil, pParent)	frame.index = {}	frame.index.players = {}	frame.index.players.classes = {}	frame.index.players.names = {}	frame.index.members = {}	frame.index.members.classes = {}	frame.index.members.names = {}	frame.index.friends = {}	frame.index.friends.classes = {}	frame.index.friends.names = {}	frame.index.actives = {}	frame.index.actives.classes = {}	frame.index.actives.names = {}	frame.units = {}		frame.filter = {}	frame.filter.classes = nil	frame.filter.types = nil	frame.browse = nil	frame.button = nil		frame.parent = pParent	frame.size = pSize		frame:SetPoint("BOTTOMRIGHT", pX, pY)	frame:SetSize(pSize, pSize)	frame:Show()		-- ADD --		frame.addPlayer = function(pName, pClass, pIndex)		tClass = string.lower(pClass)		if(frame.index.players.classes[tClass] == nil) then frame.index.players.classes[tClass] = {} end		table.insert(frame.index.players.classes[tClass], pName)		table.insert(frame.index.players.names, pName)		return frame.addUnit(pName, pClass, pIndex)	end		frame.addMember = function(pName, pClass, pIndex)		tClass = string.lower(pClass)		if(frame.index.members.classes[tClass] == nil) then frame.index.members.classes[tClass] = {} end		table.insert(frame.index.members.classes[tClass], pName)		table.insert(frame.index.members.names, pName)		return frame.addUnit(pName, pClass, pIndex)	end		frame.addFriend = function(pName, pClass, pIndex)		tClass = string.lower(pClass)		if(frame.index.friends.classes[tClass] == nil) then frame.index.friends.classes[tClass] = {} end		table.insert(frame.index.friends.classes[tClass], pName)		table.insert(frame.index.friends.names, pName)		return frame.addUnit(pName, pClass, pIndex)	end		frame.addUnit = function(pName, pClass, pIndex)		if(frame.units[pName] == nil) then frame.units[pName] = MultiBot.newUnit(frame, pName, pClass, 0, (frame.size + 2) * pIndex, frame.size) end		return frame.units[pName]	end		-- SET --		frame.setPlayers = function(pRoster)		local tTable = MultiBot.doSplit(pRoster, ", ")		local tLimit = table.getn(tTable)		local tIndex = 1				frame.limit = tLimit + 1		frame.from = 1		frame.to = 10				local tLocClass, tClass, tLocRace, tRace, tSex, tName = GetPlayerInfoByGUID(UnitGUID("player"))		tClass = MultiBot.toClass(tClass)				local tPlayer = frame.addPlayer(tName, tClass, tIndex)		tPlayer.setButton({			"TOGGLE:UNITS",			UnitName("player"),			"inv_misc_head_clockworkgnome_01",			".playerbot bot self",			".playerbot bot self",			"Left to show or hide Options | Right to unbot yourself",			"Left to bot Yourself",			UnitName("player")		})				for i = 1, tLimit do			local tFrom, tTo = string.find(tTable[i], " ", 1)			local tName = string.sub(tTable[i], 2, tFrom - 1)			local tClass = string.sub(tTable[i], tTo + 1)			local tOnline = string.sub(tTable[i], 1, 1)						-- Ensure that Memberbot is not your current Character			if(tName ~= UnitName("player")) then				tClass = MultiBot.toClass(tClass)				tIndex = tIndex + 1								local tPlayer = frame.addPlayer(tName, tClass, tIndex)				tPlayer.setButton({					"TOGGLE:UNITS",					tName,					"Interface\\AddOns\\MultiBot\\Icons\\class_" .. string.lower(tClass) .. ".blp",					".playerbot bot remove " .. tName,					".playerbot bot add " .. tName,					"Left to show or hide Options | Right to logout " .. tName,					tClass .. " - " .. tName,					tName				})								if(tIndex > 10)				then tPlayer:Hide()				else tPlayer:Show()				end			end		end				if(tLimit > 10) then			frame.filter.classes = MultiBot.newSelect(frame, 0, (frame.size + 2) * 11, MultiBot.config.classes, true).addOptions("none")			frame.filter.types = MultiBot.newSelect(frame, 0, (frame.size + 2) * 12, MultiBot.config.types, true).addOptions("players")			frame.browse = MultiBot.newSingle(frame, 0, (frame.size + 2) * 13, MultiBot.config.browse)			frame.browse:Show()		else			frame.filter.classes = MultiBot.newSelect(frame, 0, (frame.size + 2) * (frame.limit + 1), MultiBot.config.classes, true).addOptions("none")			frame.filter.types = MultiBot.newSelect(frame, 0, (frame.size + 2) * (frame.limit + 2), MultiBot.config.types, true).addOptions("players")			frame.browse = MultiBot.newSingle(frame, 0, (frame.size + 2) * (frame.limit + 3), MultiBot.config.browse)			frame.browse:Hide()		end				return frame	end		frame.setMembers = function()		local tIndex = 0		local tPos = 0				-- Supportet limit of Members is 50, because GetNumGuildMembers() only gives the Number of online Members		frame.limit = 50		frame.from = 1		frame.to = 10				for i = 1, frame.limit do			local tName, tRank, tGuildIndex, tLevel, tClass = GetGuildRosterInfo(i)						-- Ensure that Index is not bigger than the Amount of Members in Guildlist			if(tName ~= nil and tLevel ~= nil and tClass ~= nil) then								-- Ensure that Memberbot is not your current Character				if(tName ~= UnitName("player")) then					tClass = MultiBot.toClass(tClass)					tIndex = tIndex + 1										local tMember = frame.addMember(tName, tClass, (tIndex - 1)%10 + 1)					tMember.setButton({						"TOGGLE:UNITS",						tName,						"Interface\\AddOns\\MultiBot\\Icons\\class_" .. string.lower(tClass) .. ".blp",						".playerbot bot remove " .. tName,						".playerbot bot add " .. tName,						"Left to show or hide Options | Right to logout " .. tName,						tClass .. " - " .. tLevel .. " - " .. tName,						tName					})										if(frame.isPlayer(tName) == false) then tMember:Hide() end				end			else				frame.limit = tIndex				break			end		end				return frame	end		frame.setFriends = function()		local tIndex = 0		local tPos = 0				-- Supportet limit of Friends is 50, because GetFriendInfo(i) crashes by i = 51		frame.limit = 50		frame.from = 1		frame.to = 10				for i = 1, 50 do			local tName, tLevel, tClass = GetFriendInfo(i)						-- Ensure that Index is not bigger than the Amount of Members in Friendlist			if(tName ~= nil and tLevel ~= nil and tClass ~= nil) then								-- Ensure that Friendbot is not your current Character				if(tName ~= UnitName("player")) then					tClass = MultiBot.toClass(tClass)					tIndex = tIndex + 1										local tFriend = frame.addFriend(tName, tClass, (tIndex - 1)%10 + 1)					tFriend.setButton({						"TOGGLE:UNITS",						tName,						"Interface\\AddOns\\MultiBot\\Icons\\class_" .. string.lower(tClass) .. ".blp",						".playerbot bot remove " .. tName,						".playerbot bot add " .. tName,						"Left to show or hide Options | Right to logout " .. tName,						tClass .. " - " .. tLevel .. " - " .. tName,						tName					})										if(frame.isPlayer(tName) == false) then tFriend:Hide() end				end			else				frame.limit = tIndex				break			end		end				return frame	end		frame.setButton = function(pConfig, pStrate)		if(frame.button ~= nil) then frame.button:Hide() end		frame.button = MultiBot.newDouble(frame, 0, 0, pConfig, pStrate)		return frame.button	end		frame.setState = function(pState)		frame.button.setState(pState)	end		-- GET --		frame.getBot = function(pName)		for key, value in pairs(frame.units) do if(key == pName) then return value end end		return nil	end		-- IS --		frame.isPlayer = function(pName)		for i = 1, table.getn(frame.index.players.names) do if(frame.index.players.names[i] == pName) then return true end end		return false	end		-- DO --		frame.doBrowse = function(pLimit)		if(pLimit ~= nil) then frame.limit = pLimit end				local tUnit = nil		local tTable = nil		local tIndex = 0				if(frame.filter.classes.action[7] ~= "none")		then tTable = frame.index[frame.filter.types.action[7]].classes[frame.filter.classes.action[7]]		else tTable = frame.index[frame.filter.types.action[7]].names		end				for key, value in pairs(frame.units) do value:Hide() end				if(tTable == nil) then			frame.filter.classes.setPoint(0, (frame.size + 2) * 1)			frame.filter.types.setPoint(0, (frame.size + 2) * 2)			frame.browse.setPoint(0, (frame.size + 2) * 3)			frame.browse:Hide()			return		end				if(frame.limit == 0) then			frame.limit = table.getn(tTable)			frame.from = 1			frame.to = 10						for i = 1, frame.limit do				tIndex = (i - 1)%10 + 1				tUnit = frame.units[tTable[i]]				tUnit.setPoint(0, (frame.size + 2) * tIndex)				if(frame.from <= i and frame.to >= i)				then tUnit:Show()				else tUnit:Hide()				end			end						if(frame.limit < frame.to) then				frame.filter.classes.setPoint(0, (frame.size + 2) * (frame.limit + 1))				frame.filter.types.setPoint(0, (frame.size + 2) * (frame.limit + 2))				frame.browse.setPoint(0, (frame.size + 2) * (frame.limit + 3))			else				frame.filter.classes.setPoint(0, (frame.size + 2) * (frame.to + 1))				frame.filter.types.setPoint(0, (frame.size + 2) * (frame.to + 2))				frame.browse.setPoint(0, (frame.size + 2) * (frame.to + 3))			end						if(frame.limit < 10) then				frame.browse:Hide()			else				frame.browse:Show()			end		else			local tFrom = frame.from + 10			local tTo = frame.to + 10						if(tFrom > frame.limit) then				tFrom = 1				tTo = 10			end						if(tTo > frame.limit) then				tTo = frame.limit			end						for i = 1, frame.limit do				tUnit = frame.units[tTable[i]]								if(frame.from <= i and frame.to >= i) then					tUnit:Hide()				end								if(tFrom <= i and tTo >= i) then					tIndex = tIndex + 1					tUnit:Show()				end			end						frame.from = tFrom			frame.to = tTo						frame.filter.classes.setPoint(0, (frame.size + 2) * (tIndex + 1))			frame.filter.types.setPoint(0, (frame.size + 2) * (tIndex + 2))			frame.browse.setPoint(0, (frame.size + 2) * (tIndex + 3))		end	end		frame.doCloseInventories = function(pName)		for key, value in pairs(frame.units) do			if(value.name ~= pName and value.button.state == true) then				value.right.buttons["inventory"].setState(false)				value.inventory.doClose()			end		end	end		frame.doSummon = function()		for key, value in pairs(frame.units) do			if(value.button.state == true) then				SendChatMessage("summon", "WHISPER", nil, key)			end		end	end		frame.doRefresh = function(pRoster)		frame.doHide()		frame.doBrowse(0)		frame.doShow()	end		frame.doDisable = function(pName, pClass)		if(frame.index.actives.classes[pClass] ~= nil) then			local tIndex = 0						for key, value in pairs(frame.index.actives.classes[pClass]) do				if(value == pName) then					tIndex = key					break				end			end						if(tIndex > 0) then				table.remove(frame.index.actives.classes[pClass], tIndex)				tIndex = 0			end						for key, value in pairs(frame.index.actives.names) do				if(value == pName) then					tIndex = key					break				end			end						if(tIndex > 0) then				table.remove(frame.index.actives.names, tIndex)				tIndex = 0			end		end	end		frame.doEnable = function(pName, pClass)		if(frame.index.actives.classes[pClass] == nil) then			frame.index.actives.classes[pClass] = {}		end				table.insert(frame.index.actives.classes[pClass], pName)		table.insert(frame.index.actives.names, pName)	end		frame.doHide = function()		for key, value in pairs(frame.units) do value:Hide() end		frame.filter.classes.options:Hide()		frame.filter.types.options:Hide()		frame.filter.classes:Hide()		frame.filter.types:Hide()		frame.browse:Hide()	end		frame.doShow = function()		local tTable = nil				if(frame.filter.classes.action[7] ~= "none")		then tTable = frame.index[frame.filter.types.action[7]].classes[frame.filter.classes.action[7]]		else tTable = frame.index[frame.filter.types.action[7]].names		end				frame.limit = table.getn(tTable)				for i = 1, frame.limit do			if(frame.from <= i and frame.to >= i)			then frame.units[tTable[i]]:Show()			else frame.units[tTable[i]]:Hide()			end		end				if(frame.limit > 10) then frame.browse:Show() end		frame.filter.classes:Show()		frame.filter.types:Show()	end		return frameendprint("AfterMultiBotUnits")