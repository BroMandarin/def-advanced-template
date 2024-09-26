local data = {}

data.SCENE_NONE = 0
data.SCENE_MENU = 1
data.SCENE_GAME = 2

data.GAME_NORMAL = 1
data.GAME_LOADING = 2
data.GAME_PAUSED = 3

data.cur_scene = data.SCENE_NONE
data.game_state = data.GAME_NORMAL
data.configure_input = false

return data
