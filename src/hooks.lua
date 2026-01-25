local foil_ref = G.P_CENTERS['e_foil'].loc_vars --this is extremely silly
local holo_ref = G.P_CENTERS['e_holo'].loc_vars
local polychrome_ref = G.P_CENTERS['e_polychrome'].loc_vars
G.P_CENTERS['e_foil'].loc_vars = function(self, info_queue, card)
    if G.GAME.starting_params.midasdeck then
        return { key = "e_midas_foil", vars = { card.edition.dollars or 2 } }
    else
        return foil_ref(self, info_queue, card)
    end
end
G.P_CENTERS['e_holo'].loc_vars = function(self, info_queue, card)
    if G.GAME.starting_params.midasdeck then
        return { key = "e_midas_holo", vars = { card.edition.dollars or 4 } }
    else
        return holo_ref(self, info_queue, card)
    end
end
G.P_CENTERS['e_polychrome'].loc_vars = function(self, info_queue, card)
    if G.GAME.starting_params.midasdeck then
        return { key = "e_midas_polychrome", vars = { card.edition.dollars or 8 } }
    else
        return polychrome_ref(self, info_queue, card)
    end
end

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
        for i = 1, #G.hand.highlighted do
            for j = 1, #G.hand.cards do
                if G.hand.cards[j] == G.hand.highlighted[i] then
                    G.hand.cards[j].trigger_yorick_effect_card = true
                end
            end
        end
        SMODS.calculate_end_of_round_effects({ trigger_yorick_effect = true, cardarea = G.hand, end_of_round = true })
        for j = 1, #G.hand.cards do
            if G.hand.cards[j].trigger_yorick_effect_card == true then
                G.hand.cards[j].trigger_yorick_effect_card = nil
            end
        end
    end
    local r_val = ref_discard_cards_from_highlighted(e, hook)
    return r_val
end

local ref_buy_from_shop = G.FUNCS.buy_from_shop
function G.FUNCS.buy_from_shop(e)
    local b = ref_buy_from_shop(e)
    if G.GAME.starting_params.treasuredeck and b ~= false then
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.11,
            func = function()
                local new_shop_card = create_card_for_shop(G.shop_jokers)
                G.shop_jokers:emplace(new_shop_card)
                new_shop_card:juice_up()
                G.shop_jokers.T.w = math.min(#G.shop_jokers.cards * 1.02 * G.CARD_W, 4.08 * G.CARD_W)
                G.shop:recalculate()
                return true
            end
        }))
    end
    return b
end

local ref_play_cards_from_highlighted = G.FUNCS.play_cards_from_highlighted
function G.FUNCS.play_cards_from_highlighted(e)
    if (G.GAME.hands_played + 1) % 9 == 0 and G.GAME.starting_params.cloud9sleeve then
        G.hand:change_size(1)
    end
    local r_val = ref_play_cards_from_highlighted(e)
    return r_val
end

local ref_eval_card = eval_card
function eval_card(card, context)
    if G.GAME.starting_params.yorickdeck and context.trigger_yorick_effect then
        if (card.trigger_yorick_effect_card == nil and card.playing_card)
            or
            (context.other_card and -- https://www.youtube.com/watch?v=9dOEUErDOG8&
                context.other_card.playing_card and
                context.other_card.trigger_yorick_effect_card == nil)
        then
            return {}, {}
        end
    end
    return ref_eval_card(card, context)
end

local ref_ease_dollars = ease_dollars
function ease_dollars(mod, instant)
    if G.GAME.starting_params.vagabonddeck then
        if G.GAME.dollars + mod >= 0 then
            if not G.GAME.starting_params.vagabonddeck_positive then
                G.GAME.starting_params.vagabonddeck_positive = true
                G.GAME.bankrupt_at = G.GAME.bankrupt_at - 1e200
            end
        else
            if G.GAME.starting_params.vagabonddeck_positive then
                G.GAME.starting_params.vagabonddeck_positive = false
                G.GAME.bankrupt_at = G.GAME.bankrupt_at + 1e200
            end
        end
    end
    local r_val = ref_ease_dollars(mod, instant)
    return r_val
end

local ref_use_card = G.FUNCS.use_card
G.FUNCS.use_card = function(e, mute, nosave)
    if G.GAME.starting_params.campfiredeck and pseudorandom('campfiredeck', 1, 4) == 4 then
        local card = e.config.ref_table
        if card.ability.consumeable then
            local prev_state = G.STATE
            if (prev_state == G.STATES.TAROT_PACK or prev_state == G.STATES.PLANET_PACK or
                    prev_state == G.STATES.SPECTRAL_PACK or prev_state == G.STATES.STANDARD_PACK or
                    prev_state == G.STATES.SMODS_BOOSTER_OPENED or
                    prev_state == G.STATES.BUFFOON_PACK) and G.booster_pack then
                if card.area == G.pack_cards then
                    if G.GAME.pack_choices and G.GAME.pack_choices > 1 then
                        if G.booster_pack.alignment.offset.py then
                            G.booster_pack.alignment.offset.y = G.booster_pack.alignment.offset.py
                            G.booster_pack.alignment.offset.py = nil
                        end
                        G.GAME.pack_choices = G.GAME.pack_choices - 1
                    else
                        G.CONTROLLER.interrupt.focus = true
                        G.FUNCS.end_consumeable(nil, .2)
                    end
                end
            end
            return G.FUNCS.sell_card(e)
        end
    end
    return ref_use_card(e, mute, nosave)
end

local ref_reroll_shop = G.FUNCS.reroll_shop
G.FUNCS.reroll_shop = function(e)
    if G.GAME.starting_params.loyaltydeck then
        if (G.GAME.round_scores.times_rerolled.amt + 1) % 3 == 0 then
            G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + 1
        end
    end
    return ref_reroll_shop(e)
end

local ref_calculate_reroll_cost = calculate_reroll_cost
function calculate_reroll_cost(skip_increment)
    local r_val = ref_calculate_reroll_cost(skip_increment)
    if G.GAME.starting_params.loyaltydeck then
        if (G.GAME.round_scores.times_rerolled.amt + 1) % 3 == 0 then
            G.GAME.current_round.reroll_cost = 0
        end
    end
    if G.GAME.starting_params.steamsleeve then
        if G.GAME.current_round.reroll_cost > 0 then
            G.GAME.current_round.reroll_cost = math.ceil(G.GAME.current_round.reroll_cost / 2)
        end
    end
    return r_val
end

local ref_change_size = CardArea.change_size
function CardArea:change_size(delta)
    if G.GAME.starting_params.cloud9deck and self == G.hand then
        G.GAME.starting_params.hand_delta = G.GAME.starting_params.hand_delta + delta
        return
    end
    return ref_change_size(self, delta)
end

local ref_emplace = CardArea.emplace
function CardArea.emplace(self, card, location, stay_flipped)
    if G.GAME.starting_params.hydrogenbombdeck and self == G.play then
        if (card.facing == "back") then
            card.the_bomb = true
        end
    end
    if G.GAME.starting_params.giftdeck and self == G.shop_jokers and card.ability.set == 'Joker' then
        local p_key = 'p_buffoon_normal_1'
        if card:is_rarity("Common") then
            if pseudorandom('giftdeck', 1, 2) == 2 then
                p_key = 'p_buffoon_normal_2'
            end
        elseif card:is_rarity("Uncommon") then
            p_key = 'p_buffoon_jumbo_1'
        elseif card:is_rarity("Rare") then
            p_key = 'p_buffoon_mega_1'
        end
        card:start_dissolve(nil, true, .000001, true)
        local newcard = create_card('Booster', G.shop_jokers, nil, nil, nil, nil, p_key)
        card = newcard
        create_shop_card_ui(card, card.ability.set, self)
    end
    if G.GAME.starting_params.giftsleeve and self == G.shop_jokers then
        if card.ability.set == 'Tarot' then
            local t = pseudorandom('giftsleeve', 1, 4)
            local t_key = 'p_arcana_normal_' .. tostring(t)
            card:start_dissolve(nil, true, .000001, true)
            local newcard = create_card('Booster', G.shop_jokers, nil, nil, nil, nil, t_key)
            card = newcard
            create_shop_card_ui(card, card.ability.set, self)
        elseif card.ability.set == 'Planet' then
            local p = pseudorandom('giftsleeve', 1, 4)
            local p_key = 'p_celestial_normal_' .. tostring(p)
            card:start_dissolve(nil, true, .000001, true)
            local newcard = create_card('Booster', G.shop_jokers, nil, nil, nil, nil, p_key)
            card = newcard
            create_shop_card_ui(card, card.ability.set, self)
        end
    end
    ref_emplace(self, card, location, stay_flipped)
end

local ref_card_open = Card.open
function Card:open()
    if G.GAME.starting_params.showmansleeve then
        G.GAME.starting_params.first_card_in_pack = true
    end
    return ref_card_open(self)
end

SMODS.Booster:take_ownership_by_kind('Standard', {
    create_card = function(self, card, i)
        if not G.GAME.starting_params.first_card_in_pack then
            local _edition = poll_edition('standard_edition' .. G.GAME.round_resets.ante, 2, true) -- default behavior
            local _seal = SMODS.poll_seal({ mod = 10 })
            return {
                set = (pseudorandom(pseudoseed('stdset' .. G.GAME.round_resets.ante)) > 0.6) and "Enhanced" or
                    "Base",
                edition = _edition,
                seal = _seal,
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append =
                "sta"
            }
        else
            return {
                set = "Base",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append =
                "sta"
            }       --don't get random seal/edition when copying for the showmman sleeve
        end
    end,
}, true)

local ref_skip_blind = G.FUNCS.skip_blind
function G.FUNCS.skip_blind(e)
    if G.GAME.starting_params.throwbackdeck then --if done in skip_blind context packs bug out. it works here i'll leave it here haha
        if G.GAME.starting_params.throwback_shop_available then
            G.GAME.starting_params.throwback_shop_available = false
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.2,
                func = function()
                    G.blind_prompt_box.alignment.offset.y = -10
                    G.blind_select.alignment.offset.y = 40
                    G.blind_select.alignment.offset.x = 0
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({     -- from G.FUNCS.cash_out
                trigger = 'immediate',
                func = function()
                    if G.round_eval then
                        G.round_eval:remove()
                        G.round_eval = nil
                    end
                    G.GAME.current_round.jokers_purchased = 0
                    G.GAME.current_round.discards_left = math.max(0,
                        G.GAME.round_resets.discards + G.GAME.round_bonus.discards)
                    G.GAME.current_round.hands_left = (math.max(1, G.GAME.round_resets.hands + G.GAME.round_bonus.next_hands))
                    G.STATE = G.STATES.SHOP
                    G.GAME.shop_free = nil
                    G.GAME.shop_d6ed = nil

                    G.blind_select:remove() -- from somewhere else
                    G.blind_prompt_box:remove()
                    G.blind_select = nil

                    G.STATE_COMPLETE = false
                    return true
                end
            }))
        end
    end
    return ref_skip_blind(e)
end

local ref_create_card = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    if G.GAME.starting_params.showmansleeve and area == G.pack_cards then
        if G.GAME.starting_params.first_card_in_pack then
            G.GAME.starting_params.first_card_in_pack = false
            local options = {}
            for q = 1, #G.jokers.cards do
                if G.jokers.cards[q].ability.set == _type then
                    table.insert(options, G.jokers.cards[q])
                end
            end
            for q = 1, #G.consumeables.cards do
                if G.consumeables.cards[q].ability.set == _type then
                    table.insert(options, G.consumeables.cards[q])
                end
            end
            if _type == "Default" or _type == "Enhanced" or _type == "Base" then
                for q = 1, #G.playing_cards do
                    table.insert(options, G.playing_cards[q])
                end
            end

            if #options > 0 then
                local f_created = pseudorandom_element(options, pseudoseed('showmansleeve'))
                local card
                if f_created.ability.set == "Default" or f_created.ability.set == "Enhanced" or f_created.ability.set == "Base" then
                    card = copy_card(f_created, nil, nil, G.playing_card, nil)
                else
                    card = copy_card(f_created, nil, nil, nil, nil)
                end
                return card
            end
        end
    end
    local r_val = ref_create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    if G.GAME.starting_params.freakydeck then
        if _type == "Joker" then
            if G.GAME.starting_params.freakysleeve then
                local n = pseudorandom('freaky', 0, 9)
                r_val.ability.freaky_effect = n
            else
                if pseudorandom('freaky') < 1 / 2 then
                    r_val.ability.freaky_effect = 6
                else
                    r_val.ability.freaky_effect = 9
                end
            end
        end
    end
    if G.GAME.starting_params.perkeodeck then
        if _type == 'Tarot' or _type == 'Planet' or _type == 'Spectral' or _type == 'Tarot_Planet' then
            local eval = function(card) return (G.GAME.starting_params.consumables_used + 1) % 4 == 0 end
            juice_card_until(r_val, eval, true)
        end
    end
    if G.GAME.starting_params.partydeck then
        if _type == "Joker" then
            if r_val.edition == nil then
                if pseudorandom('partydeck_negative', 1, 6) == 6 then
                    r_val:set_edition({ negative = true }, true)
                    r_val:set_eternal(false)
                end
            elseif r_val.edition.negative then
                r_val:set_eternal(false)
            end
        end
    end
    return r_val
end

function party_deck_check(new_card)
    local negatives = {}
    local polychromes = {}
    if new_card and new_card.edition then
        if new_card.edition.negative then
            negatives[#negatives + 1] = new_card
        elseif new_card.edition.polychrome and G.GAME.starting_params.partysleeve then
            polychromes[#polychromes + 1] = new_card
        end
    end
    if G.jokers and G.jokers.cards then
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].edition then
                if G.jokers.cards[i].edition.negative then
                    negatives[#negatives + 1] = G.jokers.cards[i]
                elseif G.jokers.cards[i].edition.polychrome and G.GAME.starting_params.partysleeve then
                    polychromes[#polychromes + 1] = G.jokers.cards[i]
                end
            end
        end
    end
    local limit = #polychromes + 2
    pseudoshuffle(negatives, pseudoseed('partydeck!!!'))
    local sliced = {}
    for i = limit + 1, #negatives do
        if negatives[i] then
            table.insert(sliced, negatives[i])
        end
    end
    if #sliced > 0 then
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.75,
            func = function()
                for k, v in pairs(sliced) do
                    v.getting_sliced = true
                    v:start_dissolve(nil)
                end
                return true
            end
        }))
    end
end

local ref_card_add_to_deck = Card.add_to_deck
function Card:add_to_deck(from_debuff)
    local r_val = ref_card_add_to_deck(self, from_debuff)
    if G.GAME.starting_params.cartomancersleeve then
        if self.ability.set == 'Tarot' then
            if SMODS.pseudorandom_probability(self, pseudoseed('cartomancersleeve'), 1, 3, 'cartomancersleeve') then
                self:set_edition({ negative = true }, true)
            end
        end
    end
    if G.GAME.starting_params.partydeck then
        party_deck_check(self)
    end
    return r_val
end

local ref_card_set_cost = Card.set_cost
function Card:set_cost()
    local r_val = ref_card_set_cost(self)
    if G.GAME.starting_params.campfiredeck and self.ability.consumeable then
        self.cost = 0
    end
    if G.GAME.starting_params.campfiresleeve and self.ability.set == 'Joker' then
        self.cost = 0
    end
    if G.GAME.starting_params.loyaltysleeve and (G.GAME.starting_params.total_purchases + 1) % 3 == 0 then
        self.cost = 0
    end
    return r_val
end

local freak_keys = {
    ["1"] = 'freaky_one',
    ["2"] = 'freaky_two',
    ["3"] = 'freaky_three',
    ["4"] = 'freaky_four',
    ["5"] = 'freaky_five',
    ["6"] = 'freaky_six',
    ["7"] = 'freaky_seven',
    ["8"] = 'freaky_eight',
    ["9"] = 'freaky_nine',
    ["0"] = 'freaky_zero',
}

local ref_calculate_individual_effect = SMODS.calculate_individual_effect
function SMODS.calculate_individual_effect(effect, scored_card, key, amount, from_edition)
    if G.GAME.starting_params.midassleeve and key == 'chips' and not effect.card then
        key = 'dollars'
        amount = 1
    end
    return ref_calculate_individual_effect(effect, scored_card, key, amount, from_edition)
end

local ref_set_edition = Card.set_edition
function Card:set_edition(edition, immediate, silent, delay)
    local r_val = ref_set_edition(self, edition, immediate, silent, delay)
    if G.GAME.starting_params.partydeck then
        if self.ability.set == 'Joker' then
            party_deck_check()
        end
    end
    if G.GAME.starting_params.midasdeck and self.edition then
        if self.edition.type == 'holo' then
            self.edition.mult = nil
            self.edition.dollars = 4
        elseif self.edition.type == 'foil' then
            self.edition.chips = nil
            self.edition.dollars = 2
        elseif self.edition.type == 'polychrome' then
            self.edition.x_mult = nil
            self.edition.dollars = 8
        end
    end
    return r_val
end

local ref_card_from_control = card_from_control
function card_from_control(control)
    if G.GAME.starting_params.diplopiadeck then
        ref_card_from_control(control)
    end
    return ref_card_from_control(control)
end

local ref_generate_card_ui = generate_card_ui
function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
    local r_val = ref_generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start,
        main_end, card)
    if r_val.card_type ~= nil and r_val.card_type == "Joker" then
        if G.GAME.starting_params.freaky_ui then
            local k = freak_keys[G.GAME.starting_params.freaky_ui]
            G.GAME.starting_params.freaky_ui = nil
            ref_generate_card_ui({ key = k, set = 'Other' }, r_val)
        end
    end
    return r_val
end

local ref_generate_UIBox_ability_table = Card.generate_UIBox_ability_table
function Card:generate_UIBox_ability_table(vars_only, ...)
    if self.ability.freaky_effect then
        G.GAME.starting_params.freaky_ui = tostring(self.ability.freaky_effect)
    else
        G.GAME.starting_params.freaky_ui = nil
    end
    return ref_generate_UIBox_ability_table(self, vars_only, ...)
end

local ref_calculate_joker = Card.calculate_joker
function Card:calculate_joker(context)
    local r_val = ref_calculate_joker(self, context)
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

local ref_update = Card.update
function Card:update(dt)
    if G.GAME.starting_params.coughingbabysleeve == true then
        if G.jokers and #G.jokers.cards > 1 and self == G.jokers.cards[2] then
            if G.GAME.last_baby_debuff and G.GAME.last_baby_debuff ~= self then
                SMODS.debuff_card(G.GAME.last_baby_debuff, false, "baby")
            end
            G.GAME.last_baby_debuff = self
            SMODS.debuff_card(self, true, "baby")
        end
    end
    return ref_update(self, dt)
end

local ref_debuff_hand = Blind.debuff_hand
function Blind:debuff_hand(cards, hand, handname, check)
    if G.GAME.starting_params.vagabondsleeve and not check then
        if G.GAME.hands[handname].level > 1 then
            G.GAME.levels_lost_this_round = G.GAME.levels_lost_this_round + (G.GAME.hands[handname].level - 1)
            level_up_hand(self.children.animatedSprite, handname, nil, -(G.GAME.hands[handname].level - 1))
            self:wiggle()
        end
    end
    local r_val = ref_debuff_hand(self, cards, hand, handname, check)
    return r_val
end

local ref_back_trigger_effect = Back.trigger_effect
function Back:trigger_effect(args)
    local o = { ref_back_trigger_effect(self, args) }

    if G.GAME.temple_score_balance and args.context == 'final_scoring_step' then
        local tot = args.chips + args.mult
        args.chips = math.floor(tot * .64)
        args.mult = math.floor(tot * .48)
        update_hand_text({ delay = 0 }, { mult = args.mult, chips = args.chips })

        G.E_MANAGER:add_event(Event({
            func = (function()
                local text = localize('k_balanced')
                play_sound('shen_temple', 1, 1)
                ease_colour(G.C.UI_CHIPS, G.C.CYAN)
                ease_colour(G.C.UI_MULT, G.C.CYAN)
                attention_text({
                    scale = 1.4, text = text, hold = 2, align = 'cm', offset = { x = 0, y = -2.7 }, major = G.play
                })
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    blockable = false,
                    blocking = false,
                    delay = 4.3,
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
                    delay = 6.3,
                    func = (function()
                        G.C.UI_CHIPS[1], G.C.UI_CHIPS[2], G.C.UI_CHIPS[3], G.C.UI_CHIPS[4] = G.C.BLUE[1], G.C.BLUE[2],
                            G.C.BLUE[3], G.C.BLUE[4]
                        G.C.UI_MULT[1], G.C.UI_MULT[2], G.C.UI_MULT[3], G.C.UI_MULT[4] = G.C.RED[1], G.C.RED[2],
                            G.C.RED[3], G.C.RED[4]
                        return true
                    end)
                }))
                return true
            end)
        }))

        delay(0.6)
        return args.chips, args.mult
    end

    return unpack(o)
end
