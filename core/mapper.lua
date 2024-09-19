local my_mapper = {}

my_mapper.action_to_trigger = {}
my_mapper.trigger_to_action = {}
my_mapper.actions = {
	{ event = "menu_up",     name = "Up" },
	{ event = "menu_down",   name = "Down" },
	{ event = "menu_left",   name = "Left" },
	{ event = "menu_right",  name = "Right" },

	{ event = "menu_accept", name = "Accept" },
	{ event = "menu_cancel", name = "Cancel" },

	{ event = "up",     name = "Up" },
	{ event = "down",   name = "Down" },
	{ event = "left",   name = "Left" },
	{ event = "right",  name = "Right" },
	
	{ event = "action", name = "Action" },
}

local function unbind(trigger)
	my_mapper.trigger_to_action[trigger] = nil
end

function my_mapper.bind(action, trigger)
	print("bind", action, trigger)
	if my_mapper.action_to_trigger[action] then
		unbind(my_mapper.action_to_trigger[action])
	end
	my_mapper.action_to_trigger[action] = trigger
	my_mapper.trigger_to_action[trigger] = action
end

function my_mapper.on_input(trigger)
	if not trigger then return nil end

	local binding = my_mapper.trigger_to_action[trigger]

	if not binding then return nil end

	return binding
end

function my_mapper.save_to_file()
	pprint(my_mapper.action_to_trigger)
	local file = sys.get_save_file("advanced_template", "input")
	local table = {}

	for k, v in ipairs(my_mapper.actions) do
		print(k, v.event)
		print(my_mapper.action_to_trigger[hash(v.event)])
		table[v.event] = my_mapper.action_to_trigger[hash(v.event)]
	end

	sys.save(file, table)
	pprint(table)
end

function my_mapper.load_from_file()
	local file = sys.get_save_file("advanced_template", "input")
	local table = {}

	if not sys.exists(file) then return end

	table = sys.load(file)

	pprint(table)

	for k, v in pairs(table) do
		print(k, v)
		my_mapper.bind(hash(k), v)
		-- my_mapper.action_to_trigger[hash(k)] = v
	end

	pprint(my_mapper.action_to_trigger)
end

return my_mapper
