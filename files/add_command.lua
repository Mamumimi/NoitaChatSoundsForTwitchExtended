local sound_map = {
	option1 = function(player) GameEntityPlaySound(player, "pet") end,
	option2 = function(_,x,y) GamePlaySound("data/audio/Desktop/animals.bank", "animals/spearbot/attack_melee", x, y) end,
	option3 = function(_,x,y) GamePlaySound("data/audio/Desktop/misc.bank", "game_effect/charm/create", x, y) end,
	option4 = function(_,x,y) GamePlaySound("data/audio/Desktop/misc.bank", "game_effect/polymorph/create", x, y) end,
	option5 = function(_,x,y) GamePlaySound("data/audio/Desktop/items.bank", "magic_wand/mana_fully_recharged", x, y) end,
	option6 = function(_,x,y) GamePlaySound("data/audio/Desktop/ui.bank", "ui/streaming_integration/run_event", x, y) end,
	option7 = function(_,x,y) GamePlaySound("data/audio/Desktop/ui.bank", "ui/new_unlock", x, y) end,
}
table.insert(commands, {
		reward_id = "chatsounds",
		reward_name = "Twitch Chat Sounds",
		reward_description = "Play a sound whenever a message is received in Twitch chat.",
		reward_image = nil,
		required_flag = "",
		custom_options =
		{
			{
			type = "enum",
			flag = "sound_selector",
			name = "Sound Selector",
			description = "Pick which sound you want to use.",
			default_enum = "option1",
			values = {
				{"option1", "Friendly Hämis"},
				{"option2", "Salamurhaajarobotti"},
				{"option3", "Charm"},
				{"option4", "Polymorph"},
				{"option5", "mana_fully_recharged"},
				{"option6", "run_event"},
				{"option7", "new_unlock"},
			}
			}
		},
		no_display_message = true,
		func = function(reward, userdata)
			local player = get_player()
			local x, y = EntityGetTransform(player)
			local selection = ModSettingGet("twitch_extended_commands_chatsounds_sound_selector")
			sound_map[selection](player,x,y)
		end,
	})