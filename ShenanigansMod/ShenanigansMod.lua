--- STEAMODDED HEADER
--- MOD_NAME: Shenanigans Mod
--- MOD_ID: ShenanigansMod
--- MOD_AUTHOR: [Shenanigans]
--- MOD_DESCRIPTION: Adds 12 decks with various abilities.

----------------------------------------------
------------MOD CODE -------------------------


function SMODS.INIT.ShenanigansMod()
	local shen_mod = SMODS.findModByID("ShenanigansMod")
	--local spr_??deck = SMODS.Sprite:new("spr??deck", shen_mod.path, "b_??deck.png", 71, 95, "asset_atli")
	local spr_duskdeck = SMODS.Sprite:new("sprduskdeck", shen_mod.path, "b_duskdeck.png", 71, 95, "asset_atli")
	local spr_hieroglyphdeck = SMODS.Sprite:new("sprhieroglyphdeck", shen_mod.path, "b_hieroglyphdeck.png", 71, 95,
		"asset_atli")
	local spr_freakydeck = SMODS.Sprite:new("sprfreakydeck", shen_mod.path, "b_freakydeck.png", 284, 380, "asset_atli")
	local spr_perkeodeck = SMODS.Sprite:new("sprperkeodeck", shen_mod.path, "b_perkeodeck.png", 71, 95, "asset_atli")
	local spr_chicotdeck = SMODS.Sprite:new("sprchicotdeck", shen_mod.path, "b_chicotdeck.png", 71, 95, "asset_atli")
	local spr_yorickdeck = SMODS.Sprite:new("spryorickdeck", shen_mod.path, "b_yorickdeck.png", 71, 95, "asset_atli")
	local spr_caniodeck = SMODS.Sprite:new("sprcaniodeck", shen_mod.path, "b_caniodeck.png", 71, 95, "asset_atli")
	local spr_showmandeck = SMODS.Sprite:new("sprshowmandeck", shen_mod.path, "b_showmandeck.png", 71, 95, "asset_atli")
	local spr_grosmicheldeck = SMODS.Sprite:new("sprgrosmicheldeck", shen_mod.path, "b_grosmicheldeck.png", 71, 95,
		"asset_atli")
	local spr_snakeskindeck = SMODS.Sprite:new("sprsnakeskindeck", shen_mod.path, "b_snakeskindeck.png", 71, 95,
		"asset_atli")
	local spr_tribouletdeck = SMODS.Sprite:new("sprtribouletdeck", shen_mod.path, "b_tribouletdeck.png", 71, 95,
		"asset_atli")
	local spr_turtlebeandeck = SMODS.Sprite:new("sprturtlebeandeck", shen_mod.path, "b_turtlebeandeck.png", 71, 95,
		"asset_atli")
	local spr_templedeck = SMODS.Sprite:new("sprtempledeck", shen_mod.path, "b_templedeck.png", 71, 95, "asset_atli")
	local spr_cartomancerdeck = SMODS.Sprite:new("sprcartomancerdeck", shen_mod.path, "b_cartomancerdeck.png", 71, 95,
		"asset_atli")
	local spr_diplopiadeck = SMODS.Sprite:new("sprdiplopiadeck", shen_mod.path, "b_diplopiadeck.png", 71, 95,
		"asset_atli")



	-- local ??deck_def = {
	-- 	["name"]="",
	-- 	["text"]={
	-- 		[1]=""
	-- 	}
	-- }

	local perkeodeck_def = {
		["name"] = "Perkeo's Deck",
		["text"] = {
			[1] = "After defeating each {C:attention}Boss Blind{},",
			[2] = "creates a {C:dark_edition}Negative{} copy of",
			[3] = "{C:attention}1{} random {C:attention}consumable{}",
			[4] = "card in your possession"
		}
	}

	local chicotdeck_def = {
		["name"] = "Chicot's Deck",
		["text"] = {
			"Sell any Joker to",
			"disable the current",
			"{C:attention}Boss Blind{}",
		}
	}

	local yorickdeck_def = {
		["name"] = "Yorick's Deck",
		["text"] = {
			"Discarded cards trigger",
			"their end of round effects"
		}
	}

	local caniodeck_def = {
		["name"] = "Canio's Deck",
		["text"] = {
			[1] = "Discarded cards have a",
			[2] = "{C:green}1 in 7{} chance",
			[3] = "to be destroyed"
		}
	}

	local duskdeck_def = {
		["name"] = "Dusk Deck",
		["text"] = {
			[1] = "Retrigger all played",
			[2] = "cards in {C:attention}final hand{}",
			[3] = "of round {C:attention}twice{}",
			[4] = "{C:blue}-1{} hand every round"
		},
	}

	local hieroglyphdeck_def = {
		["name"] = "Hieroglyph Deck",
		["text"] = {
			[1] = "{C:attention}-1{} Ante",
			[2] = "{C:attention}+2{} Antes to win"
		},
	}

	local freakydeck_def = {
		["name"] = "Freaky Deck",
		["text"] = {
			"Jokers are now {C:attention}freaky{}"
		}
	}

	local showmandeck_def = {
		["name"] = "Showman Deck",
		["text"] = {
			"{C:attention}Joker{}, {C:tarot}Tarot{}, {C:planet}Planet{},",
			"and {C:spectral}Spectral{} cards may",
			"appear multiple times, higher",
			"chance for duplicates."
		}
	}

	local grosmicheldeck_def = {
		["name"] = "Gros Michel Deck",
		["text"] = {
			"{C:attention}+2{} Joker slots",
			"Each other Joker has a",
			"{C:green}1 in 6{} chance to be",
			"destroyed at end of round",
			"Start with a {C:gold}Gros Michel{}" --TODO  T:j_gros_michel, figure out how to use the variables
		}
	}

	local snakeskindeck_def = {
		["name"] = "Snakeskin Deck",
		["text"] = {
			"After Play or Discard,",
			"always draw 3 cards"
		}
	}

	local tribouletdeck_def = {
		["name"] = "Triboulet's Deck",
		["text"] = {
			"Start run with 4 extra",
			"{C:attention}Kings{} and {C:attention}Queens{}",
			"of random suits"
		}
	}

	local turtlebeandeck_def = {
		["name"] = "Turtle Bean Deck",
		["text"] = {
			"{C:attention}+5{} hand size,",
			"reduces by {C:red}1{}",
			"after each {C:attention}Boss Blind{}"
		}
	}

	local templedeck_def = {
		["name"] = "Temple Deck",
		["text"] = {
			"Hover over your deck to",
			"see the {C:attention}Temple Request{}",
			"Complete it to build the",
			"temple and gain rewards"
		}
	}

	local cartomancerdeck_def = {
		["name"] = "Cartomancer Deck",
		["text"] = {
			"All {C:tarot}Tarot{}, {C:planet}Planet{}, and {C:spectral}Spectral{}",
			"cards are {C:dark_edition}Negative{} and may",
			"appear multiple times",
		}
	}

	local diplopiadeck_def = {
		["name"] = "Diplopia Deck",
		["text"] = {
			"Using a card creates",
			"a {C:attention}Temporary{} copy"
		}
	}

	register_sound("freaky_scream", shen_mod.path, "scream.wav")

	-- local ??deck = SMODS.Deck:new("?? Deck", "??deck", {atlas = "spr??deck", ??deck = true,
	-- discards = 0, hands = 0, hand_size = 0, extra_hand_bonus = 1},
	-- {x = 0, y = 0}, ??deck_def)
	local perkeodeck = SMODS.Deck:new("Perkeo's Deck", "perkeodeck", {
			atlas = "sprperkeodeck",
			perkeodeck = true,
			discards = 0,
			hands = 0,
			hand_size = 0,
			extra_hand_bonus = 1
		},
		{ x = 0, y = 0 }, perkeodeck_def)
	local chicotdeck = SMODS.Deck:new("Chicot's Deck", "chicotdeck", {
			atlas = "sprchicotdeck",
			chicotdeck = true,
			discards = 0,
			hands = 0,
			hand_size = 0,
			extra_hand_bonus = 1
		},
		{ x = 0, y = 0 }, chicotdeck_def)
	local yorickdeck = SMODS.Deck:new("Yorick's Deck", "yorickdeck", {
			atlas = "spryorickdeck",
			yorickdeck = true,
			discards = 0,
			hands = 0,
			hand_size = 0,
			extra_hand_bonus = 1
		},
		{ x = 0, y = 0 }, yorickdeck_def)
	local caniodeck = SMODS.Deck:new("Canio's Deck", "caniodeck", {
			atlas = "sprcaniodeck",
			caniodeck = true,
			discards = 0,
			hands = 0,
			hand_size = 0,
			extra_hand_bonus = 1
		},
		{ x = 0, y = 0 }, caniodeck_def)
	local duskdeck = SMODS.Deck:new("Dusk Deck", "duskdeck", {
			atlas = "sprduskdeck",
			duskdeck = true,
			discards = 0,
			hands = -1,
			hand_size = 0,
			extra_hand_bonus = 1
		},
		{ x = 0, y = 0 }, duskdeck_def)
	local hieroglyphdeck = SMODS.Deck:new("Hieroglyph Deck", "hieroglyphdeck",
		{
			atlas = "sprhieroglyphdeck",
			hieroglyphdeck = true,
			discards = 0,
			hands = 0,
			hand_size = 0,
			extra_hand_bonus = 1
		},
		{ x = 0, y = 0 }, hieroglyphdeck_def)
	local freakydeck = SMODS.Deck:new("Freaky Deck", "freakydeck", {
			atlas = "sprfreakydeck",
			freakydeck = true,
			discards = 0,
			hands = 0,
			hand_size = 0,
			extra_hand_bonus = 1
		},
		{ x = 0, y = 0 }, freakydeck_def)
	local showmandeck = SMODS.Deck:new("Showman Deck", "showmandeck", {
			atlas = "sprshowmandeck",
			showmandeck = true,
			discards = 0,
			hands = 0,
			hand_size = 0,
			extra_hand_bonus = 1
		},
		{ x = 0, y = 0 }, showmandeck_def)
	local grosmicheldeck = SMODS.Deck:new("Gros Michel Deck", "grosmicheldeck",
		{
			atlas = "sprgrosmicheldeck",
			grosmicheldeck = true,
			discards = 0,
			hands = 0,
			hand_size = 0,
			extra_hand_bonus = 1,
			joker_slot = 2
		},
		{ x = 0, y = 0 }, grosmicheldeck_def)
	local snakeskindeck = SMODS.Deck:new("Snakeskin Deck", "snakeskindeck",
		{
			atlas = "sprsnakeskindeck",
			snakeskindeck = true,
			discards = 0,
			hands = 0,
			hand_size = 0,
			extra_hand_bonus = 1,
			joker_slot = 0
		},
		{ x = 0, y = 0 }, snakeskindeck_def)
	local tribouletdeck = SMODS.Deck:new("Triboulet's Deck", "tribouletdeck",
		{
			atlas = "sprtribouletdeck",
			tribouletdeck = true,
			discards = 0,
			hands = 0,
			hand_size = 0,
			extra_hand_bonus = 1,
			joker_slot = 0
		},
		{ x = 0, y = 0 }, tribouletdeck_def)
	local turtlebeandeck = SMODS.Deck:new("Turtle Bean Deck", "turtlebeandeck",
		{
			atlas = "sprturtlebeandeck",
			turtlebeandeck = true,
			discards = 0,
			hands = 0,
			hand_size = 5,
			extra_hand_bonus = 1,
			joker_slot = 0
		},
		{ x = 0, y = 0 }, turtlebeandeck_def)
	local templedeck = SMODS.Deck:new("Temple Deck", "templedeck", {
			atlas = "sprtempledeck",
			templedeck = true,
			discards = 0,
			hands = 0,
			hand_size = 0,
			extra_hand_bonus = 1,
			joker_slot = 0,
			dollars = 100000
		},
		{ x = 0, y = 0 }, templedeck_def)
	local diplopiadeck = SMODS.Deck:new("Diplopia Deck", "diplopiadeck", {
			atlas = "sprdiplopiadeck",
			diplopiadeck = true,
			discards = 0,
			hands = 0,
			hand_size = 0,
			extra_hand_bonus = 1,
			joker_slot = 0
		},
		{ x = 0, y = 0 }, diplopiadeck_def)
	local cartomancerdeck = SMODS.Deck:new("Cartomancer Deck", "cartomancerdeck",
		{
			atlas = "sprcartomancerdeck",
			cartomancerdeck = true,
			discards = 0,
			hands = 0,
			hand_size = 0,
			extra_hand_bonus = 1,
			joker_slot = 0
		},
		{ x = 0, y = 0 }, cartomancerdeck_def)

	G.localization.descriptions.Other.freaky_six = {
		name = "Freaky 6",
		text = {
			"anybody gonna",
			"match my freak?"
		}
	}

	G.localization.descriptions.Other.freaky_nine = {
		name = "Freaky 9",
		text = {
			"i'm a freak fr",
			"just lmk"
		}
	}

	-- difficulties:
	-- 0: can be done anytime, multiple times per round
	-- 1: can take a round
	-- 2: can take an ante but doesn't distract from regular play
	-- 3: can take more than an ante, derails

	G.temple_requests = {
		{
			key = "card_add",
			text = { "Add a card to your deck" },
			difficulty = 1
		},
		{
			key = "card_add_multiple",
			text = { "Add #total# cards to your deck",
				"(#remaining# remaining)" },
			details = {
				total = { 2, 4 },
				remaining = 0
			},
			difficulty = 2
		},
		{
			key = "card_remove",
			text = { "Remove a card from your deck" },
			difficulty = 1
		},
		{
			key = "card_remove_multiple",
			text = { "Remove #total# cards from your deck",
				"(#remaining# remaining)" },
			details = {
				total = { 2, 4 },
				remaining = 0
			},
			difficulty = 2
		},
		{
			key = "play_easy",
			text = { "Play a #hand#",
			},
			details = {
				hand = { "High Card", "Pair", "Two Pair" },
			},
			difficulty = 0
		},
		{
			key = "play_medium",
			text = { "Play a #hand#",
			},
			details = {
				hand = { "Three of a Kind", "Straight", "Flush", "Full House", "Four of a Kind" },
			},
			difficulty = 1
		},
		{
			key = "play_hard",
			text = { "Play a #hand#",
			},
			details = {
				hand = { "Straight Flush", "Five of a Kind", "Flush House", "Flush Five" },
			},
			difficulty = 2
		},
		{
			key = "discard_easy",
			text = { "Discard a #hand#",
			},
			details = {
				hand = { "High Card", "Pair", "Two Pair" },
			},
			difficulty = 0
		},
		{
			key = "discard_medium",
			text = { "Discard a #hand#",
			},
			details = {
				hand = { "Three of a Kind", "Straight", "Flush", "Full House", "Four of a Kind" },
			},
			difficulty = 1
		},
		{
			key = "discard_hard",
			text = { "Discard a #hand#",
			},
			details = {
				hand = { "Straight Flush", "Five of a Kind", "Flush House", "Flush Five" },
			},
			difficulty = 2
		},
		{
			key = "spend_easy",
			text = { "Spend #total#$",
				"(#remaining#$ remaining)"
			},
			details = {
				total = { 5, 10 },
				remaining = 0
			},
			difficulty = 0
		},
		{
			key = "spend_hard",
			text = { "Spend #total#$",
				"(#remaining#$ remaining)"
			},
			details = {
				total = { 75, 125 },
				remaining = 0
			},
			difficulty = 3
		},
		{
			key = "play_easy_multiple",
			text = { "Play a #hand#",
				"#total# times",
				"(#remaining# remaining)"
			},
			details = {
				hand = { "High Card", "Pair", "Two Pair" },
				total = { 3, 6 },
				remaining = 0
			},
			difficulty = 1
		},
		{
			key = "play_medium_multiple",
			text = { "Play a #hand#",
				"#total# times",
				"(#remaining# remaining)"
			},
			details = {
				hand = { "Three of a Kind", "Straight", "Flush", "Full House", "Four of a Kind" },
				total = { 3, 6 },
				remaining = 0
			},
			difficulty = 2
		},
		{
			key = "play_obelisk",
			text = { "Play a hand that is",
				"not your most played hand",
				"#total# times consecutively",
				"(#remaining# remaining)"
			},
			details = {
				total = { 3, 6 },
				remaining = 0
			},
			difficulty = 2
		},
		{
			key = "play_hard_multiple",
			text = { "Play a #hand#",
				"#total# times",
				"(#remaining# remaining)"
			},
			details = {
				hand = { "Straight Flush", "Five of a Kind", "Flush House", "Flush Five" },
				total = { 3, 6 },
				remaining = 0
			},
			difficulty = 3
		},
		{
			key = "reach_exact_sum",
			text = { "Reach exactly #sum#$",
			},
			details = {
				sum = { 75, 150 },
			},
			difficulty = 3
		},
		{
			key = "skip_blind",
			text = { "Skip a Blind" },
			difficulty = 1
		},
		{
			key = "overscore_easy",
			text = { "Score more than",
			"the blind amount",
				"in one hand" },
			difficulty = 0
		},
		{
			key = "overscore_medium",
			text = { "Score twice",
			"the blind amount",
				"in one hand" },
			difficulty = 1
		},
		{
			key = "overscore_hard",
			text = { "Score 10 times",
			"the blind amount",
				"in one hand" },
			difficulty = 2
		},
		{
			key = "overscore_insane",
			text = { "Score 100 times",
			"the blind amount",
				"in one hand" },
			difficulty = 3
		},
		{
			key = "play_tarot",
			text = { "Play a Tarot card" },
			difficulty = 0
		},
		{
			key = "play_tarots",
			text = { "Play #total# Tarot cards",
				"(#remaining# remaining)" },
			details = {
				total = { 3, 6 },
				remaining = 0
			},
			difficulty = 1
		},
		{
			key = "play_planet",
			text = { "Play a Planet card" },
			difficulty = 0
		},
		{
			key = "play_planets",
			text = { "Play #total# Planet cards",
				"(#remaining# remaining)" },
			details = {
				total = { 3, 6 },
				remaining = 0
			},
			difficulty = 1
		},
		{
			key = "play_spectral",
			text = { "Play a Spectral card" },
			difficulty = 1
		},
		{
			key = "play_spectrals",
			text = { "Play #total# Spectral cards",
				"(#remaining# remaining)" },
			details = {
				total = { 3, 6 },
				remaining = 0
			},
			difficulty = 2
		},
	}

	G.temple_rewards = {
		{
			key = "4_$",
			text = "4$",
			difficulty = 0,
			repeatable = true
		},
		{
			key = "tarot",
			text = "Tarot Card",
			difficulty = 0,
			repeatable = true
		},
		{
			key = "planet",
			text = "Planet Card",
			difficulty = 0,
			repeatable = true
		},
		{
			key = "spectral",
			text = "Spectral Card",
			difficulty = 0,
			repeatable = true
		},
		{
			key = "joker",
			text = "Random Joker",
			difficulty = 0,
			repeatable = true
		},
		{
			key = "tarots",
			text = "2 Negative Tarot Cards",
			difficulty = 1,
			repeatable = true
		},
		{
			key = "planets",
			text = "2 Negative Planet Cards",
			difficulty = 1,
			repeatable = true
		},
		{
			key = "spectrals",
			text = "2 Negative Spectral Cards",
			difficulty = 1,
			repeatable = true
		},
		{
			key = "negative_joker",
			text = "Random Negative Joker",
			difficulty = 1,
			repeatable = true
		},
		{
			key = "joker_edition",
			text = "Random edition on random Joker",
			difficulty = 1,
			repeatable = true
		},
		{
			key = "random_tag",
			text = "Random Skip Tag",
			difficulty = 1,
			repeatable = true
		},
		{
			key = "black_hole",
			text = "Black Hole",
			difficulty = 2,
			repeatable = true
		},
		{
			key = "hand",
			text = "+1 hands per round",
			difficulty = 2,
			repeatable = true
		},
		{
			key = "shop_slot",
			text = "+1 shop slot",
			difficulty = 2,
			repeatable = true
		},
		{
			key = "discard",
			text = "+1 discards per round",
			difficulty = 2,
			repeatable = true
		},
		{
			key = "minus_ante",
			text = "-1 Ante",
			difficulty = 2,
			repeatable = true
		},
		{
			key = "hand_size",
			text = "+1 hand size",
			difficulty = 2,
			repeatable = true
		},
		{
			key = "consumable_slot",
			text = "+1 consumable slots",
			difficulty = 2,
			repeatable = true
		},
		{
			key = "balance_effect",
			text = "Chips and Mult are now balanced",
			difficulty = 3,
			repeatable = false
		},
		{
			key = "free_rolls_effect",
			text = "50% chance for free rerolls",
			difficulty = 3,
			repeatable = false
		},
		{
			key = "joker_slot",
			text = "+1 Joker Slot",
			difficulty = 3,
			repeatable = true
		},
	}

	spr_duskdeck:register()
	spr_hieroglyphdeck:register()
	spr_perkeodeck:register()
	spr_chicotdeck:register()
	spr_yorickdeck:register()
	spr_caniodeck:register()
	spr_showmandeck:register()
	spr_grosmicheldeck:register()
	spr_snakeskindeck:register()
	spr_tribouletdeck:register()
	spr_turtlebeandeck:register()
	spr_freakydeck:register()
	spr_templedeck:register()
	spr_cartomancerdeck:register()
	spr_diplopiadeck:register()

	duskdeck:register()
	hieroglyphdeck:register()
	showmandeck:register()
	grosmicheldeck:register()
	turtlebeandeck:register()
	snakeskindeck:register()
	caniodeck:register()
	tribouletdeck:register()
	yorickdeck:register()
	chicotdeck:register()
	perkeodeck:register()
	freakydeck:register()
	templedeck:register()   --wip - UI for requests
	cartomancerdeck:register() --wip - showman effect on cards only, all cards negative
	diplopiadeck:register() --wip - temporary cards
end

function locals()
	local variables = {}
	local idx = 1
	while true do
		local ln, lv = debug.getlocal(2, idx)
		if ln ~= nil then
			variables[ln] = lv
		else
			break
		end
		idx = 1 + idx
	end
	return variables
end

local shen_Backapply_to_runRef = Back.apply_to_run
function Back.apply_to_run(self)
	shen_Backapply_to_runRef(self)
	if self.effect.config.duskdeck then
		G.GAME.starting_params.duskdeck = self.effect.config.duskdeck
	elseif self.effect.config.hieroglyphdeck then
		G.GAME.win_ante = 10
		ease_ante(-1)
		G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
		G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - 1
	elseif self.effect.config.turtlebeandeck then
		G.GAME.starting_params.bean_counter = 0
	elseif self.effect.config.tribouletdeck then
		G.E_MANAGER:add_event(Event({
			func = function()
				for i = 1, 4 do
					local _suit = pseudorandom_element({ 'S', 'H', 'D', 'C' }, pseudoseed('triboulet_deck_create'))
					local card = copy_card(G.playing_cards[1], nil, 1, G.playing_card)
					card:set_base(G.P_CARDS[_suit .. "_" .. "Q"])
					G.deck:emplace(card)
					G.playing_cards[#G.playing_cards + 1] = card
				end
				for i = 1, 4 do
					local _suit = pseudorandom_element({ 'S', 'H', 'D', 'C' }, pseudoseed('triboulet_deck_create'))
					local card = copy_card(G.playing_cards[1], nil, 1, G.playing_card)
					card:set_base(G.P_CARDS[_suit .. "_" .. "K"])
					G.deck:emplace(card)
					G.playing_cards[#G.playing_cards + 1] = card
				end
				G.starting_deck_size = 58
				return true
			end
		}))
	elseif self.effect.config.chicotdeck then
		G.GAME.starting_params.chicotdeck = self.effect.config.chicotdeck
	elseif self.effect.config.caniodeck then
		G.GAME.starting_params.caniodeck = self.effect.config.caniodeck
	elseif self.effect.config.grosmicheldeck then
		G.GAME.starting_params.grosmicheldeck = self.effect.config.grosmicheldeck
		G.E_MANAGER:add_event(Event({
			func = function()
				local card1 = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_gros_michel')
				card1:set_edition({})
				card1:add_to_deck()
				G.jokers:emplace(card1)
				card1:start_materialize()
				G.GAME.joker_buffer = 0
				return true
			end
		}))
	elseif self.effect.config.yorickdeck then
		G.GAME.starting_params.yorickdeck = self.effect.config.yorickdeck
	elseif self.effect.config.showmandeck then
		G.GAME.starting_params.showmandeck = self.effect.config.showmandeck
	elseif self.effect.config.snakeskindeck then
		G.GAME.starting_params.snakeskindeck = self.effect.config.snakeskindeck
	elseif self.effect.config.freakydeck then
		G.GAME.starting_params.freakydeck = self.effect.config.freakydeck
	elseif self.effect.config.templedeck then
		G.GAME.starting_params.templedeck = self.effect.config.templedeck
		generate_temple_request()
	end
end

local shen_Card_calculate_sealRef = Card.calculate_seal
function Card.calculate_seal(self, context)
	local r_val = shen_Card_calculate_sealRef(self, context)
	if G.GAME.starting_params.duskdeck and G.GAME.current_round.hands_left == 0 and context.repetition then
		if r_val ~= nil then
			if r_val.repetitions ~= nil then
				r_val.repetitions = r_val.repetitions + 2
			else
				r_val.repetitions = 2
			end
		else
			return {
				message = localize('k_again_ex'),
				repetitions = 2,
				card = self
			}
		end
	end
	return r_val
end

local shen_Backtriggereffect = Back.trigger_effect
function Back.trigger_effect(self, args)
	local nu_chip, nu_mult = shen_Backtriggereffect(self, args)
	if args.context == 'eval' then
		if self.effect.config.turtlebeandeck and G.GAME.last_blind and G.GAME.last_blind.boss and G.GAME.starting_params.bean_counter < 5 then
			G.hand:change_size(-1)
			G.GAME.starting_params.bean_counter = G.GAME.starting_params.bean_counter + 1
		elseif self.effect.config.perkeodeck and G.GAME.last_blind and G.GAME.last_blind.boss then
			if G.consumeables.cards[1] then
				G.E_MANAGER:add_event(Event({
					func = function()
						local card = copy_card(pseudorandom_element(G.consumeables.cards, pseudoseed('perkeo_deck')), nil)
						card:set_edition({ negative = true }, true)
						card:add_to_deck()
						G.consumeables:emplace(card)
						return true
					end
				}))
			end
		end
	elseif args.context == 'final_scoring_step' then
		if self.effect.config.freakydeck then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].ability.freaky_six then
					if i < #G.jokers.cards then
						if G.jokers.cards[i + 1].ability.freaky_nine then
							card_eval_status_text(G.jokers.cards[i], 'jokers', nil, nil, nil, {
								message = "Freaky!"
							})
							card_eval_status_text(G.jokers.cards[i + 1], 'x_mult', 1.5, nil, nil, {
								message = "Freaky!"
							})
							args.mult = args.mult * 1.5
							update_hand_text({ delay = 0 }, { mult = args.mult, chips = args.chips })
							nu_mult = args.mult
						end
					end
				end
			end
		end
	elseif args.context == 'blind_amount' then
		if self.effect.config.freakydeck then
			return
		end
	end
	return nu_chip, nu_mult
end

local shen_common_events_createcard = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
	local r_val = shen_common_events_createcard(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key,
		key_append)
	if G.GAME.starting_params.freakydeck then
		if _type == "Joker" then
			if pseudorandom('freaky') < 1 / 2 then
				r_val.ability.freaky_six = true
			else
				r_val.ability.freaky_nine = true
			end
		end
	end
	return r_val
end

local shen_get_current_pool = get_current_pool
function get_current_pool(_type, _rarity, _legendary, _append)
	if G.GAME.starting_params.showmandeck then
		local rarity
		if _type == 'Joker' then
			rarity = _rarity or pseudorandom('rarity' .. G.GAME.round_resets.ante .. (_append or ''))
		end
		local p, p_key = shen_get_current_pool(_type, rarity, _legendary, _append)
		if _type == 'Joker' then
			rarity = (_legendary and 4) or (rarity > 0.95 and 3) or (rarity > 0.7 and 2) or 1
		end
		add = {}
		for k, _ in pairs(G.GAME.used_jokers) do
			if k ~= "c_black_hole" and k ~= 'c_soul' then
				if _type == 'Joker' then
					for _, j in pairs(G.P_JOKER_RARITY_POOLS[rarity]) do
						if k == j.key then
							add[#add + 1] = k
							break
						end
					end
				elseif type == 'Tarot' then
					for _, j in pairs(G.P_CENTER_POOLS.Tarot) do
						if k == j.key then
							add[#add + 1] = k
							break
						end
					end
				elseif type == 'Planet' then
					for _, j in pairs(G.P_CENTER_POOLS.Planet) do
						if k == j.key then
							add[#add + 1] = k
							break
						end
					end
				elseif type == 'Spectral' then
					for _, j in pairs(G.P_CENTER_POOLS.Spectral) do
						if k == j.key then
							add[#add + 1] = k
							break
						end
					end
				end
			end
		end

		for i = 1, #add do
			for _ = 1, 10 do
				p[#p + 1] = add[i]
			end
		end

		return p, p_key
	else
		return shen_get_current_pool(_type, _rarity, _legendary, _append)
	end
end

local shen_Card_calculate_jokerRef = Card.calculate_joker
function Card.calculate_joker(self, context)
	local r_val = shen_Card_calculate_jokerRef(self, context)
	if self.ability.set == "Joker" then
		if context.selling_self then
			if G.GAME.starting_params.chicotdeck and G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind:get_type() == 'Boss')) then
				card_eval_status_text(self, 'extra', nil, nil, nil, { message = localize('ph_boss_disabled') })
				G.GAME.blind:disable()
			end
		end
	end
	return r_val
end

local shen_discard_cards_from_highlighted = G.FUNCS.discard_cards_from_highlighted
function G.FUNCS.discard_cards_from_highlighted(e, hook)
	if G.GAME.starting_params.yorickdeck then
		-- copied end of round effect from state_events end_round() but iterating highlighted hand instead of all cards
		for i = 1, #G.hand.highlighted do
			--Check for hand doubling
			local reps = { 1 }
			local j = 1
			while j <= #reps do
				local percent = (i - 0.999) / (#G.hand.highlighted - 0.998) + (j - 1) * 0.1
				if reps[j] ~= 1 then
					card_eval_status_text((reps[j].jokers or reps[j].seals).card, 'jokers', nil, nil,
						nil, (reps[j].jokers or reps[j].seals))
				end

				--calculate the hand effects
				local effects = { G.hand.highlighted[i]:get_end_of_round_effect() }
				for k = 1, #G.jokers.cards do
					--calculate the joker individual card effects
					local eval = G.jokers.cards[k]:calculate_joker({
						cardarea = G.hand,
						other_card = G.hand.highlighted
							[i],
						individual = true,
						end_of_round = true
					})
					if eval then
						table.insert(effects, eval)
					end
				end

				if reps[j] == 1 then
					--Check for hand doubling
					--From Red seal
					local eval = eval_card(G.hand.highlighted[i],
						{ end_of_round = true, cardarea = G.hand, repetition = true, repetition_only = true })
					if next(eval) and (next(effects[1]) or #effects > 1) then
						for h = 1, eval.seals.repetitions do
							reps[#reps + 1] = eval
						end
					end

					--from Jokers
					for j = 1, #G.jokers.cards do
						--calculate the joker effects
						local eval = eval_card(G.jokers.cards[j],
							{
								cardarea = G.hand,
								other_card = G.hand.highlighted[i],
								repetition = true,
								end_of_round = true,
								card_effects =
									effects
							})
						if next(eval) then
							for h = 1, eval.jokers.repetitions do
								reps[#reps + 1] = eval
							end
						end
					end
				end

				for ii = 1, #effects do
					--if this effect came from a joker
					if effects[ii].card then
						G.E_MANAGER:add_event(Event({
							trigger = 'immediate',
							func = (function()
								effects[ii].card:juice_up(0.7); return true
							end)
						}))
					end

					--If dollars
					if effects[ii].h_dollars then
						ease_dollars(effects[ii].h_dollars)
						card_eval_status_text(G.hand.highlighted[i], 'dollars', effects[ii].h_dollars, percent)
					end

					--Any extras
					if effects[ii].extra then
						card_eval_status_text(G.hand.highlighted[i], 'extra', nil, percent, nil, effects[ii].extra)
					end
				end
				j = j + 1
			end
		end
	end
	shen_discard_cards_from_highlighted(e, hook)
end

local shen_Drawcard = draw_card
function draw_card(from, to, percent, dir, sort, card, delay, mute, stay_flipped, vol, discarded_only)
	if G.GAME.starting_params.caniodeck and card and from == G.hand and to == G.discard then
		if pseudorandom("caniodeck") < (G.GAME.probabilities.normal / 7) then
			G.E_MANAGER:add_event(Event({
				trigger = 'before',
				delay = 0.33,
				func = function()
					card:start_dissolve()
					for i = 1, #G.jokers.cards do
						G.jokers.cards[i]:calculate_joker({ remove_playing_cards = true, removed = { card } })
					end
					return true
				end
			}))
		end
	end
	shen_Drawcard(from, to, percent, dir, sort, card, delay, mute, stay_flipped, vol, discarded_only)
end

local shen_draw_from_deck_to_hand = G.FUNCS.draw_from_deck_to_hand
function G.FUNCS.draw_from_deck_to_hand(e)
	if G.GAME.starting_params.snakeskindeck and (G.GAME.current_round.hands_played > 0 or G.GAME.current_round.discards_used > 0) and not G.booster_pack then
		shen_draw_from_deck_to_hand(3)
	else
		shen_draw_from_deck_to_hand(e)
	end
end

local shen_end_round = end_round
function end_round()
	if G.GAME.starting_params.grosmicheldeck then
		eligibles = {}
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i].config.center.key ~= "j_gros_michel" and not G.jokers.cards[i].ability.eternal then
				eligibles[#eligibles + 1] = G.jokers.cards[i]
			end
		end
		for i = 1, #eligibles do
			local r_val = nil
			if pseudorandom('grosmicheldeck') < G.GAME.probabilities.normal / 6 then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('tarot1')
						eligibles[i].T.r = -0.2
						eligibles[i]:juice_up(0.3, 0.4)
						eligibles[i].states.drag.is = true
						eligibles[i].children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(eligibles[i])
								eligibles[i]:remove()
								eligibles[i] = nil
								return true;
							end
						}))
						return true
					end
				}))
				r_val = {
					message = localize('k_extinct_ex')
				}
			else
				r_val = {
					message = localize('k_safe_ex')
				}
			end
			card_eval_status_text(eligibles[i], 'jokers', nil, nil, nil, r_val)
		end
	end
	shen_end_round()
end

local shen_generate_card_ui = generate_card_ui
function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
	local r_val = shen_generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start,
		main_end)
	if r_val.card_type ~= nil and r_val.card_type == "Joker" then
		if G.GAME.starting_params.freaky_six_UI == true then
			G.GAME.starting_params.freaky_six_UI = false
			shen_generate_card_ui({ key = 'freaky_six', set = 'Other' }, r_val)
		elseif G.GAME.starting_params.freaky_nine_UI == true then
			G.GAME.starting_params.freaky_nine_UI = false
			shen_generate_card_ui({ key = 'freaky_nine', set = 'Other' }, r_val)
		end
	end
	return r_val
end

local shen_generate_UIBox_ability_table = Card.generate_UIBox_ability_table
function Card.generate_UIBox_ability_table(self)
	if self.ability.freaky_six then
		G.GAME.starting_params.freaky_six_UI = true
		G.GAME.starting_params.freaky_nine_UI = false
	elseif self.ability.freaky_nine then
		G.GAME.starting_params.freaky_six_UI = false
		G.GAME.starting_params.freaky_nine_UI = true
	else
		G.GAME.starting_params.freaky_six_UI = false
		G.GAME.starting_params.freaky_nine_UI = false
	end
	return shen_generate_UIBox_ability_table(self)
end

local shen_remove_card = CardArea.remove_card
function CardArea.remove_card(self, card, discarded_only)
	if G.GAME.starting_params.freakydeck and self.config.type == "joker" and card.config.center.set == "Joker" then
		modded_play_sound("freaky_scream", false, 1, pseudorandom('freaky_scream') / 10 + .9)
	end
	return shen_remove_card(self, card, discarded_only)
end

function temple_text()
	if G.GAME.starting_params.temple_current_request ~= nil then
		r_val = {}
		for i = 1, #G.GAME.starting_params.temple_current_request.text do
			r_val[#r_val + 1] = {
				config = {
					align = 'cl'
				},
				n = G.UIT.R,
				nodes = { {
					config = {
						colour = G.C.BLACK,
						scale = 0.32,
						text = G.GAME.starting_params.temple_current_request.text[i]
					},
					n = G.UIT.T
				} }
			}
		end
		return r_val
	end
	return nil
end

function temple_speech_bubble()
	local t = {
		n = G.UIT.ROOT,
		config = { align = "cm", minh = 1, r = 0.3, padding = 0.07, minw = 1, colour = G.C.JOKER_GREY, shadow = true },
		nodes = {
			{
				n = G.UIT.C,
				config = { align = "cm", minh = 1, r = 0.2, padding = 0.1, minw = 1, colour = G.C.WHITE },
				nodes = {
					{
						n = G.UIT.C,
						config = { align = "cm", minh = 1, r = 0.2, padding = 0.03, minw = 1, colour = G.C.WHITE },
						nodes = temple_text()
					} }
			}
		}
	}
	return t
end

local shen_CardArea_draw = CardArea.draw
function CardArea.draw(self)
	local r_val = shen_CardArea_draw(self)
	if G.GAME.starting_params.templedeck then
		if self == G.deck then
			if not self.children.temple_request or G.GAME.starting_params.new_temple_request then
				self.children.temple_request = UIBox {
					definition = temple_speech_bubble(),
					config = { align = 'cm', offset = { x = 0, y = -2.4 }, major = self, parent = self }
				}
				self.children.temple_request.states.collide.can = false
				G.GAME.starting_params.new_temple_request = false
			end
			if G.deck_preview or self.states.collide.is or (G.buttons and G.buttons.states.collide.is and G.CONTROLLER.HID.controller) then
				self.children.temple_request:draw()
			end
		end
	end
	return r_val
end

local shen_create_UIBox_blind_select = create_UIBox_blind_select
function create_UIBox_blind_select()
	local r_val = shen_create_UIBox_blind_select()
	if G.GAME.starting_params.templedeck then
		G.blind_prompt_box = UIBox {
			definition =
			{ n = G.UIT.ROOT, config = { align = 'cm', colour = G.C.CLEAR, padding = 0.2 }, nodes = {
				{ n = G.UIT.R, config = { align = "cm" }, nodes = {
					{ n = G.UIT.O, config = { object = DynaText({ string = localize('ph_choose_blind_1'), colours = { G.C.WHITE }, shadow = true, bump = true, scale = 0.6, pop_in = 0.5, maxw = 5 }), id = 'prompt_dynatext1' } }
				} },
				{ n = G.UIT.R, config = { align = "cm" }, nodes = {
					{ n = G.UIT.O, config = { object = DynaText({ string = localize('ph_choose_blind_2'), colours = { G.C.WHITE }, shadow = true, bump = true, scale = 0.7, pop_in = 0.5, maxw = 5, silent = true }), id = 'prompt_dynatext2' } }
				} },
				(G.GAME.used_vouchers["v_retcon"] or G.GAME.used_vouchers["v_directors_cut"]) and
				UIBox_button({ label = { localize('b_reroll_boss'), localize('$') .. '10' }, button = "reroll_boss", func = 'reroll_boss_button' }) or nil,
				UIBox_button({ label = { "Reroll Temple Request", localize('$') .. '10' }, button = "reroll_temple", func = 'reroll_temple_request' }) or nil,
			} },
			config = { align = "cm", offset = { x = 0, y = -15 }, major = G.HUD:get_UIE_by_ID('row_blind'), bond = 'Weak' }
		}
	end
	return r_val
end

G.FUNCS.reroll_temple_request = function(e) --copied reroll_boss_button
	if ((G.GAME.dollars - G.GAME.bankrupt_at) - 10 >= 0) and
		true then
		e.config.colour = G.C.RED
		e.config.button = 'reroll_temple'
		e.children[1].children[1].config.shadow = true
		if e.children[2] then e.children[2].children[1].config.shadow = true end
	else
		e.config.colour = G.C.UI.BACKGROUND_INACTIVE
		e.config.button = nil
		e.children[1].children[1].config.shadow = false
		if e.children[2] then e.children[2].children[1].config.shadow = false end
	end
end

function generate_temple_request()
	local t = pseudorandom_element(G.temple_requests, pseudoseed('templedeck'))
	G.GAME.starting_params.temple_current_request = {}
	G.GAME.starting_params.temple_current_request.key = t.key
	G.GAME.starting_params.temple_current_request.difficulty = t.difficulty
	G.GAME.starting_params.temple_current_request.text = {}
	G.GAME.starting_params.temple_current_request.details = {}

	if t.details ~= nil then
		for k, v in pairs(t.details) do
			if k == "total" then
				G.GAME.starting_params.temple_current_request.details.total = pseudorandom('templedeck', v[1], v[2])
			elseif type(v) == "table" then
				G.GAME.starting_params.temple_current_request.details[k] = pseudorandom_element(v,
					pseudoseed('templedeck'))
			else
				G.GAME.starting_params.temple_current_request.details[k] = v
			end
		end

		if t.details.remaining ~= nil then
			G.GAME.starting_params.temple_current_request.details.remaining = G.GAME.starting_params.temple_current_request.details.total
		end
	end

	for i = 1, #t.text do
		local txt = t.text[i]
		for k, v in pairs(G.GAME.starting_params.temple_current_request.details) do
			txt = string.gsub(txt, "#" .. k .. "#", tostring(v))
		end
		G.GAME.starting_params.temple_current_request.text[i] = txt
	end

	G.GAME.starting_params.new_temple_request = true
end

G.FUNCS.reroll_temple = function(e) --copied reroll_boss
	stop_use()
	ease_dollars(-10)
	G.CONTROLLER.locks.boss_reroll = true
	G.E_MANAGER:add_event(Event({
		trigger = 'immediate',
		func = function()
			play_sound('other1')
			return true
		end
	}))
	G.E_MANAGER:add_event(Event({
		trigger = 'after',
		delay = 0.3,
		func = (function()
			generate_temple_request()

			G.E_MANAGER:add_event(Event({
				blocking = false,
				trigger = 'after',
				delay = 0.5,
				func = function()
					G.CONTROLLER.locks.boss_reroll = nil
					return true
				end
			}))
			save_run()
			return true
		end)
	}))
end

----------------------------------------------
------------MOD CODE END----------------------
