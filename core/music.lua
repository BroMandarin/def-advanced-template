local music = {}

local playing = nil
local dungeon_music = 1

local function stop_playing()
	if playing then
		sound.stop(playing)
		playing = nil
	end
end

local function change_dungeon_music()
	if dungeon_music == 1 then
		stop_playing()
		timer.delay(1.5, false, function()
			sound.play("main:/sound#music2", nil, change_dungeon_music)
			playing = "main:/sound#music2"
			dungeon_music = 2
		end)
	elseif dungeon_music == 2 then
		stop_playing()
		timer.delay(1.5, false, function()
			sound.play("main:/sound#music", nil, change_dungeon_music)
			playing = "main:/sound#music"
			dungeon_music = 1
		end)
	end
end

function music.stop_music()
	dungeon_music = 0
	stop_playing()
end

function music.play_menu()
	stop_playing()
	sound.play("main:/sound#tense")
	playing = "main:/sound#tense"
end

function music.play_intro()
	stop_playing()
	sound.play("main:/sound#tense")
	playing = "main:/sound#tense"
end

function music.play_dungeon()
	dungeon_music = 1
	stop_playing()
	sound.play("main:/sound#music", nil, change_dungeon_music)
	playing = "main:/sound#music"
end

function music.play_dungeon_bad()
	dungeon_music = 0
	stop_playing()
	sound.play("main:/sound#music_bad_ending")
	playing = "main:/sound#music_bad_ending"
end

function music.play_game_over()
	stop_playing()
end

function music.play_final_room()
	stop_playing()
	sound.play("main:/sound#tense")
	playing = "main:/sound#tense"
end

return music
