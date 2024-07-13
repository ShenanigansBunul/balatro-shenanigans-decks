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
			"Start with a {C:gold}Gros Michel{}"
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
			"All consumable cards are",
			"{C:dark_edition}Negative{} and may appear",
			"multiple times",
			"No consumable slot limit"
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
	register_sound("temple", shen_mod.path, "temple.wav")

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
			joker_slot = 0
			--dollars = 100000
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
			joker_slot = 0,
			consumable_slot = 2000000000
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
				total = { 3, 5 },
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
				total = { 3, 5 },
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
				total = { 3, 5 },
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
				total = { 3, 5 },
				remaining = 0
			},
			difficulty = 3
		},
		{
			key = "reach_exact_sum",
			text = { "Reach exactly #total#$",
			},
			details = {
				total = { 75, 150 },
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
				total = { 3, 5 },
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
				total = { 3, 5 },
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
				total = { 3, 5 },
				remaining = 0
			},
			difficulty = 2
		},
	}

	G.temple_rewards = {
		{
			key = "5_dollars",
			text = "5$",
			difficulty = 0,
			repeatable = true
		},
		{
			key = "tarot",
			text = "Random Tarot Card",
			difficulty = 0,
			repeatable = true
		},
		{
			key = "planet",
			text = "Random Planet Card",
			difficulty = 0,
			repeatable = true
		},
		{
			key = "spectral",
			text = "Random Spectral Card",
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
			text = "3 Negative Tarot Cards",
			difficulty = 1,
			repeatable = true
		},
		{
			key = "planets",
			text = "3 Negative Planet Cards",
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
			key = "joker_slot",
			text = "+1 Joker Slot",
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
			text = "90% chance for free rerolls, 100$",
			difficulty = 3,
			repeatable = false
		},
		{
			key = "joker_slots",
			text = "+5 Joker Slots",
			difficulty = 3,
			repeatable = false
		},
		{
			key = "interest_limit_break",
			text = "$1000 Interest Cap and $1000",
			difficulty = 3,
			repeatable = false
		},
		{
			key = "reset_ante",
			text = "Go to Ante 1",
			difficulty = 3,
			repeatable = true
		},
		{
			key = "clone_jokers",
			text = "Negative clones of all jokers",
			difficulty = 3,
			repeatable = true
		}
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
	templedeck:register()
	cartomancerdeck:register()
	--diplopiadeck:register() --wip - temporary cards when playing non temporary cards
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

local shen_start_run = Game.start_run
function Game.start_run(self, args)
	shen_start_run(self, args)
	if not G.GAME.starting_params.shen_runstarted then
		G.GAME.starting_params.shen_runstarted = true
		if G.GAME.starting_params.templedeck then
			generate_temple_request()
		elseif G.GAME.starting_params.tribouletdeck then
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
		end
	end
end

local shen_Cardapply_to_runRef = Card.apply_to_run
function Card.apply_to_run(self, center)
	shen_Cardapply_to_runRef(self, center)
	if G.GAME.starting_params.temple_deck_interest_limit_break and G.GAME.interest_cap ~= 5000 then
		G.GAME.interest_cap = 5000
	end
end

local shen_Backapply_to_runRef = Back.apply_to_run
function Back.apply_to_run(self)
	shen_Backapply_to_runRef(self)
	G.GAME.starting_params.shen_runstarted = false
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
		G.GAME.starting_params.tribouletdeck = self.effect.config.tribouletdeck
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
		G.GAME.starting_params.templedeck_effects = {}
	elseif self.effect.config.cartomancerdeck then
		G.GAME.starting_params.cartomancerdeck = self.effect.config.cartomancerdeck
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
		elseif self.effect.config.templedeck then
			if G.GAME.starting_params.temple_deck_balance_effect then
				local tot = args.chips + args.mult
				args.chips = math.floor(tot/2)
				args.mult = math.floor(tot/2)
				update_hand_text({delay = 0}, {mult = args.mult, chips = args.chips})
		
				G.E_MANAGER:add_event(Event({
					func = (function()
						local text = localize('k_balanced')
						play_sound('gong', 0.94, 0.3)
						play_sound('gong', 0.94*1.5, 0.2)
						play_sound('tarot1', 1.5)
						ease_colour(G.C.UI_CHIPS, {0.8, 0.45, 0.85, 1})
						ease_colour(G.C.UI_MULT, {0.8, 0.45, 0.85, 1})
						attention_text({
							scale = 1.4, text = text, hold = 2, align = 'cm', offset = {x = 0,y = -2.7},major = G.play
						})
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							blockable = false,
							blocking = false,
							delay =  4.3,
							func = (function() 
									ease_colour(G.C.UI_CHIPS, G.C.BLUE, 2)
									ease_colour(G.C.UI_MULT, G.C.RED, 2)
								return true
							end)
						}))
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							blockable = false,
							blocking = false,
							no_delete = true,
							delay =  6.3,
							func = (function() 
								G.C.UI_CHIPS[1], G.C.UI_CHIPS[2], G.C.UI_CHIPS[3], G.C.UI_CHIPS[4] = G.C.BLUE[1], G.C.BLUE[2], G.C.BLUE[3], G.C.BLUE[4]
								G.C.UI_MULT[1], G.C.UI_MULT[2], G.C.UI_MULT[3], G.C.UI_MULT[4] = G.C.RED[1], G.C.RED[2], G.C.RED[3], G.C.RED[4]
								return true
							end)
						}))
						return true
					end)
				}))

				nu_chip = args.chips
				nu_mult = args.mult
				delay(0.6)
			end

			local t_k = G.GAME.starting_params.temple_current_request.key
			local t = {
				['overscore_easy'] = 1,
				['overscore_medium'] = 2,
				['overscore_hard'] = 10,
				['overscore_insane'] = 100,
			}
			for k, v in pairs(t) do
				if k == t_k then
					if args.chips * args.mult >= G.GAME.blind.chips * v then
						complete_temple_request()
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
	elseif G.GAME.starting_params.cartomancerdeck then
		if _type == "Tarot" or _type == "Spectral" or _type == "Planet" or _type == "Tarot_Planet" then
			r_val:set_edition({ negative = true }, true)
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
				elseif _type == 'Tarot' then
					for _, j in pairs(G.P_CENTER_POOLS.Tarot) do
						if k == j.key then
							add[#add + 1] = k
							break
						end
					end
				elseif _type == 'Planet' then
					for _, j in pairs(G.P_CENTER_POOLS.Planet) do
						if k == j.key then
							add[#add + 1] = k
							break
						end
					end
				elseif _type == 'Spectral' then
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
	elseif G.GAME.starting_params.cartomancerdeck then
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
				if _type == 'Tarot' then
					for _, j in pairs(G.P_CENTER_POOLS.Tarot) do
						if k == j.key then
							add[#add + 1] = k
							break
						end
					end
				elseif _type == 'Planet' then
					for _, j in pairs(G.P_CENTER_POOLS.Planet) do
						if k == j.key then
							add[#add + 1] = k
							break
						end
					end
				elseif _type == 'Spectral' then
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
			p[#p + 1] = add[i]
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
	if G.GAME.starting_params.templedeck then
		local text,disp_text = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
		local k = G.GAME.starting_params.temple_current_request.key
		if k == 'discard_easy' or k == 'discard_medium' or k == 'discard_hard' then
			if G.GAME.starting_params.temple_current_request.details.hand == text then
				complete_temple_request()
			end
		end
	elseif G.GAME.starting_params.yorickdeck then
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
		local req = "??? Request"
		local colour = G.C.BLACK
		if G.GAME.starting_params.temple_current_request.difficulty ~= nil then
			if G.GAME.starting_params.temple_current_request.difficulty == 0 then
				req = "Common Request"
			elseif G.GAME.starting_params.temple_current_request.difficulty == 1 then
				req = "Uncommon Request"
			elseif G.GAME.starting_params.temple_current_request.difficulty == 2 then
				req = "Rare Request"
			elseif G.GAME.starting_params.temple_current_request.difficulty == 3 then
				req = "Legendary Request"
			end
			colour = G.C.RARITY[G.GAME.starting_params.temple_current_request.difficulty + 1]
		end
		r_val = {}
		r_val[#r_val + 1] = {
			config = {
				align = 'cl'
			},
			n = G.UIT.R,
			nodes = { {
				config = {
					colour = colour,
					scale = 0.42,
					text = req
				},
				n = G.UIT.T
			} }
		}
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

function generate_temple_request_text()
	for i = 1, #G.GAME.starting_params.temple_current_request.text_non_replaced do
		local txt = G.GAME.starting_params.temple_current_request.text_non_replaced[i]
		for k, v in pairs(G.GAME.starting_params.temple_current_request.details) do
			txt = string.gsub(txt, "#" .. k .. "#", tostring(v))
		end
		G.GAME.starting_params.temple_current_request.text[i] = txt
	end
	G.GAME.starting_params.new_temple_request = true
end

local shen_ease_dollars = ease_dollars
function ease_dollars(mod, instant)
	shen_ease_dollars(mod, instant)
	if G.GAME.starting_params.templedeck then
		local k = G.GAME.starting_params.temple_current_request.key
		if k == 'spend_easy' or k == 'spend_hard' then
			if mod < 0 then
				G.GAME.starting_params.temple_current_request.details.remaining = G.GAME.starting_params.temple_current_request.details.remaining + mod
			end
			if G.GAME.starting_params.temple_current_request.details.remaining <= 0 then
				complete_temple_request()
			else
				generate_temple_request_text()
			end
		elseif k == 'reach_exact_sum' then
			if G.GAME.dollars == G.GAME.starting_params.temple_current_request.details.total then
				complete_temple_request()
			end
		end
	end
end

function generate_temple_request()
	local request_rarity = pseudorandom('templedeck')
	local filtered_requests = {}
	local filtered_difficulty = 0
	if request_rarity > .95 then
		filtered_difficulty = 3
	elseif request_rarity > .8 then
		filtered_difficulty = 2
	elseif request_rarity > .5 then
		filtered_difficulty = 1
	end
	for i = 1, #G.temple_requests do
		if G.temple_requests[i].difficulty == filtered_difficulty then
			filtered_requests[#filtered_requests+1] = G.temple_requests[i]
		end
	end
	local t = pseudorandom_element(filtered_requests, pseudoseed('templedeck'))
	G.GAME.starting_params.temple_current_request = {}
	G.GAME.starting_params.temple_current_request.key = t.key
	G.GAME.starting_params.temple_current_request.difficulty = t.difficulty
	G.GAME.starting_params.temple_current_request.text = {}
	G.GAME.starting_params.temple_current_request.text_non_replaced = {}
	G.GAME.starting_params.temple_current_request.details = {}

	if t.details ~= nil then
		for k, v in pairs(t.details) do
			if k == "total" then
				G.GAME.starting_params.temple_current_request.details[k] = pseudorandom('templedeck', v[1], v[2])
			elseif type(v) == "table" then
				G.GAME.starting_params.temple_current_request.details[k] = pseudorandom_element(v,
					pseudoseed('templedeck'))
			else
				G.GAME.starting_params.temple_current_request.details[k] = v
			end
		end

		if G.GAME.starting_params.temple_current_request.key == 'reach_exact_sum' then
			if G.GAME.starting_params.temple_current_request.details.total == G.GAME.dollars then
				G.GAME.starting_params.temple_current_request.details.total = G.GAME.starting_params.temple_current_request.details.total + 1
			end
		end

		if t.details.remaining ~= nil then
			G.GAME.starting_params.temple_current_request.details.remaining = G.GAME.starting_params.temple_current_request.details.total
		end
	end

	for i = 1, #t.text do
		local txt = t.text[i]
		G.GAME.starting_params.temple_current_request.text_non_replaced[i] = txt
	end

	generate_temple_request_text()
end

function temple_congrats(txt)
	attention_text({scale = 1.4, text = "The Temple Rewards You!", hold = 5, align = 'cm', offset = {x = 0,y = -2.7},major = G.play})
	attention_text({scale = 1.4, text = txt, hold = 5, align = 'cm', offset = {x = 0,y = -0.7},major = G.play})
	modded_play_sound("temple", true, 1, 1)
end

function create_cards(count, neg, type)
	for i = 1, count do
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
			if G.consumeables.config.card_limit > #G.consumeables.cards or neg then
				play_sound('timpani')
				local card = create_card(type, G.consumeables, nil, nil, nil, nil, nil, 'temple_reward')
				if neg then
					card:set_edition({ negative = true }, true)
				end
				card:add_to_deck()
				G.consumeables:emplace(card)
			end
			return true end }))
	end
end

function create_joker(neg)
	G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
		if G.jokers.config.card_limit > #G.jokers.cards then
			play_sound('timpani')
			local card = create_card('Joker', G.jokers, nil, nil, nil, nil, nil, 'temple_reward')
			if neg then
				card:set_edition({ negative = true }, true)
			end
			card:add_to_deck()
			G.jokers:emplace(card)
		end
		return true end }))
end

function complete_temple_request()
	if G.GAME.starting_params.temple_current_request.disabled == nil then
		local filtered_rewards = {}
		for i = 1, #G.temple_rewards do
			local k = G.temple_rewards[i].key
			local repeated = false
			for j = 1, #G.GAME.starting_params.templedeck_effects do
				if k == G.GAME.starting_params.templedeck_effects[j] then
					repeated = true
					break
				end
			end
			if G.GAME.starting_params.temple_current_request.difficulty == G.temple_rewards[i].difficulty and not repeated then
				filtered_rewards[#filtered_rewards+1] = G.temple_rewards[i]
			end
		end
		local t = pseudorandom_element(filtered_rewards, pseudoseed('templedeck_rewards'))
		local k = t.key
		if k == '5_dollars' then
			ease_dollars(5)
		elseif k == 'tarot' then
			create_cards(1, false, 'Tarot')
		elseif k == 'planet' then
			create_cards(1, false, 'Planet')
		elseif k == 'spectral' then
			create_cards(1, false, 'Spectral')
		elseif k == 'joker' then
			create_joker(false)
		elseif k == 'tarots' then
			create_cards(3, true, 'Tarot')
		elseif k == 'planets' then
			create_cards(3, true, 'Planet')
		elseif k == 'spectrals' then
			create_cards(2, true, 'Spectral')
		elseif k == 'negative_joker' then
			create_joker(true)
		elseif k == 'joker_edition' then
			local temp_pool = {}
			for k, v in pairs(G.jokers.cards) do
                if v.ability.set == 'Joker' and (not v.edition) then
                    table.insert(temp_pool, v)
                end
            end
			if #temp_pool > 0 then
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
					local eligible_card = pseudorandom_element(temp_pool, pseudoseed('templedeck_reward'))
					local edition = poll_edition('templedeck_reward', nil, true, true)
					eligible_card:set_edition(edition, true)
				return true end }))
			end
		elseif k == 'random_tag' then
			G.E_MANAGER:add_event(Event({
				func = (function()
					local t_ids = {}
					for k, v in pairs(G.P_TAGS) do
						t_ids[#t_ids+1] = k
					end
					local t = pseudorandom_element(t_ids, pseudoseed('templedeck_rewards'))
					add_tag(Tag(t))
					play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
					play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
					return true
				end)
			}))
		elseif k == 'black_hole' then
			G.E_MANAGER:add_event(Event({
				func = (function()
					if G.consumeables.config.card_limit > #G.consumeables.cards then
						local card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, 'c_black_hole', 'deck')
						card:add_to_deck()
						G.consumeables:emplace(card)
						play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
						play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
						return true
					end
				end)
			  }))
		elseif k == 'hand' then
			G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
		elseif k == 'shop_slot' then
			G.E_MANAGER:add_event(Event({func = function()
				change_shop_size(1)
				return true end }))
		elseif k == 'joker_slots' then
			G.jokers.config.card_limit = G.jokers.config.card_limit + 5
		elseif k == 'discard' then
			ease_discard(1)
			G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
		elseif k == 'minus_ante' then
			ease_ante(-1)
			G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
			G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - 1
		elseif k == 'hand_size' then
			G.hand:change_size(1)
		elseif k == 'consumable_slot' then
			G.E_MANAGER:add_event(Event({func = function()
				G.consumeables.config.card_limit = G.consumeables.config.card_limit + 1
				return true end }))
		elseif k == 'joker_slot' then
			G.jokers.config.card_limit = G.jokers.config.card_limit + 1
		elseif k == 'balance_effect' then
			G.GAME.starting_params.temple_deck_balance_effect = true
		elseif k == 'free_rolls_effect' then
			G.GAME.starting_params.temple_deck_free_rolls_effect = true
			ease_dollars(100)
		elseif k == 'interest_limit_break' then
			G.GAME.starting_params.temple_deck_interest_limit_break = true
			G.GAME.interest_cap = 5000
			ease_dollars(1000)
		elseif k == 'reset_ante' then
			local d = G.GAME.round_resets.ante - 1
			ease_ante(-d)
			G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
			G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - d
		elseif k == 'clone_jokers' then
			if G.jokers.cards[1] then
				for i = 1, #G.jokers.cards do
					G.E_MANAGER:add_event(Event({
						func = function()
							local card = copy_card(G.jokers.cards[i], nil)
							card:set_edition({ negative = true }, true)
							card:add_to_deck()
							G.jokers:emplace(card)
							return true
						end
					}))
				end
			end
		end
		if not t.repeatable then
			G.GAME.templedeck_effects[#G.GAME.templedeck_effects+1] = t.key
		end
		temple_congrats(t.text)
	else --for rerolls
		G.GAME.starting_params.temple_current_request.disabled = nil
	end
	generate_temple_request()
end

local shen_calculate_reroll_cost = calculate_reroll_cost
function calculate_reroll_cost(skip_increment)
	shen_calculate_reroll_cost(skip_increment)
	if G.GAME.starting_params.temple_deck_free_rolls_effect and pseudorandom('templedeck_freerolls') > .1 then
		if not skip_increment then G.GAME.current_round.reroll_cost_increase = G.GAME.current_round.reroll_cost_increase - 1 end
		G.GAME.current_round.reroll_cost = 0
	end
end

local shen_playing_card_joker_effects = playing_card_joker_effects
function playing_card_joker_effects(cards)
	shen_playing_card_joker_effects(cards)
	if G.GAME.starting_params.templedeck then
		if #cards > 0 then
			complete_or_increment_request('card_add', 'card_add_multiple', #cards)
		end
	end
end

function fix_shop_size()
	if G.GAME.starting_params.templedeck then
		if G.shop_jokers and G.shop_jokers.cards then
			if G.shop_jokers.T.w > math.min(G.GAME.shop.joker_max, 4)*1.01*G.CARD_W then
				G.shop_jokers.T.w = math.min(G.GAME.shop.joker_max, 4)*1.01*G.CARD_W ---overridden with math.max to prevent shop becoming too large
				G.shop:recalculate()
			end
		end
	end
end

local shen_Game_update_shop = Game.update_shop
function Game.update_shop(self, dt)
	shen_Game_update_shop(self, dt)
	fix_shop_size()
end

local shen_change_shop_size = change_shop_size
function change_shop_size(mod)
	shen_change_shop_size(mod)
	fix_shop_size()
end

local shen_modify_hand = Blind.modify_hand
function Blind.modify_hand(self, cards, poker_hands, text, mult, hand_chips) -- called for hands, around the same time as before context for jokers - but only called once so I can use it for temple deck obelisk checks etc
	mult, hand_chips, modded = shen_modify_hand(self, cards, poker_hands, text, mult, hand_chips)
	if G.GAME.starting_params.templedeck then
		if G.GAME.starting_params.temple_current_request.details.hand ~= nil and G.GAME.starting_params.temple_current_request.details.hand == text then
			complete_or_increment_request('play_easy', 'play_easy_multiple', 1)
			complete_or_increment_request('play_medium', 'play_medium_multiple', 1)
			complete_or_increment_request('play_hard', 'play_hard_multiple', 1)
		end
		local k = G.GAME.starting_params.temple_current_request.key
		if k == 'play_obelisk' then
			local reset = true
			local play_more_than = (G.GAME.hands[text].played or 0)
			for k, v in pairs(G.GAME.hands) do
				if k ~= text and v.played >= play_more_than and v.visible then
					reset = false
				end
			end
			if reset then
				G.GAME.starting_params.temple_current_request.details.remaining = G.GAME.starting_params.temple_current_request.details.total
			else
				G.GAME.starting_params.temple_current_request.details.remaining = G.GAME.starting_params.temple_current_request.details.remaining - 1
			end
			if G.GAME.starting_params.temple_current_request.details.remaining <= 0 then
				complete_temple_request()
			else
				generate_temple_request_text()
			end
		end
	end
	return mult, hand_chips, modded
end

G.FUNCS.reroll_temple = function(e) --copied reroll_boss
	stop_use()
	G.GAME.starting_params.temple_current_request.disabled = true
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

local shen_skip_blind = G.FUNCS.skip_blind
function G.FUNCS.skip_blind(e)
	shen_skip_blind(e)
	if G.GAME.starting_params.templedeck then
		if G.GAME.starting_params.temple_current_request.key == "skip_blind" then
			complete_temple_request()
		end
	end
end

local shen_start_dissolve = Card.start_dissolve
function Card.start_dissolve(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
	if G.GAME.starting_params.templedeck then
		if self.playing_card then
			complete_or_increment_request('card_remove', 'card_remove_multiple', 1)
		end
	end
	shen_start_dissolve(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
end

local shen_shatter = Card.shatter
function Card.shatter(self)
	if G.GAME.starting_params.templedeck then
		if self.playing_card then
			complete_or_increment_request('card_remove', 'card_remove_multiple', 1)
		end
	end
	shen_shatter(self)
end

function complete_or_increment_request(c_key, i_key, q)
	local k = G.GAME.starting_params.temple_current_request.key
	if k == c_key then
		complete_temple_request()
	elseif k == i_key then
		G.GAME.starting_params.temple_current_request.details.remaining = G.GAME.starting_params.temple_current_request.details.remaining - q
		if G.GAME.starting_params.temple_current_request.details.remaining <= 0 then
			complete_temple_request()
		else
			generate_temple_request_text()
		end
	end
end

local shen_set_consumable_usage = set_consumeable_usage
function set_consumeable_usage(card)
	if G.GAME.starting_params.templedeck then
		if card.config.center.set == 'Tarot' then
			complete_or_increment_request('play_tarot', 'play_tarots', 1)
		elseif card.config.center.set == 'Planet' then
			complete_or_increment_request('play_planet', 'play_planets', 1)
		elseif card.config.center.set == 'Spectral' then
			complete_or_increment_request('play_spectral', 'play_spectrals', 1)
		end
	end
	shen_set_consumable_usage(card)
end

local shen_Cardarea_draw = CardArea.draw -- how 2 be incompatible with anything that modifies this function
function CardArea.draw(self)
    if not self.states.visible then return end 
    if G.VIEWING_DECK and (self==G.deck or self==G.hand or self==G.play) then return end

	--added code
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
	-- added code

    local state = G.TAROT_INTERRUPT or G.STATE

    self.ARGS.invisible_area_types = self.ARGS.invisible_area_types or {discard=1, voucher=1, play=1, consumeable=1, title = 1, title_2 = 1}
    if self.ARGS.invisible_area_types[self.config.type] or
        (self.config.type == 'hand' and ({[G.STATES.SHOP]=1, [G.STATES.TAROT_PACK]=1, [G.STATES.SPECTRAL_PACK]=1, [G.STATES.STANDARD_PACK]=1,[G.STATES.BUFFOON_PACK]=1,[G.STATES.PLANET_PACK]=1, [G.STATES.ROUND_EVAL]=1, [G.STATES.BLIND_SELECT]=1})[state]) or
        (self.config.type == 'deck' and self ~= G.deck) or
        (self.config.type == 'shop' and self ~= G.shop_vouchers) then
    else
        if not self.children.area_uibox then 
				--code edit starts here
				local card_count
				if self == G.consumeables and G.GAME.starting_params.cartomancerdeck then
					card_count = self ~= G.shop_vouchers and {n=G.UIT.R, config={align = self == G.jokers and 'cl' or self == G.hand and 'cm' or 'cr', padding = 0.03, no_fill = true}, nodes={
						{n=G.UIT.B, config={w = 0.1,h=0.1}},
						{n=G.UIT.T, config={ref_table = self.config, ref_value = 'card_count', scale = 0.3, colour = G.C.WHITE}},
						{n=G.UIT.B, config={w = 0.1,h=0.1}}
					}} or nil
				else
					card_count = self ~= G.shop_vouchers and {n=G.UIT.R, config={align = self == G.jokers and 'cl' or self == G.hand and 'cm' or 'cr', padding = 0.03, no_fill = true}, nodes={
						{n=G.UIT.B, config={w = 0.1,h=0.1}},
						{n=G.UIT.T, config={ref_table = self.config, ref_value = 'card_count', scale = 0.3, colour = G.C.WHITE}},
						{n=G.UIT.T, config={text = '/', scale = 0.3, colour = G.C.WHITE}},
						{n=G.UIT.T, config={ref_table = self.config, ref_value = 'card_limit', scale = 0.3, colour = G.C.WHITE}},
						{n=G.UIT.B, config={w = 0.1,h=0.1}}
					}} or nil
				end  
				-- code edit ends here

                self.children.area_uibox = UIBox{
                    definition = 
                        {n=G.UIT.ROOT, config = {align = 'cm', colour = G.C.CLEAR}, nodes={
                            {n=G.UIT.R, config={minw = self.T.w,minh = self.T.h,align = "cm", padding = 0.1, mid = true, r = 0.1, colour = self ~= G.shop_vouchers and {0,0,0,0.1} or nil, ref_table = self}, nodes={
                                self == G.shop_vouchers and 
                                {n=G.UIT.C, config={align = "cm", paddin = 0.1, func = 'shop_voucher_empty', visible = false}, nodes={
                                    {n=G.UIT.R, config={align = "cm"}, nodes={
                                        {n=G.UIT.T, config={text = 'DEFEAT', scale = 0.6, colour = G.C.WHITE}}
                                    }},
                                    {n=G.UIT.R, config={align = "cm"}, nodes={
                                        {n=G.UIT.T, config={text = 'BOSS BLIND', scale = 0.4, colour = G.C.WHITE}}
                                    }},
                                    {n=G.UIT.R, config={align = "cm"}, nodes={
                                        {n=G.UIT.T, config={text = 'TO RESTOCK', scale = 0.4, colour = G.C.WHITE}}
                                    }},
                                }} or nil,
                            }},
                            card_count
                        }},
                    config = { align = 'cm', offset = {x=0,y=0}, major = self, parent = self}
                }
            end
        self.children.area_uibox:draw()
    end

    self:draw_boundingrect()
    add_to_drawhash(self)

    self.ARGS.draw_layers = self.ARGS.draw_layers or self.config.draw_layers or {'shadow', 'card'}
    for k, v in ipairs(self.ARGS.draw_layers) do
        if self.config.type == 'deck' then 
            for i = #self.cards, 1, -1 do 
                if self.cards[i] ~= G.CONTROLLER.focused.target then
                    if i == 1 or i%(self.config.thin_draw or 9) == 0 or i == #self.cards or math.abs(self.cards[i].VT.x - self.T.x) > 1 or math.abs(self.cards[i].VT.y - self.T.y) > 1  then
                        if G.CONTROLLER.dragging.target ~= self.cards[i] then self.cards[i]:draw(v) end
                    end
                end
            end
        end

        if self.config.type == 'joker' or self.config.type == 'consumeable' or self.config.type == 'shop' or self.config.type == 'title_2' then 
            for i = 1, #self.cards do 
                if self.cards[i] ~= G.CONTROLLER.focused.target then
                    if not self.cards[i].highlighted then
                        if G.CONTROLLER.dragging.target ~= self.cards[i] then self.cards[i]:draw(v) end
                    end
                end
            end
            for i = 1, #self.cards do  
                if self.cards[i] ~= G.CONTROLLER.focused.target then
                    if self.cards[i].highlighted then
                        if G.CONTROLLER.dragging.target ~= self.cards[i] then self.cards[i]:draw(v) end
                    end
                end
            end
        end

        if self.config.type == 'discard' then 
            for i = 1, #self.cards do 
                if self.cards[i] ~= G.CONTROLLER.focused.target then
                    if math.abs(self.cards[i].VT.x - self.T.x) > 1 then 
                        if G.CONTROLLER.dragging.target ~= self.cards[i] then self.cards[i]:draw(v) end
                    end
                end
            end
        end

        if self.config.type == 'hand' or self.config.type == 'play' or self.config.type == 'title' or self.config.type == 'voucher' then 
            for i = 1, #self.cards do 
                if self.cards[i] ~= G.CONTROLLER.focused.target or self == G.hand then
                    if G.CONTROLLER.dragging.target ~= self.cards[i] then self.cards[i]:draw(v) end
                end
            end
        end
    end

    if self == G.deck then
        if G.CONTROLLER.HID.controller and G.STATE == G.STATES.SELECTING_HAND and not self.children.peek_deck then
            self.children.peek_deck = UIBox{
                definition = 
                    {n=G.UIT.ROOT, config = {align = 'cm', padding = 0.1, r =0.1, colour = G.C.CLEAR}, nodes={
                        {n=G.UIT.R, config={align = "cm", r =0.1, colour = adjust_alpha(G.C.L_BLACK, 0.5),func = 'set_button_pip', focus_args = {button = 'triggerleft', orientation = 'bm', scale = 0.6, type = 'none'}}, nodes={
                            {n=G.UIT.R, config={align = "cm"}, nodes={
                                {n=G.UIT.T, config={text = 'PEEK', scale = 0.48, colour = G.C.WHITE, shadow = true}}
                            }},
                            {n=G.UIT.R, config={align = "cm"}, nodes={
                                {n=G.UIT.T, config={text = 'DECK', scale = 0.38, colour = G.C.WHITE, shadow = true}}
                            }},
                        }},
                    }},
                config = { align = 'cl', offset = {x=-0.5,y=0.1}, major = self, parent = self}
            }
            self.children.peek_deck.states.collide.can = false
        elseif (not G.CONTROLLER.HID.controller or G.STATE ~= G.STATES.SELECTING_HAND) and self.children.peek_deck then
            self.children.peek_deck:remove()
            self.children.peek_deck = nil
        end
        if not self.children.view_deck then 
            self.children.view_deck = UIBox{
                definition = 
                    {n=G.UIT.ROOT, config = {align = 'cm', padding = 0.1, r =0.1, colour = G.C.CLEAR}, nodes={
                        {n=G.UIT.R, config={align = "cm", padding = 0.05, r =0.1, colour = adjust_alpha(G.C.BLACK, 0.5),func = 'set_button_pip', focus_args = {button = 'triggerright', orientation = 'bm', scale = 0.6}, button = 'deck_info'}, nodes={
                            {n=G.UIT.R, config={align = "cm", maxw = 2}, nodes={
                                {n=G.UIT.T, config={text = localize('k_view'), scale = 0.48, colour = G.C.WHITE, shadow = true}}
                            }},
                            {n=G.UIT.R, config={align = "cm", maxw = 2}, nodes={
                                {n=G.UIT.T, config={text = localize('k_deck'), scale = 0.38, colour = G.C.WHITE, shadow = true}}
                            }},
                        }},
                    }},
                config = { align = 'cm', offset = {x=0,y=0}, major = self.cards[1] or self, parent = self}
            }
            self.children.view_deck.states.collide.can = false
        end
    if G.deck_preview or self.states.collide.is or (G.buttons and G.buttons.states.collide.is and G.CONTROLLER.HID.controller) then self.children.view_deck:draw() end
    if self.children.peek_deck then self.children.peek_deck:draw() end
    end
end

----------------------------------------------
------------MOD CODE END----------------------


