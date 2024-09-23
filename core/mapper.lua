local mapper = {}

mapper.action_to_trigger = {}
mapper.trigger_to_action = { menu = {}, game = {} }
mapper.actions = {
	menu = {
		{ event = "menu_up",     name = "Up" },
		{ event = "menu_down",   name = "Down" },
		{ event = "menu_left",   name = "Left" },
		{ event = "menu_right",  name = "Right" },

		{ event = "menu_accept", name = "Accept" },
		{ event = "menu_cancel", name = "Cancel" },
	},
	game = {
		{ event = "up",     name = "Up" },
		{ event = "down",   name = "Down" },
		{ event = "left",   name = "Left" },
		{ event = "right",  name = "Right" },

		{ event = "action", name = "Action" },
	}
}

local function unbind(trigger)
	mapper.trigger_to_action[trigger] = nil
end

function mapper.bind(action, trigger, group)
	print("bind", action, trigger, group)
	if mapper.action_to_trigger[action] then
		unbind(mapper.action_to_trigger[action])
	end
	mapper.action_to_trigger[action] = trigger
	mapper.trigger_to_action[group][trigger] = action
end

function mapper.on_input(trigger, group)
	if not trigger then return nil end
	
	if not group then group = "menu" end

	local binding = mapper.trigger_to_action[group][trigger]

	if not binding then return nil end

	return binding
end

function mapper.save_to_file()
	pprint(mapper.action_to_trigger)
	local file = sys.get_save_file("advanced_template", "input")
	local table = {}

	for k, v in ipairs(mapper.actions) do
		print(k, v.event)
		print(mapper.action_to_trigger[hash(v.event)])
		table[v.event] = mapper.action_to_trigger[hash(v.event)]
	end

	sys.save(file, table)
	pprint(table)
end

function mapper.load_from_file()
	local file = sys.get_save_file("advanced_template", "input")
	local table = {}

	if not sys.exists(file) then return end

	table = sys.load(file)

	pprint(table)

	for k, v in pairs(table) do
		print(k, v)
		mapper.bind(hash(k), v)
		-- my_mapper.action_to_trigger[hash(k)] = v
	end

	pprint(mapper.action_to_trigger)
end

return mapper
