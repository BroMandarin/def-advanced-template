local list_menu = {}

list_menu.elements = {}
list_menu.selected_id = 1

function list_menu.get_elements(n)
	local elements = {}

	for e = 1, n do
		elements[e] = gui.get_node("element_" .. e)
	end

	elements.n = n
	elements.selected_id = 1
	
	return elements
end

function list_menu.select(elements, id)
	if id > elements.n then
		id = 1
	elseif id < 1 then
		id = elements.n
	end

	local prev_id = elements.selected_id

	elements.selected_id = id

	return prev_id, id
end

function list_menu.select_in_direction(elements, dir)
	local id = elements.selected_id + dir
	
	return list_menu.select(elements, id)
end

return list_menu
