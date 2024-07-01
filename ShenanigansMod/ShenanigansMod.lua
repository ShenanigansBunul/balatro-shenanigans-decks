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
	local spr_hieroglyphdeck = SMODS.Sprite:new("sprhieroglyphdeck", shen_mod.path, "b_hieroglyphdeck.png", 71, 95, "asset_atli")
	local spr_freakydeck = SMODS.Sprite:new("sprfreakydeck", shen_mod.path, "b_freakydeck.png", 284, 380, "asset_atli")
	local spr_perkeodeck = SMODS.Sprite:new("sprperkeodeck", shen_mod.path, "b_perkeodeck.png", 71, 95, "asset_atli")
	local spr_chicotdeck = SMODS.Sprite:new("sprchicotdeck", shen_mod.path, "b_chicotdeck.png", 71, 95, "asset_atli")
	local spr_yorickdeck = SMODS.Sprite:new("spryorickdeck", shen_mod.path, "b_yorickdeck.png", 71, 95, "asset_atli")
	local spr_caniodeck = SMODS.Sprite:new("sprcaniodeck", shen_mod.path, "b_caniodeck.png", 71, 95, "asset_atli")
	local spr_showmandeck = SMODS.Sprite:new("sprshowmandeck", shen_mod.path, "b_showmandeck.png", 71, 95, "asset_atli")
	local spr_grosmicheldeck = SMODS.Sprite:new("sprgrosmicheldeck", shen_mod.path, "b_grosmicheldeck.png", 71, 95, "asset_atli")
	local spr_snakeskindeck = SMODS.Sprite:new("sprsnakeskindeck", shen_mod.path, "b_snakeskindeck.png", 71, 95, "asset_atli")
	local spr_tribouletdeck = SMODS.Sprite:new("sprtribouletdeck", shen_mod.path, "b_tribouletdeck.png", 71, 95, "asset_atli")
	local spr_turtlebeandeck = SMODS.Sprite:new("sprturtlebeandeck", shen_mod.path, "b_turtlebeandeck.png", 71, 95, "asset_atli")


	-- local ??deck_def = {
	-- 	["name"]="",
	-- 	["text"]={
	-- 		[1]=""
	-- 	}
	-- }

	local perkeodeck_def = {
		["name"]="Perkeo's Deck",
		["text"]={
			[1]="After defeating each {C:attention}Boss Blind{},",
			[2]="creates a {C:dark_edition}Negative{} copy of",
			[3]="{C:attention}1{} random {C:attention}consumable{}",
			[4]="card in your possession"
		}
	}

	local chicotdeck_def = {
		["name"]="Chicot's Deck",
		["text"]={
			"Sell any Joker to",
			"disable the current",
			"{C:attention}Boss Blind{}",
		}
	}

	local yorickdeck_def = { --WIP, currently only works with purple seals, TODO think of different effect maybe
		["name"]="Yorick's Deck",
		["text"]={
			"Played cards trigger",
			"their discard effects,",
			"start with a {C:spectral,T:c_medium}Medium{} card"
		}
	}

	local caniodeck_def = {
		["name"]="Canio's Deck",
		["text"]={
			[1]="Discarded cards have a",
			[2]="{C:green}1 in 7{} chance",
			[3]="to be destroyed"
		}
	}

	local duskdeck_def = {
		["name"]="Dusk Deck",
		["text"]={
			[1]="Retrigger all played",
			[2]="cards in {C:attention}final hand{}",
			[3]="of round {C:attention}twice{}",
			[4]="{C:blue}-1{} hand every round"
		},
	}

	local hieroglyphdeck_def = {
		["name"]="Hieroglyph Deck",
		["text"]={
			[1]="{C:attention}-1{} Ante",
			[2]="{C:attention}+2{} Antes to win"
		},
	}

	local freakydeck_def = {
		["name"]="Freaky Deck",
		["text"]={
			"Jokers are now {C:attention}freaky{}"
		}
	}

	local showmandeck_def = {
		["name"]="Showman Deck",
		["text"]={
			"{C:attention}Joker{}, {C:tarot}Tarot{}, {C:planet}Planet{},",
			"and {C:spectral}Spectral{} cards may",
			"appear multiple times, higher",
			"chance for duplicates."
		}
	}

	local grosmicheldeck_def = {
		["name"]="Gros Michel Deck",
		["text"]={
			"{C:attention}+2{} Joker slots",
			"Each other Joker has a",
			"{C:green}1 in 6{} chance to be",
			"destroyed at end of round",
			"Start with a {C:gold}Gros Michel{}" --TODO  T:j_gros_michel, figure out how to use the variables
		}
	}

	local snakeskindeck_def = {
		["name"]="Snakeskin Deck",
		["text"]={
			"After Play or Discard,",
            "always draw 3 cards"
		}
	}

	local tribouletdeck_def = {
		["name"]="Triboulet's Deck",
		["text"]={
			"Start run with 4 extra",
            "{C:attention}Kings{} and {C:attention}Queens{}",
			"of random suits"
		}
	}

	local turtlebeandeck_def = {
		["name"]="Turtle Bean Deck",
		["text"]={
			"{C:attention}+5{} hand size,",
			"reduces by {C:red}1{}",
			"after each {C:attention}Boss Blind{}"
		}
	}

	register_sound("freaky_scream", shen_mod.path, "scream.wav")

	-- local ??deck = SMODS.Deck:new("?? Deck", "??deck", {atlas = "spr??deck", ??deck = true,
	-- discards = 0, hands = 0, hand_size = 0, extra_hand_bonus = 0},
	-- {x = 0, y = 0}, ??deck_def)
	local perkeodeck = SMODS.Deck:new("Perkeo's Deck", "perkeodeck", {atlas = "sprperkeodeck", perkeodeck = true,
	discards = 0, hands = 0, hand_size = 0, extra_hand_bonus = 0},
	{x = 0, y = 0}, perkeodeck_def)
	local chicotdeck = SMODS.Deck:new("Chicot's Deck", "chicotdeck", {atlas = "sprchicotdeck", chicotdeck = true,
	discards = 0, hands = 0, hand_size = 0, extra_hand_bonus = 0},
	{x = 0, y = 0}, chicotdeck_def)
	local yorickdeck = SMODS.Deck:new("Yorick's Deck", "yorickdeck", {atlas = "spryorickdeck", yorickdeck = true,
	discards = 0, hands = 0, hand_size = 0, extra_hand_bonus = 0, consumables = {'c_medium'}},
	{x = 0, y = 0}, yorickdeck_def)
	local caniodeck = SMODS.Deck:new("Canio's Deck", "caniodeck", {atlas = "sprcaniodeck", caniodeck = true,
	discards = 0, hands = 0, hand_size = 0, extra_hand_bonus = 0},
	{x = 0, y = 0}, caniodeck_def)
	local duskdeck = SMODS.Deck:new("Dusk Deck", "duskdeck", {atlas = "sprduskdeck", duskdeck = true,
	discards = 0, hands = -1, hand_size = 0, extra_hand_bonus = 0},
	{x = 0, y = 0}, duskdeck_def)
	local hieroglyphdeck = SMODS.Deck:new("Hieroglyph Deck", "hieroglyphdeck", {atlas = "sprhieroglyphdeck", hieroglyphdeck = true,
	discards = 0, hands = 0, hand_size = 0, extra_hand_bonus = 0},
	{x = 0, y = 0}, hieroglyphdeck_def)
	local freakydeck = SMODS.Deck:new("Freaky Deck", "freakydeck", {atlas = "sprfreakydeck", freakydeck = true,
	discards = 0, hands = 0, hand_size = 0, extra_hand_bonus = 0},
	{x = 0, y = 0}, freakydeck_def)
	local showmandeck = SMODS.Deck:new("Showman Deck", "showmandeck", {atlas = "sprshowmandeck", showmandeck = true,
	discards = 0, hands = 0, hand_size = 0, extra_hand_bonus = 0},
	{x = 0, y = 0}, showmandeck_def)
	local grosmicheldeck = SMODS.Deck:new("Gros Michel Deck", "grosmicheldeck", {atlas = "sprgrosmicheldeck", grosmicheldeck = true,
	discards = 0, hands = 0, hand_size = 0, extra_hand_bonus = 0, joker_slot = 2},
	{x = 0, y = 0}, grosmicheldeck_def)
	local snakeskindeck = SMODS.Deck:new("Snakeskin Deck", "snakeskindeck", {atlas = "sprsnakeskindeck", snakeskindeck = true,
	discards = 0, hands = 0, hand_size = 0, extra_hand_bonus = 0, joker_slot = 0},
	{x = 0, y = 0}, snakeskindeck_def)
	local tribouletdeck = SMODS.Deck:new("Triboulet's Deck", "tribouletdeck", {atlas = "sprtribouletdeck", tribouletdeck = true,
	discards = 0, hands = 0, hand_size = 0, extra_hand_bonus = 0, joker_slot = 0},
	{x = 0, y = 0}, tribouletdeck_def)
	local turtlebeandeck = SMODS.Deck:new("Turtle Bean Deck", "turtlebeandeck", {atlas = "sprturtlebeandeck", turtlebeandeck = true,
	discards = 0, hands = 0, hand_size = 5, extra_hand_bonus = 0, joker_slot = 0},
	{x = 0, y = 0}, turtlebeandeck_def)

	G.localization.descriptions.Other.freaky_six = {
		name = "Freaky 6",
		text = {
			"who will match",
			"my freak?"
		}
	}

	G.localization.descriptions.Other.freaky_nine = {
		name = "Freaky 9",
		text = {
			"i'm a freak",
			"just lmk"
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
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante-1
	elseif self.effect.config.turtlebeandeck then
		G.GAME.starting_params.bean_counter = 0
	elseif self.effect.config.tribouletdeck then
		G.E_MANAGER:add_event(Event({
			func = function()
                for i = 1, 4 do
                    local _suit = pseudorandom_element({'S','H','D','C'}, pseudoseed('triboulet_deck_create'))
                    local card = copy_card(G.playing_cards[1], nil, 1, G.playing_card)
                    card:set_base(G.P_CARDS[_suit.."_".."Q"])
                    G.deck:emplace(card)
					G.playing_cards[#G.playing_cards+1] = card
				end
                for i = 1, 4 do
                    local _suit = pseudorandom_element({'S','H','D','C'}, pseudoseed('triboulet_deck_create'))
                    local card = copy_card(G.playing_cards[1], nil, 1, G.playing_card)
                    card:set_base(G.P_CARDS[_suit.."_".."K"])
                    G.deck:emplace(card)
					G.playing_cards[#G.playing_cards+1] = card
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
		G.GAME.starting_params.yorickhandplayed = false
	elseif self.effect.config.showmandeck then
		G.GAME.starting_params.showmandeck = self.effect.config.showmandeck
	elseif self.effect.config.snakeskindeck then
		G.GAME.starting_params.snakeskindeck = self.effect.config.snakeskindeck
	elseif self.effect.config.freakydeck then
		G.GAME.starting_params.freakydeck = self.effect.config.freakydeck
	end
end

local shen_Card_calculate_sealRef = Card.calculate_seal
function Card.calculate_seal(self, context)
	shen_Card_calculate_sealRef(self, context)
	if G.GAME.starting_params.duskdeck and G.GAME.current_round.hands_left == 0 and context.repetition then
		local r = 2
		if self.seal == 'Red' then
			r = r + 1
		end
		return {
			message = localize('k_again_ex'),
			repetitions = r,
			card = self
		}
	end
end

local shen_Backtriggereffect = Back.trigger_effect
function Back.trigger_effect(self, args)
	local nu_chip, nu_mult = shen_Backtriggereffect(self, args)
	if self.effect.config.turtlebeandeck and args.context == 'eval' and G.GAME.last_blind and G.GAME.last_blind.boss and G.GAME.starting_params.bean_counter < 5 then
		G.hand:change_size(-1)
		G.GAME.starting_params.bean_counter = G.GAME.starting_params.bean_counter + 1
	elseif self.effect.config.perkeodeck and args.context == 'eval' and G.GAME.last_blind and G.GAME.last_blind.boss then
		if G.consumeables.cards[1] then
			G.E_MANAGER:add_event(Event({
				func = function() 
					local card = copy_card(pseudorandom_element(G.consumeables.cards, pseudoseed('perkeo_deck')), nil)
					card:set_edition({negative = true}, true)
					card:add_to_deck()
					G.consumeables:emplace(card) 
					return true
				end}))
		end
	elseif self.effect.config.yorickdeck and args.context == 'final_scoring_step' then
		G.GAME.starting_params.yorickhandplayed = false
	elseif self.effect.config.freakydeck and args.context == 'blind_amount' then
		return 
	elseif self.effect.config.freakydeck and args.context == 'final_scoring_step' then
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i].ability.freaky_six then
				if i < #G.jokers.cards then
					if G.jokers.cards[i+1].ability.freaky_nine then
						card_eval_status_text(G.jokers.cards[i], 'jokers', nil, nil, nil, {
							message = "Freaky!"
						})
						card_eval_status_text(G.jokers.cards[i+1], 'x_mult', 1.5, nil, nil, {
							message = "Freaky!"
						})
						args.mult = args.mult * 1.5
						update_hand_text({delay = 0}, {mult = args.mult, chips = args.chips})
					end
				end
			end
		end
	end
	return nu_chip, nu_mult
end

local shen_common_events_createcard = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
	local r_val
	if G.GAME.starting_params.showmandeck and forced_key == nil then
		if pseudorandom('showmandeck') < 1/9 then
			if _type == 'Joker' and #G.jokers.cards > 0 then
				local dupes = {}
				for i = 1, #G.jokers.cards do
					if G.jokers.cards[i].config.center.set == _type and (_rarity == 0 or _rarity == nil or G.jokers.cards[i].config.center.rarity == _rarity) then
						dupes[#dupes+1] = G.jokers.cards[i]
					end
				end
				if #dupes > 0 then
					local chosen_joker = pseudorandom_element(dupes, pseudoseed('showmandeck'))
					r_val = shen_common_events_createcard(_type, area, legendary, _rarity, skip_materialize, soulable, chosen_joker.config.center.key, key_append)
				end
			elseif #G.consumeables.cards > 0 then
				if _type == 'Tarot' or _type == 'Spectral' or _type == 'Planet' then
					local dupes = {}
					for i = 1, #G.consumeables.cards do
						if G.consumeables.cards[i].config.center.set == _type then
							dupes[#dupes+1] = G.consumeables.cards[i]
						end
					end
					if #dupes > 0 then
						local chosen_card = pseudorandom_element(dupes, pseudoseed('showmandeck'))
						r_val = shen_common_events_createcard(_type, area, legendary, _rarity, skip_materialize, soulable, chosen_card.config.center.key, key_append)
					end
				end
			end
		end
	end
	if r_val == nil then
		r_val = shen_common_events_createcard(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
	end
	if G.GAME.starting_params.freakydeck then
		if _type == "Joker" then
			if pseudorandom('freaky') < 1/2 then
				r_val.ability.freaky_six = true
			else
				r_val.ability.freaky_nine = true
			end
		end
	end
	return r_val
end

local shen_Card_calculate_jokerRef = Card.calculate_joker
function Card.calculate_joker(self, context)
	local r_val = shen_Card_calculate_jokerRef(self, context)
	if context.scoring_hand and G.GAME.starting_params.yorickdeck then
		if not G.GAME.starting_params.yorickhandplayed then
			G.GAME.starting_params.yorickhandplayed = true
			for i=1, #context.scoring_hand do
				context.scoring_hand[i]:calculate_seal({discard = true})
			end
		end
	end
	if self.ability.set == "Joker" then
		if context.selling_self then
			if G.GAME.starting_params.chicotdeck and G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind:get_type() == 'Boss')) then
				card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                G.GAME.blind:disable()
			end
		end
	end
	return r_val
end

local shen_Drawcard = draw_card
function draw_card(from, to, percent, dir, sort, card, delay, mute, stay_flipped, vol, discarded_only)
	if G.GAME.starting_params.caniodeck and card and from == G.hand and to == G.discard then
		if pseudorandom("caniodeck") < (G.GAME.probabilities.normal/7) then
			G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.33,
				func = function()
					card:start_dissolve()
					for i = 1, #G.jokers.cards do
						G.jokers.cards[i]:calculate_joker({ remove_playing_cards = true, removed = {card} })
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
				eligibles[#eligibles+1] = G.jokers.cards[i]
			end
		end
		for i = 1, #eligibles do
			local r_val = nil
			if pseudorandom('grosmicheldeck') < G.GAME.probabilities.normal/6 then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('tarot1')
						eligibles[i].T.r = -0.2
						eligibles[i]:juice_up(0.3, 0.4)
						eligibles[i].states.drag.is = true
						eligibles[i].children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
							func = function()
									G.jokers:remove_card(eligibles[i])
									eligibles[i]:remove()
									eligibles[i] = nil
								return true; end})) 
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
	local r_val = shen_generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
	if r_val.card_type ~= nil and r_val.card_type == "Joker" then
		if G.GAME.starting_params.freaky_six_UI == true then
			G.GAME.starting_params.freaky_six_UI = false
			shen_generate_card_ui({key = 'freaky_six', set = 'Other'}, r_val)
		elseif G.GAME.starting_params.freaky_nine_UI == true then
			G.GAME.starting_params.freaky_nine_UI = false
			shen_generate_card_ui({key = 'freaky_nine', set = 'Other'}, r_val)
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

----------------------------------------------
------------MOD CODE END----------------------
