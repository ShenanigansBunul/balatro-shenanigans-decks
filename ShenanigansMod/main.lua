SMODS.Atlas({key = "shenDecks", path = "shenDecks.png", px = 71, py = 95, atlas_table = "ASSET_ATLAS"}):register()
SMODS.Atlas({key = "shenFreakyDeck", path = "shenFreakyDeck.png", px = 284, py = 380, atlas_table = "ASSET_ATLAS"}):register()
SMODS.Atlas({key = "shenTempleGames", path = "shenTempleGames.png", px = 71, py = 95, atlas_table = "ASSET_ATLAS"}):register()
SMODS.Atlas({key = "shenVouchers", path = "shenVouchers.png", px = 71, py = 95, atlas_table = "ASSET_ATLAS"}):register()
SMODS.Sound({ key = "freaky_scream", path = "freaky_scream.ogg", pitch = 1, volume = 1})
SMODS.Sound({ key = "temple", path = "temple.wav", pitch = 1, volume = 1})

SMODS.current_mod.optional_features = { retrigger_joker = true }

--local logger = require("debugplus.logger")

G.C.TEMPLE = HEX('00AAAA')

SMODS.Consumable{
        set = 'Voucher',
		key = "balance",
        cost = 10,
        atlas = 'shenVouchers',
        discovered = true,
        unlocked = true,
        available = true,
        pos = { x = 0, y = 0 },
        config = {},
    }

SMODS.Consumable{
        set = 'Voucher',
		key = "power",
        cost = 10,
        atlas = 'shenVouchers',
        discovered = true,
        unlocked = true,
        available = true,
        pos = { x = 1, y = 0 },
        config = {},
    }

SMODS.ConsumableType{
        key = "temple_game",
        primary_colour = G.C.TEMPLE,
        secondary_colour = G.C.TEMPLE,
        collection_rows = { 4, 3 },
        shop_rate = 0,
		loc_txt = {},
        default = "temple_after_egypt",
        can_stack = false,
        can_divide = false,
    }

SMODS.Consumable{
	key = "temple_after_egypt",
	set = "temple_game",
	atlas = 'shenTempleGames',
	pos = { x = 0, y = 0 },
	config = {extra = {cost = 15}},
	discovered = true,
	use = function(self, card, area, copier)
		return
	end,
}

SMODS.Consumable{
	key = "temple_battle_lines",
	set = "temple_game",
	atlas = 'shenTempleGames',
	pos = { x = 1, y = 0 },
	config = {extra = {cost = 15}},
	discovered = true,
	use = function(self, card, area, copier)
		return
	end,
}

SMODS.Consumable{
	key = "temple_bomber_golf",
	set = "temple_game",
	atlas = 'shenTempleGames',
	pos = { x = 2, y = 0 },
	config = {extra = {cost = 15}},
	discovered = true,
	use = function(self, card, area, copier)
		return
	end,
}

SMODS.Consumable{
	key = "temple_eagle_dive",
	set = "temple_game",
	atlas = 'shenTempleGames',
	pos = { x = 3, y = 0 },
	config = {extra = {cost = 15}},
	discovered = true,
	use = function(self, card, area, copier)
		return
	end,
}

SMODS.Consumable{
	key = "temple_strut",
	set = "temple_game",
	atlas = 'shenTempleGames',
	pos = { x = 4, y = 0 },
	config = {extra = {cost = 15}},
	discovered = true,
	use = function(self, card, area, copier)
		return
	end,
}

SMODS.Consumable{
	key = "temple_varoom",
	set = "temple_game",
	atlas = 'shenTempleGames',
	pos = { x = 5, y = 0 },
	config = {extra = {cost = 15}},
	discovered = true,
	use = function(self, card, area, copier)
		return
	end,
}

SMODS.Consumable{
	key = "temple_zone_out",
	set = "temple_game",
	atlas = 'shenTempleGames',
	pos = { x = 6, y = 0 },
	config = {extra = {cost = 15}},
	discovered = true,
	use = function(self, card, area, copier)
		return
	end,
}

SMODS.Back{ --Canio Deck
    name = "Canio Deck",
	key = "caniodeck",
	order = 16,
  unlocked = true,
  discovered = true,
	config = { extra = { odds = 10 } },
  loc_vars = function(self, info_queue, center)
    return {vars = {}}
  end,
	pos = { x = 0, y = 0 },
	atlas = "shenDecks",
  apply = function(self, back)
  end,
  calculate = function(self, back, context)
	if context.discard then
		if SMODS.pseudorandom_probability(self, pseudoseed('caniodeck'), 1, self.config.extra.odds, 'caniodeck') then
			G.E_MANAGER:add_event(Event({
				trigger = 'before',
				delay = 0.33,
				func = function()
					context.other_card:start_dissolve()
					for i = 1, #G.jokers.cards do
						G.jokers.cards[i]:calculate_joker({ remove_playing_cards = true, removed = { context.other_card } })
					end
					return true
				end
			}))
		end
	end
  end
}

SMODS.Back{ --Triboulet Deck
    name = "Triboulet Deck",
	key = "tribouletdeck",  
	order = 17,
  unlocked = true,
  discovered = true,
	config = { },
  loc_vars = function(self, info_queue, center)
    return {vars = {}}
  end,
	pos = { x = 11, y = 0 },
	atlas = "shenDecks",
  apply = function(self, back)
  end,
  calculate = function(self, back, context)
	if (context.cardarea == G.play or context.cardarea == G.hand) and context.repetition then
        return {
            message = localize('k_again_ex'),
            repetitions = 1,
            card = card
        }
	end
  end
}

SMODS.Back{ --Yorick Deck
    name = "Yorick Deck",
	key = "yorickdeck",  
	order = 18,
  unlocked = true,
  discovered = true,
	config = { },
  loc_vars = function(self, info_queue, center)
    return {vars = {}}
  end,
	pos = { x = 13, y = 0 },
	atlas = "shenDecks",
  apply = function(self, back)
	G.GAME.starting_params.yorickdeck = true
  end,
  calculate = function(self, back, context)
  end
}

SMODS.Back{ --Chicot Deck
    name = "Chicot Deck",
	key = "chicotdeck",  
	order = 19,
  unlocked = true,
  discovered = true,
	config = { },
  loc_vars = function(self, info_queue, center)
    return {vars = {}}
  end,
	pos = { x = 2, y = 0 },
	atlas = "shenDecks",
  apply = function(self, back)
	G.GAME.starting_params.chicotdeck = true
  end,
  calculate = function(self, back, context)
  end
}

SMODS.Back{ --Perkeo Deck
    name = "Perkeo Deck",
	key = "perkeodeck",  
	order = 20,
  unlocked = true,
  discovered = true,
	config = { consumables_used = 0 },
  loc_vars = function(self, info_queue, center)
    return {vars = {}}
  end,
	pos = { x = 7, y = 0 },
	atlas = "shenDecks",
  apply = function(self, back)
  end,
  calculate = function(self, back, context)
	if context.using_consumeable then
		self.config.consumables_used = self.config.consumables_used + 1
		if self.config.consumables_used % 3 == 0 then
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            if G.consumeables.config.card_limit > #G.consumeables.cards then
                play_sound('timpani')
                local card = create_card('Tarot_Planet', G.consumeables, nil, nil, nil, nil, context.consumeable.config.center.key, 'perkeodeck')
				card:set_edition({negative = true}, true)
                card:add_to_deck()
                G.consumeables:emplace(card)
            end
            return true end }))
        	delay(0.6)
		elseif self.config.consumables_used % 3 == 2 then
			--local eval = function(back) return self.config.consumables_used % 3 ~= 2 end
		end
	end
  end
}

SMODS.Back{ --Dusk Deck
    name = "Dusk Deck",
	key = "duskdeck",  
	order = 21,
  unlocked = true,
  discovered = true,
	config = { hands = -1 },
  loc_vars = function(self, info_queue, center)
    return {vars = {}}
  end,
	pos = { x = 4, y = 0 },
	atlas = "shenDecks",
  apply = function(self, back)
  end,
  calculate = function(self, back, context)
	if context.cardarea == G.play and context.repetition and G.GAME.current_round.hands_left == 0 then
        return {
            message = localize('k_again_ex'),
            repetitions = 2,
            card = card
        }
	end
  end
}

SMODS.Back{ --Gros Michel Deck
    name = "Gros Michel Deck",
	key = "grosmicheldeck",  
	order = 22,
  unlocked = true,
  discovered = true,
	config = { jokers = {"j_gros_michel"}, extra = { odds = 6 } },
  loc_vars = function(self, info_queue, center)
    return {vars = {localize{type = 'name_text', key = 'j_gros_michel', set = 'Joker'}}}
  end,
	pos = { x = 5, y = 0 },
	atlas = "shenDecks",
  apply = function(self, back)
  end,
  calculate = function(self, back, context)
	if context.end_of_round and not context.repetition and not context.individual then
		local eligible = nil
		for i = 1, #G.jokers.cards do
			if not G.jokers.cards[i].ability.eternal then
				eligible = G.jokers.cards[i]
				break
			end
		end
		if eligible then
			local r_val = nil
			if SMODS.pseudorandom_probability(self, pseudoseed('grosmicheldeck'), 1, self.config.extra.odds, 'grosmicheldeck') then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('tarot1')
						eligible.T.r = -0.2
						eligible:juice_up(0.3, 0.4)
						eligible.states.drag.is = true
						eligible.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(eligible)
								eligible:remove()
								eligible = nil
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
			card_eval_status_text(eligible, 'jokers', nil, nil, nil, r_val)
		end
	end
  end
}

SMODS.Back{ --Hieroglyph Deck
    name = "Hieroglyph Deck",
	key = "hieroglyphdeck",  
	order = 23,
  unlocked = true,
  discovered = true,
	config = { },
  loc_vars = function(self, info_queue, center)
    return {vars = {}}
  end,
	pos = { x = 6, y = 0 },
	atlas = "shenDecks",
  apply = function(self, back)
	G.GAME.win_ante = 10
	ease_ante(-1)
    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - 1
    G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size - 1
  end,
  calculate = function(self, back, context)
  end
}

SMODS.Back{ --Freaky Deck
    name = "Freaky Deck",
	key = "freakydeck",  
	order = 24,
  unlocked = true,
  discovered = true,
	config = { },
  loc_vars = function(self, info_queue, center)
    return {vars = {}}
  end,
	pos = { x = 0, y = 0 },
	atlas = "shenFreakyDeck",
  apply = function(self, back)
	G.GAME.starting_params.freakydeck = true;
  end,
  calculate = function(self, back, context)
	if context.selling_card and context.card.ability.set == 'Joker' then
		play_sound('shen_freaky_scream', pseudorandom('freaker')/5 + .9, 1)
    end
  end
}

SMODS.Back{ --Showman Deck
    name = "Showman Deck",
	key = "showmandeck",  
	order = 25,
  unlocked = true,
  discovered = true,
	config = { },
  loc_vars = function(self, info_queue, center)
    return {vars = {}}
  end,
	pos = { x = 8, y = 0 },
	atlas = "shenDecks",
  apply = function(self, back)
	G.GAME.starting_params.showmandeck = true;
  end,
  calculate = function(self, back, context)
  end
}

SMODS.Back{ --Snakeskin Deck
    name = "Snakeskin Deck",
	key = "snakeskindeck",  
	order = 26,
  unlocked = true,
  discovered = true,
	config = { },
  loc_vars = function(self, info_queue, center)
    return {vars = {}}
  end,
	pos = { x = 9, y = 0 },
	atlas = "shenDecks",
  apply = function(self, back)
  end,
  calculate = function(self, back, context)
	if (G.GAME.current_round.hands_played > 0 or G.GAME.current_round.discards_used > 0) and not G.booster_pack and not G.shop and context.drawing_cards then
		return {
			cards_to_draw = 3
		}
	end
  end
}

SMODS.Back{ --Turtle Bean Deck
    name = "Turtle Bean Deck",
	key = "turtlebeandeck",   
	order = 27,
  unlocked = true,
  discovered = true,
	config = { hand_size = 5 },
  loc_vars = function(self, info_queue, center)
    return {vars = {}}
  end,
	pos = { x = 12, y = 0 },
	atlas = "shenDecks",
  apply = function(self, back)
	G.GAME.starting_params.turtlebeandeck_hand_reduction = 0
  end,
  calculate = function(self, back, context)
	if context.after or context.pre_discard then
		G.hand:change_size(-1)
		G.GAME.starting_params.turtlebeandeck_hand_reduction = G.GAME.starting_params.turtlebeandeck_hand_reduction + 1
	elseif context.round_eval and G.GAME.last_blind and G.GAME.last_blind.boss then
		G.hand:change_size(G.GAME.starting_params.turtlebeandeck_hand_reduction)
		G.GAME.starting_params.turtlebeandeck_hand_reduction = 0
    end
  end
}

SMODS.Back{ --Temple Deck
    name = "Temple Deck",
	key = "templedeck",  
	order = 28,
  unlocked = true,
  discovered = true,
	config = { vouchers = {"c_shen_balance","c_shen_power"} },
  loc_vars = function(self, info_queue, center)
    return {vars = {localize{type = 'name_text', key = 'c_shen_balance', set = 'Voucher'}, localize{type = 'name_text', key = 'c_shen_power', set = 'Voucher'}}}
  end,
	pos = { x = 10, y = 0 },
	atlas = "shenDecks",
  apply = function(self, back)
	G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size - 1
  end,
  calculate = function(self, back, context)
  end
}

SMODS.Back{ --Cartomancer Deck
    name = "Cartomancer Deck",
	key = "cartomancerdeck",  
	order = 29,
  unlocked = true,
  discovered = true,
	config = { },
  loc_vars = function(self, info_queue, center)
    return {vars = {}}
  end,
	pos = { x = 1, y = 0 },
	atlas = "shenDecks",
  apply = function(self, back)
	G.GAME.starting_params.cartomancerdeck_key = nil
  end,
  calculate = function(self, back, context)
	if context.setting_blind then
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            if G.consumeables.config.card_limit > #G.consumeables.cards then
                play_sound('timpani')
                local card
					if G.GAME.starting_params.cartomancerdeck_key == nil then
						card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'cartomancerdeck')
						G.GAME.starting_params.cartomancerdeck_key = card.config.center.key
					else
						card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, G.GAME.starting_params.cartomancerdeck_key, 'cartomancerdeck')
					end
                card:add_to_deck()
                G.consumeables:emplace(card)
            end
            return true end }))
	end
	if context.round_eval and G.GAME.last_blind and G.GAME.last_blind.boss then
		G.GAME.starting_params.cartomancerdeck_key = nil
	end
  end
}

SMODS.Back{ --Diplopia Deck
    name = "Diplopia Deck",
	key = "diplopiadeck",  
	order = 30,
  unlocked = true,
  discovered = true,
	config = { },
  loc_vars = function(self, info_queue, center)
    return {vars = {}}
  end,
	pos = { x = 3, y = 0 },
	atlas = "shenDecks",
  apply = function(self, back)
  end,
  calculate = function(self, back, context)
	if context.round_eval and G.GAME.last_blind and G.GAME.last_blind.boss then
		local jokers = {}
		for i=1, #G.jokers.cards do 
			jokers[#jokers+1] = G.jokers.cards[i]
		end
		if #jokers > 0 then
			local chosen_joker = pseudorandom_element(jokers, pseudoseed('diplopiadeck'))
			if chosen_joker then
				local card = copy_card(chosen_joker, nil, nil, nil, chosen_joker.edition and chosen_joker.edition.negative)
				card:set_edition({ negative = true }, true)
				card.ability.perishable = true
				card.ability.perish_tally = G.GAME.perishable_rounds
				card:add_to_deck()
				G.jokers:emplace(card)
			end
		end
	end
  end
}

local ref_showman = SMODS.showman
function SMODS.showman(card_key)
	if G.GAME.starting_params.showmandeck then
		return true
	end
    return ref_showman(card_key)
end

local ref_discard_cards_from_highlighted = G.FUNCS.discard_cards_from_highlighted
function G.FUNCS.discard_cards_from_highlighted(e, hook)
	if G.GAME.starting_params.yorickdeck then
		local highlighted_count = math.min(#G.hand.highlighted, G.discard.config.card_limit - #G.play.cards)
		if highlighted_count > 0 then 
		    SMODS.calculate_end_of_round_effects({ cardarea = G.hand, end_of_round = true})
		end
	end
	local r_val = ref_discard_cards_from_highlighted(e, hook)
	return r_val
end

local ref_create_card = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
	local r_val = ref_create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
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

local ref_generate_card_ui = generate_card_ui
function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
	local r_val = ref_generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start,
		main_end, card)
	if r_val.card_type ~= nil and r_val.card_type == "Joker" then
		if G.GAME.starting_params.freaky_six_UI == true then
			G.GAME.starting_params.freaky_six_UI = false
			ref_generate_card_ui({ key = 'freaky_six', set = 'Other' }, r_val)
		elseif G.GAME.starting_params.freaky_nine_UI == true then
			G.GAME.starting_params.freaky_nine_UI = false
			ref_generate_card_ui({ key = 'freaky_nine', set = 'Other' }, r_val)
		end
	end
	return r_val
end

local ref_generate_UIBox_ability_table = Card.generate_UIBox_ability_table
function Card:generate_UIBox_ability_table(vars_only, ...)
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
	return ref_generate_UIBox_ability_table(self, vars_only, ...)
end

local ref_calculate_joker = Card.calculate_joker
function Card:calculate_joker(context)
	local r_val = ref_calculate_joker(self, context)
	if self.ability.freaky_six then
		if #G.jokers.cards > 1 then
			local idx = nil
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == self then
					idx = i
					break
				end
			end
			if idx and idx < #G.jokers.cards then
				if G.jokers.cards[idx + 1].ability.freaky_nine and context.joker_main then
					card_eval_status_text(G.jokers.cards[idx], 'jokers', nil, nil, nil, {
						message = "Freaky!"
					})
					local xm = 1.5
					if G.jokers.cards[idx].ability and G.jokers.cards[idx].ability.extra and G.jokers.cards[idx].ability.extra.x_mult then
						xm = xm * G.jokers.cards[idx].ability.extra.x_mult
					end
					return {
						x_mult = xm
					}
				end
			end
		end
	end
	if G.GAME.starting_params.chicotdeck == true then
		if context.retrigger_joker_check and context.other_card == self and G.GAME.blind.boss and G.jokers.cards and self == G.jokers.cards[#G.jokers.cards] then
            return {
                    message = localize("k_again_ex"),
                    repetitions = 1,
                    message_card = self,
                    was_blueprinted = context.blueprint,
                }
        end
	end
	return r_val
end