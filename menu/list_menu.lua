local list_menu = {}

list_menu.elements = {}
list_menu.selected_id = 1

function list_menu.get_elements(n)
	list_menu.elements = {}

	for e = 1, n do
		list_menu.elements[e] = gui.get_node("element_" .. e)
	end

	list_menu.elements.n = n
end

function list_menu.select(id)
	if id > list_menu.elements.n then
		id = 1
	elseif id < 1 then
		id = list_menu.elements.n
	end

	local prev_id = list_menu.selected_id

	list_menu.selected_id = id

	return prev_id, id
end

function list_menu.select_in_direction(dir)
	local id = list_menu.selected_id + dir
	
	return list_menu.select(id)
end

return list_menu
