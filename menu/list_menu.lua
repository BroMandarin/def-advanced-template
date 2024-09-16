local list_menu = {}

list_menu.elements = {}
lisst_menu.selected_id = 1

function list_menu.get_elements(n)
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
	
	selected_id = id
end

return list_menu
