local my_mapper = {}

my_mapper.action_to_trigger = {}
my_mapper.trigger_to_action = {}
my_mapper.actions = {
	{
		event = "up",
		name = "Up"
	},
	{
		event = "down",
		name = "Down"
	},
	{
		event = "left",
		name = "Left"
	},
	{
		event = "right",
		name = "Right"
	},
	{
		event = "accept",
		name = "Accept"
	},
	{
		event = "cancel",
		name = "Cancel"
	}
}

local function unbind(trigger)
	my_mapper.trigger_to_action[trigger] = nil
end

function my_mapper.bind(action, trigger)
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

return my_mapper
