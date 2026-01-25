local function unique_effect(sleeve)
    return sleeve.get_current_deck_key() == "b_" .. string.sub(sleeve.key .. "deck", 8)
end

local function card_sleeve_key(q)
    local key
    if unique_effect(q) then
        key = q.key .. "_alt"
    else
        key = q.key
    end
    return key
end

local function in_sedma_deck(rank)
    return not (rank == '2' or rank == '3' or rank == '4' or rank == '5' or rank == '6')
end

function get_random_hand(ignore, seed, allowhidden)
    --From JenLib's get_random_hand
    local chosen_hand
    ignore = ignore or {}
    seed = seed or "randomhand"
    if type(ignore) ~= "table" then
        ignore = { ignore }
    end
    while true do
        chosen_hand = pseudorandom_element(G.handlist, pseudoseed(seed))
        if G.GAME.hands[chosen_hand].visible or allowhidden then
            local safe = true
            for _, v in pairs(ignore) do
                if v == chosen_hand then
                    safe = false
                end
            end
            if safe then
                break
            end
        end
    end
    return chosen_hand
end

if CardSleeves then
    local ref_carddsleeves_apply = CardSleeves.Sleeve.apply
    function CardSleeves.Sleeve:apply(sleeve)
        ref_carddsleeves_apply(self, sleeve)
        if self.config.jokers then
            if not self.config.consumables then --hack
                delay(0.4)
            end
            G.E_MANAGER:add_event(Event({
                func = function()
                    for _, joker_key in pairs(self.config.jokers) do
                        local card = SMODS.create_card { key = joker_key, area = G.jokers }
                        card:add_to_deck()
                        G.jokers:emplace(card)
                        card:start_materialize()
                    end
                    return true
                end
            }))
        end
    end

    CardSleeves.Sleeve {
        key = "canio",
        name = "Canio Sleeve",
        atlas = "shenSleeves",
        pos = { x = 0, y = 0 },
        config = { extra = { odds = 7, cards_removed = 0, extra_hand_size = 0 } },
        unlocked = false,
        unlock_condition = { deck = "b_shen_caniodeck", stake = "stake_black" },
        loc_vars = function(self) return { key = card_sleeve_key(self) } end,
        apply = function(self, sleeve) end,
        calculate = function(self, sleeve, context)
            if unique_effect(self) then
                if context.cards_destroyed then
                    self.config.extra.cards_removed = self.config.extra.cards_removed + #context.glass_shattered
                    local new_extra_hand_size = math.floor(self.config.extra.cards_removed / 5)
                    if new_extra_hand_size ~= self.config.extra.extra_hand_size then
                        G.hand:change_size(new_extra_hand_size - self.config.extra.extra_hand_size)
                        self.config.extra.extra_hand_size = new_extra_hand_size
                    end
                end
                if context.remove_playing_cards then
                    self.config.extra.cards_removed = self.config.extra.cards_removed + #context.removed
                    local new_extra_hand_size = math.floor(self.config.extra.cards_removed / 5)
                    if new_extra_hand_size ~= self.config.extra.extra_hand_size then
                        G.hand:change_size(new_extra_hand_size - self.config.extra.extra_hand_size)
                        self.config.extra.extra_hand_size = new_extra_hand_size
                    end
                end
            else
                return canio_deck.calculate(self, sleeve, context)
            end
        end
    }
    CardSleeves.Sleeve { --uses modified Abandoned Sleeve code to prevent jacks only
        key = "triboulet",
        name = "Triboulet Sleeve",
        atlas = "shenSleeves",
        pos = { x = 2, y = 0 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_shen_tribouletdeck", stake = "stake_black" },
        loc_vars = function(self) return { key = card_sleeve_key(self) } end,
        apply = function(self, sleeve)
            if unique_effect(self) then
                G.starting_deck_size = 52
                G.GAME.starting_params.no_faces = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local suits = { 'S', 'H', 'D', 'C' }
                        for _, v in pairs(suits) do
                            local k_card = copy_card(G.playing_cards[1], nil, 1, G.playing_card)
                            k_card:set_base(G.P_CARDS[v .. "_" .. "K"])
                            G.deck:emplace(k_card)
                            G.playing_cards[#G.playing_cards + 1] = k_card

                            local q_card = copy_card(G.playing_cards[1], nil, 1, G.playing_card)
                            q_card:set_base(G.P_CARDS[v .. "_" .. "Q"])
                            G.deck:emplace(q_card)
                            G.playing_cards[#G.playing_cards + 1] = q_card

                            local j_card = copy_card(G.playing_cards[1], nil, 1, G.playing_card)
                            if pseudorandom("triboulet_sleeve_unique", 1, 2) == 1 then
                                j_card:set_base(G.P_CARDS[v .. "_" .. "Q"])
                            else
                                j_card:set_base(G.P_CARDS[v .. "_" .. "K"])
                            end
                            G.deck:emplace(j_card)
                            G.playing_cards[#G.playing_cards + 1] = j_card
                        end
                        return true
                    end
                }))

                G.GAME.starting_params.tribouletsleeve = true
                self.config.prevent_jacks = true
                if self.allowed_card_centers == nil then
                    self.allowed_card_centers = {}
                    self.skip_trigger_effect = true
                    for _, card_center in pairs(G.P_CARDS) do
                        if card_center.value ~= 'Jack' then
                            self.allowed_card_centers[#self.allowed_card_centers + 1] = card_center
                        end
                    end
                    self.get_rank_after_10 = function() return "Q" end
                    self.skip_trigger_effect = false
                end
            end
        end,
        calculate = function(self, sleeve, context)
            if not unique_effect(self) then
                return triboulet_deck.calculate(self, sleeve, context)
            else
                if sleeve.skip_trigger_effect then
                    return
                end
                if sleeve.allowed_card_centers == nil then
                    sleeve:apply(sleeve)
                end

                -- handle Strength and Ouija
                local card = context.card
                local is_playing_card = card and (card.ability.set == "Default" or card.ability.set == "Enhanced") and
                    card.config.card_key
                if context.before_use_consumable and card then
                    if card.ability.name == 'Strength' then
                        sleeve.in_strength = true
                    elseif card.ability.name == "Ouija" then
                        sleeve.in_ouija = true
                    end
                    if sleeve.in_strength and sleeve.in_ouija then
                        print_warning("cannot be in both strength and ouija!")
                    end
                elseif context.after_use_consumable then
                    sleeve.in_strength = nil
                    sleeve.in_ouija = nil
                    sleeve.ouija_rank = nil
                elseif (context.create_card or context.modify_playing_card) and card and is_playing_card then
                    if SMODS.Ranks[card.base.value] and SMODS.Ranks[card.base.value].shorthand == 'J' then
                        local initial = G.GAME.blind == nil or context.create_card
                        if sleeve.in_strength then
                            local base_key = SMODS.Suits[card.base.suit].card_key ..
                                "_" .. sleeve.get_rank_after_10()
                            card:set_base(G.P_CARDS[base_key], initial)
                        elseif sleeve.in_ouija then
                            if sleeve.ouija_rank == nil then
                                local random_base = pseudorandom_element(sleeve.allowed_card_centers,
                                    pseudoseed("tribouletsleeve"))
                                local card_instance = Card(0, 0, 0, 0, random_base, G.P_CENTERS.c_base)
                                sleeve.ouija_rank = SMODS.Ranks[card_instance.base.value]
                                card_instance:remove()
                            end
                            local base_key = SMODS.Suits[card.base.suit].card_key ..
                                "_" .. sleeve.ouija_rank.card_key
                            card:set_base(G.P_CARDS[base_key], initial)
                        else
                            local random_base = pseudorandom_element(sleeve.allowed_card_centers,
                                pseudoseed("tribouletsleeve"))
                            card:set_base(random_base, initial)
                        end
                    end
                end
            end
        end
    }
    CardSleeves.Sleeve {
        key = "yorick",
        name = "Yorick Sleeve",
        atlas = "shenSleeves",
        pos = { x = 3, y = 0 },
        config = { hand_counter = 0 },
        unlocked = false,
        unlock_condition = { deck = "b_shen_yorickdeck", stake = "stake_black" },
        loc_vars = function(self) return { key = card_sleeve_key(self) } end,
        apply = function(self, sleeve)
            if not unique_effect(self) then
                return yorick_deck.apply(self, sleeve)
            end
        end,
        calculate = function(self, sleeve, context)
            if unique_effect(self) then
                if context.before then
                    self.config.hand_counter = self.config.hand_counter + 1
                    if self.config.hand_counter % 2 == 0 then
                        ease_discard(1)
                    end
                end
                if context.end_of_round and not context.repetition and not context.individual then
                    self.config.hand_counter = 0
                end
            end
        end
    }
    CardSleeves.Sleeve {
        key = "chicot",
        name = "Chicot Sleeve",
        atlas = "shenSleeves",
        pos = { x = 4, y = 0 },
        config = { extra = { saved = false } },
        unlocked = false,
        unlock_condition = { deck = "b_shen_chicotdeck", stake = "stake_black" },
        loc_vars = function(self) return { key = card_sleeve_key(self) } end,
        apply = function(self, sleeve)
            if unique_effect(self) then

            else
                return chicot_deck.apply(self, sleeve)
            end
        end,
        calculate = function(self, sleeve, context)
            if unique_effect(self) then
                if context.game_over and self.config.extra.saved == false then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.hand_text_area.blind_chips:juice_up()
                            G.hand_text_area.game_chips:juice_up()
                            play_sound('tarot1')
                            return true
                        end
                    }))
                    self.config.extra.saved = true
                    return {
                        message = localize('k_saved_chicot'),
                        saved = 'k_saved_chicot',
                        colour = G.C.RED
                    }
                end
            end
        end
    }
    CardSleeves.Sleeve {
        key = "perkeo",
        name = "Perkeo Sleeve",
        atlas = "shenSleeves",
        pos = { x = 0, y = 1 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_shen_perkeodeck", stake = "stake_black" },
        loc_vars = function(self) return { key = card_sleeve_key(self) } end,
        apply = function(self, sleeve)
            if unique_effect(self) then
                G.GAME.starting_params.perkeofixed = true
            else
                return perkeo_deck.apply(self, sleeve)
            end
        end,
        calculate = function(self, sleeve, context)
            if unique_effect(self) then
            else
                return perkeo_deck.calculate(self, sleeve, context)
            end
        end
    }
    CardSleeves.Sleeve {
        key = "dusk",
        name = "Dusk Sleeve",
        atlas = "shenSleeves",
        pos = { x = 1, y = 1 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_shen_duskdeck", stake = "stake_black" },
        loc_vars = function(self)
            self.config = { hands = -1 }
            return { key = card_sleeve_key(self) }
        end,
        calculate = function(self, sleeve, context)
            if unique_effect(self) then
                if context.cardarea == G.play and context.repetition then
                    return {
                        message = localize('k_again_ex'),
                        repetitions = 1,
                        card = card
                    }
                end
            else
                return dusk_deck.calculate(self, sleeve, context)
            end
        end
    }
    CardSleeves.Sleeve {
        key = "grosmichel",
        name = "Gros Michel Sleeve",
        atlas = "shenSleeves",
        pos = { x = 2, y = 1 },
        unlocked = false,
        unlock_condition = { deck = "b_shen_grosmicheldeck", stake = "stake_black" },
        loc_vars = function(self)
            if unique_effect(self) then
                G.GAME.starting_params.grosmichelsleeve = true
                self.config = { joker_slot = 1 }
            else
                self.config = { jokers = { "j_gros_michel" }, extra = { odds = 6 } }
            end
            return { key = card_sleeve_key(self), vars = { localize { type = 'name_text', key = 'j_gros_michel', set = 'Joker' } } }
        end,
        calculate = function(self, sleeve, context)
            if unique_effect(self) then
            else
                return grosmichel_deck.calculate(self, sleeve, context)
            end
        end
    }
    CardSleeves.Sleeve {
        key = "hieroglyph",
        name = "Hieroglyph Sleeve",
        atlas = "shenSleeves",
        pos = { x = 3, y = 1 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_shen_hieroglyphdeck", stake = "stake_black" },
        loc_vars = function(self)
            return { key = card_sleeve_key(self) }
        end,
        apply = function(self, sleeve)
            if unique_effect(self) then

            else
                G.GAME.win_ante = 10 -- taken event from ease_ante because the smod ease_ante override leads to a crash...
                G.E_MANAGER:add_event(Event({ -- maybe it doesn't anymore, todo check if it still crashes
                    trigger = 'immediate',
                    func = function()
                        local ante_UI = G.hand_text_area.ante
                        local col = G.C.RED
                        G.GAME.round_resets.ante = G.GAME.round_resets.ante - 1
                        ante_UI.config.object:update()
                        G.HUD:recalculate()
                        attention_text({
                            text = '-1',
                            scale = 1,
                            hold = 0.7,
                            cover = ante_UI.parent,
                            cover_colour = col,
                            align = 'cm',
                        })
                        --Play a chip sound
                        play_sound('highlight2', 0.685, 0.2)
                        play_sound('generic1')
                        return true
                    end
                }))
                G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
                G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - 1
            end
        end,
        calculate = function(self, sleeve, context)
            if unique_effect(self) then
                if context.end_of_round and not context.repetition and not context.individual and G.GAME.blind.boss then
                    G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling + 0.2
                end
            end
        end
    }
    CardSleeves.Sleeve {
        key = "freaky",
        name = "Freaky Sleeve",
        atlas = "shenFreakySleeve",
        pos = { x = 0, y = 0 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_shen_freakydeck", stake = "stake_black" },
        loc_vars = function(self) return { key = card_sleeve_key(self) } end,
        apply = function(self, sleeve)
            if unique_effect(self) then
                G.GAME.starting_params.freakysleeve = true
            else
                return freaky_deck.apply(self, sleeve)
            end
        end,
        calculate = function(self, sleeve, context)
            if not unique_effect(self) then
                return freaky_deck.calculate(self, sleeve, context)
            end
        end
    }
    CardSleeves.Sleeve {
        key = "showman",
        name = "Showman Sleeve",
        atlas = "shenSleeves",
        pos = { x = 0, y = 2 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_shen_showmandeck", stake = "stake_black" },
        loc_vars = function(self) return { key = card_sleeve_key(self) } end,
        apply = function(self, sleeve)
            if unique_effect(self) then
                G.GAME.starting_params.showmansleeve = true
            else
                return showman_deck.apply(self, sleeve)
            end
        end,
        calculate = function(self, sleeve, context) end
    }
    CardSleeves.Sleeve {
        key = "snakeskin",
        name = "Snakeskin Sleeve",
        atlas = "shenSleeves",
        pos = { x = 1, y = 2 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_shen_snakeskindeck", stake = "stake_black" },
        loc_vars = function(self) return { key = card_sleeve_key(self) } end,
        apply = function(self, sleeve)
            if unique_effect(self) then
                G.GAME.starting_params.snakeskinsleeve = true
                G.GAME.starting_params.temp_shop_slots = 0
            end
        end,
        calculate = function(self, sleeve, context)
            if unique_effect(self) then
                if context.ending_shop then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            change_shop_size(0)
                            G.GAME.starting_params.temp_shop_slots = 0
                            return true
                        end
                    }))
                end
            else
                return snakeskin_deck.calculate(self, sleeve, context)
            end
        end
    }
    CardSleeves.Sleeve {
        key = "turtlebean",
        name = "Turtle Bean Sleeve",
        atlas = "shenSleeves",
        pos = { x = 2, y = 2 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_shen_turtlebeandeck", stake = "stake_black" },
        loc_vars = function(self) return { key = card_sleeve_key(self) } end,
        apply = function(self, sleeve)
            if unique_effect(self) then
                G.GAME.starting_params.turtlebeansleeve_shop_reduction = 0
                change_shop_size(1)
            else
                G.hand:change_size(5)
                return turtlebean_deck.apply(self, sleeve)
            end
        end,
        calculate = function(self, sleeve, context)
            if unique_effect(self) then
                if context.end_of_round and not context.repetition and not context.individual and G.GAME.blind.boss then
                    change_shop_size(G.GAME.starting_params.turtlebeansleeve_shop_reduction)
                    G.GAME.starting_params.turtlebeansleeve_shop_reduction = 0
                end
                if context.ending_shop then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 1 * G.SETTINGS.GAMESPEED,
                        blocking = false,
                        func = function()
                            change_shop_size(-1)
                            G.GAME.starting_params.turtlebeansleeve_shop_reduction = G.GAME.starting_params
                                .turtlebeansleeve_shop_reduction + 1
                            return true
                        end
                    }))
                end
            else
                return turtlebean_deck.calculate(self, sleeve, context)
            end
        end
    }
    if shenanigans_mod_config.temple_deck then
        CardSleeves.Sleeve {
            key = "temple",
            name = "Temple Sleeve",
            atlas = "shenSleeves",
            pos = { x = 3, y = 2 },
            config = {},
            unlocked = false,
            unlock_condition = { deck = "b_shen_templedeck", stake = "stake_black" },
            loc_vars = function(self) return { key = card_sleeve_key(self), vars = { localize { type = 'name_text', key = 'v_shen_balance', set = 'Voucher' }, localize { type = 'name_text', key = 'v_shen_power', set = 'Voucher' } } } end,
            apply = function(self, sleeve)
                if unique_effect(self) then
                    -- TODO
                else
                    return temple_deck.apply(self, sleeve) --also config = { vouchers = { "v_shen_balance", "v_shen_power" } },
                end
            end,
            calculate = function(self, sleeve, context) end

        }
    end
    CardSleeves.Sleeve {
        key = "cartomancer",
        name = "Cartomancer Sleeve",
        atlas = "shenSleeves",
        pos = { x = 1, y = 0 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_shen_cartomancerdeck", stake = "stake_black" },
        loc_vars = function(self) return { key = card_sleeve_key(self) } end,
        apply = function(self, sleeve)
            if unique_effect(self) then
                G.GAME.starting_params.cartomancersleeve = true
            else
                return cartomancer_deck.apply(self, sleeve)
            end
        end,
        calculate = function(self, sleeve, context)
            if unique_effect(self) then

            else
                return cartomancer_deck.calculate(self, sleeve, context)
            end
        end
    }
    CardSleeves.Sleeve {
        key = "diplopia",
        name = "Diplopia Sleeve",
        atlas = "shenSleeves",
        pos = { x = 4, y = 2 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_shen_diplopiadeck", stake = "stake_black" },
        loc_vars = function(self)
            if unique_effect(self) then
                G.GAME.starting_params.diplopiasleeve = true
                self.config = { joker_slot = 1 }
            else
                G.GAME.starting_params.diplopiadeck = true
            end
            return { key = card_sleeve_key(self) }
        end,
        calculate = function(self, sleeve, context)
            if unique_effect(self) then
                if (context.selling_card or context.joker_type_destroyed) and context.card then
                    local ke = context.card.config.center.key
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        func = function()
                            local skip_card = context.card
                            local _first_dissolve = nil
                            for k, v in pairs(G.jokers.cards) do
                                if v.config.center.key == ke and v ~= skip_card and (not SMODS.is_eternal(v, self)) then
                                    v.getting_sliced = true; v:start_dissolve(nil, _first_dissolve); _first_dissolve = true
                                end
                            end
                            return true
                        end
                    }))
                end
                if context.card_added and context.card then
                    if not context.card.config.diplopiadeck_flag then
                        if context.card.ability.set == "Joker" and (#G.jokers.cards + 1 < G.jokers.config.card_limit or context.card.edition.negative == true) then
                            local dup = copy_card(context.card, nil, nil, nil, false)
                            dup.config.diplopiadeck_flag = true
                            dup:add_to_deck()
                            G.jokers:emplace(dup)
                        end
                    else
                        context.card.config.diplopiadeck_flag = nil
                    end
                end
            end
        end
    }
    CardSleeves.Sleeve {
        key = "riffraff",
        name = "Riff-Raff Sleeve",
        atlas = "shenSleeves",
        pos = { x = 0, y = 3 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_shen_riffraffdeck", stake = "stake_black" },
        loc_vars = function(self)
            local key
            local vars
            if unique_effect(self) then
                key = self.key .. "_alt"
                vars = { localize { type = 'name_text', key = 'j_blueprint', set = 'Joker' } }
            else
                key = self.key
                vars = {}
            end
            return { key = key, vars = vars }
        end,
        apply = function(self, sleeve)
            if unique_effect(self) then
                G.GAME.joker_buffer = 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local jokies = {}
                        local f = false
                        for i = 1, #G.P_JOKER_RARITY_POOLS do
                            for j = 1, #G.P_JOKER_RARITY_POOLS[i] do
                                if G.P_JOKER_RARITY_POOLS[i][j].eternal_compat then
                                    if G.GAME.starting_params.riffraff_selected_joker == G.P_JOKER_RARITY_POOLS[i][j].key and G.P_JOKER_RARITY_POOLS[i][j].blueprint_compat then
                                        jokies = { G.GAME.starting_params.riffraff_selected_joker }
                                        f = true
                                        break
                                    end
                                    table.insert(jokies, G.P_JOKER_RARITY_POOLS[i][j].key)
                                end
                            end
                            if f then break end
                        end
                        local chosen = pseudorandom_element(jokies, pseudoseed('riffraffdeck'))
                        local card = create_card('Joker', G.jokers, nil, 0, nil, nil, chosen, 'rif_deck')
                        card:add_to_deck()
                        card:set_eternal(true)
                        card:set_edition(nil, true)
                        G.jokers:emplace(card)
                        card:start_materialize()
                        G.GAME.joker_buffer = 0
                        return true
                    end
                }))
            else
                return riffraff_deck.apply(self, sleeve)
            end
        end,
        calculate = function(self, sleeve, context) end
    }
    CardSleeves.Sleeve {
        key = "egg",
        name = "Egg Sleeve",
        atlas = "shenSleeves",
        pos = { x = 2, y = 3 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_shen_eggdeck", stake = "stake_black" },
        loc_vars = function(self)
            local key
            local vars
            if unique_effect(self) then
                key = self.key .. "_alt"
                vars = { localize { type = 'name_text', key = 'j_egg', set = 'Joker' } }
            else
                key = self.key
                vars = {}
            end
            return { key = key, vars = vars }
        end,
        apply = function(self, sleeve)
            if unique_effect(self) then
                G.GAME.joker_buffer = 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local card = create_card('Joker', G.jokers, nil, 0, nil, nil, 'j_egg')
                        card:add_to_deck()
                        card:set_edition(nil, true)
                        G.jokers:emplace(card)
                        card:start_materialize()
                        G.GAME.joker_buffer = 0
                        return true
                    end
                }))
            end
        end,
        calculate = function(self, sleeve, context)
            if unique_effect(self) then

            else
                return egg_deck.calculate(self, sleeve, context)
            end
        end
    }
    CardSleeves.Sleeve {
        key = "gift",
        name = "Gift Sleeve",
        atlas = "shenSleeves",
        pos = { x = 7, y = 0 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_shen_giftdeck", stake = "stake_black" },
        loc_vars = function(self) return { key = card_sleeve_key(self) } end,
        apply = function(self, sleeve)
            if unique_effect(self) then
                G.GAME.starting_params.giftsleeve = true
            else
                return gift_deck.apply(self, sleeve)
            end
        end,
        calculate = function(self, sleeve, context) end
    }
    CardSleeves.Sleeve {
        key = "party",
        name = "Party Sleeve",
        atlas = "shenSleeves",
        pos = { x = 4, y = 3 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_shen_partydeck", stake = "stake_black" },
        loc_vars = function(self) return { key = card_sleeve_key(self) } end,
        apply = function(self, sleeve)
            if unique_effect(self) then
                G.GAME.starting_params.partysleeve = true
            else
                return party_deck.apply(self, sleeve)
            end
        end,
        calculate = function(self, sleeve, context)
            if unique_effect(self) then

            else
                return party_deck.calculate(self, sleeve, context)
            end
        end
    }
    CardSleeves.Sleeve {
        key = "midas",
        name = "Midas Sleeve",
        atlas = "shenSleeves",
        pos = { x = 3, y = 3 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_shen_midasdeck", stake = "stake_black" },
        loc_vars = function(self) return { key = card_sleeve_key(self) } end,
        apply = function(self, sleeve)
            if unique_effect(self) then
                G.GAME.starting_params.midassleeve = true
            else
                return midas_deck.apply(self, sleeve)
            end
        end,
        calculate = function(self, sleeve, context) end
    }
    CardSleeves.Sleeve {
        key = "campfire",
        name = "Campfire Sleeve",
        atlas = "shenSleeves",
        pos = { x = 5, y = 0 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_shen_campfiredeck", stake = "stake_black" },
        loc_vars = function(self) return { key = card_sleeve_key(self) } end,
        apply = function(self, sleeve)
            if unique_effect(self) then
                G.GAME.starting_params.campfiresleeve = true
            else
                return campfire_deck.apply(self, sleeve)
            end
        end,
        calculate = function(self, sleeve, context)
            if unique_effect(self) and context.buying_card then
                if context.card and context.card.ability.set == "Joker" then
                    if pseudorandom('campfiresleeve', 1, 4) == 4 then
                        context.card:sell_card()
                    end
                end
            end
        end
    }
    CardSleeves.Sleeve {
        key = "loyalty",
        name = "Loyalty Sleeve",
        atlas = "shenSleeves",
        pos = { x = 6, y = 0 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_shen_loyaltydeck", stake = "stake_black" },
        loc_vars = function(self) return { key = card_sleeve_key(self) } end,
        apply = function(self, sleeve)
            if unique_effect(self) then
                G.GAME.starting_params.loyaltysleeve = true
                G.GAME.starting_params.total_purchases = 0
            else
                return loyalty_deck.apply(self, sleeve)
            end
        end,
        calculate = function(self, sleeve, context)
            if unique_effect(self) and (context.buying_card or context.open_booster) then
                G.GAME.starting_params.total_purchases = G.GAME.starting_params.total_purchases + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        for k, v in pairs(G.shop_jokers.cards) do
                            if v.set_cost then v:set_cost() end
                        end
                        for k, v in pairs(G.shop_booster.cards) do
                            if v.set_cost then v:set_cost() end
                        end
                        for k, v in pairs(G.shop_vouchers.cards) do
                            if v.set_cost then v:set_cost() end
                        end
                        return true
                    end
                }))
            end
        end
    }
    CardSleeves.Sleeve {
        key = "vagabond",
        name = "Vagabond Sleeve",
        atlas = "shenSleeves",
        pos = { x = 9, y = 0 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_shen_vagabonddeck", stake = "stake_black" },
        loc_vars = function(self) return { key = card_sleeve_key(self) } end,
        apply = function(self, sleeve)
            if unique_effect(self) then
                G.GAME.starting_params.vagabondsleeve = true
                G.GAME.levels_lost_this_round = 0
            else
                return vagabond_deck.apply(self, sleeve)
            end
        end,
        calculate = function(self, sleeve, context) end
    }
    CardSleeves.Sleeve {
        key = "cloud9",
        name = "Cloud 9 Sleeve",
        atlas = "shenSleeves",
        pos = { x = 8, y = 0 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_shen_cloud9deck", stake = "stake_black" },
        loc_vars = function(self) return { key = card_sleeve_key(self) } end,
        apply = function(self, sleeve)
            if unique_effect(self) then
                G.GAME.win_ante = 9
                G.GAME.starting_params.cloud9sleeve = true
            else
                G.hand:change_size(1)
                return cloud9_deck.apply(self, sleeve)
            end
        end,
        calculate = function(self, sleeve, context) end
    }
    CardSleeves.Sleeve {
        key = "coughingbaby",
        name = "Coughing Baby Sleeve",
        atlas = "shenSleeves",
        pos = { x = 9, y = 1 },
        unlocked = false,
        unlock_condition = { deck = "b_shen_coughingbabydeck", stake = "stake_black" },
        loc_vars = function(self)
            if unique_effect(self) then
                G.GAME.starting_params.coughingbabysleeve = true
            else
                self.config = { jokers = { "j_ice_cream" } }
            end
            return { key = card_sleeve_key(self), vars = { localize { type = 'name_text', key = 'j_ice_cream', set = 'Joker' } } }
        end,
        apply = function(self, sleeve)
            if unique_effect(self) then
            else
                self.config = { jokers = { "j_ice_cream" } }
                G.E_MANAGER:add_event(Event({ -- above doesnt work. whatever
                    func = function()
                        local card = SMODS.create_card { key = "j_ice_cream", area = G.jokers }
                        card:add_to_deck()
                        G.jokers:emplace(card)
                        card:start_materialize()
                        return true
                    end
                }))
                return coughingbaby_deck.apply(self, sleeve)
            end
        end,
        calculate = function(self, sleeve, context) end
    }
    CardSleeves.Sleeve {
        key = "hydrogenbomb",
        name = "Hydrogen Bomb Sleeve",
        atlas = "shenSleeves",
        pos = { x = 5, y = 2 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_shen_hydrogenbombdeck", stake = "stake_black" },
        loc_vars = function(self) return { key = card_sleeve_key(self) } end,
        apply = function(self, sleeve)
            if unique_effect(self) then
                G.GAME.starting_params.hydrogenbombsleeve = true
            else
                return hydrogenbomb_deck.apply(self, sleeve)
            end
        end,
        calculate = function(self, sleeve, context)
            if unique_effect(self) then

            else
                return hydrogenbomb_deck.calculate(self, sleeve, context)
            end
        end
    }
    CardSleeves.Sleeve {
        key = "satellite",
        name = "Satellite Sleeve",
        atlas = "shenSleeves",
        pos = { x = 4, y = 1 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_shen_satellitedeck", stake = "stake_black" },
        loc_vars = function(self) return { key = card_sleeve_key(self) } end,
        apply = function(self, sleeve) end,
        calculate = function(self, sleeve, context)
            if unique_effect(self) then
                if context.using_consumeable and context.consumeable.ability.set == 'Planet' then
                    local satellite_hand = get_random_hand(nil, "satdeck" .. G.GAME.round_resets.ante) --Random poker hand
                    update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
                        handname = localize(satellite_hand, "poker_hands"),
                        chips = G.GAME.hands[satellite_hand].chips,
                        mult = G.GAME.hands[satellite_hand].mult,
                        level = G.GAME.hands[satellite_hand].level,
                    })
                    level_up_hand(context.consumeable, satellite_hand, nil, 1)
                    update_hand_text(
                        { sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
                        { mult = 0, chips = 0, handname = "", level = "" }
                    )
                end
            else
                return satellite_deck.calculate(self, sleeve, context)
            end
        end
    }
    CardSleeves.Sleeve {
        key = "sedma",
        name = "Sedma Sleeve",
        atlas = "shenSleeves",
        pos = { x = 7, y = 1 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_shen_sedmadeck", stake = "stake_black" },
        loc_vars = function(self) return { key = card_sleeve_key(self) } end,
        apply = function(self, sleeve)
            if unique_effect(self) then
                G.GAME.starting_params.sedmasleeve = true
                if self.allowed_card_centers == nil then
                    self.allowed_card_centers = {}
                    self.incantation_allowed_card_centers = {}
                    self.skip_trigger_effect = true
                    for _, card_center in pairs(G.P_CARDS) do
                        if in_sedma_deck(card_center.value) then
                            self.allowed_card_centers[#self.allowed_card_centers + 1] = card_center

                            local card_instance = Card(0, 0, 0, 0, card_center, G.P_CENTERS.c_base)
                            if not SMODS.Ranks[card_instance.base.value].face and SMODS.Ranks[card_instance.base.value].card_key ~= "A" then
                                self.incantation_allowed_card_centers[#self.incantation_allowed_card_centers + 1] =
                                    card_center
                            end
                        end
                    end
                    self.get_rank_after_ace = function() return "7" end
                    self.skip_trigger_effect = false
                end
            else
                G.GAME.starting_params.sedmadeck = true
            end
        end,
        calculate = function(self, sleeve, context) --copied code from triboulet sleeve
            if unique_effect(self) then             --which is copied from cardsleeves abandoned sleeve
                if sleeve.skip_trigger_effect then  --maybe make something mmore generic for removing ranks from decks??????
                    return
                end
                if sleeve.allowed_card_centers == nil then
                    sleeve:apply(sleeve)
                end

                -- handle Strength and Ouija
                local card = context.card
                local is_playing_card = card and (card.ability.set == "Default" or card.ability.set == "Enhanced") and
                    card.config.card_key
                if context.before_use_consumable and card then
                    if card.ability.name == 'Strength' then
                        sleeve.in_strength = true
                    elseif card.ability.name == "Ouija" then
                        sleeve.in_ouija = true
                    elseif card.ability.name == "Incantation" then
                        sleeve.in_incantation = true
                    end
                    if sleeve.in_strength and sleeve.in_ouija then
                        print_warning("cannot be in both strength and ouija!")
                    end
                elseif context.after_use_consumable then
                    sleeve.in_strength = nil
                    sleeve.in_ouija = nil
                    sleeve.ouija_rank = nil
                elseif (context.create_card or context.modify_playing_card) and card and is_playing_card then
                    if SMODS.Ranks[card.base.value] and not in_sedma_deck(SMODS.Ranks[card.base.value].shorthand) then
                        local initial = G.GAME.blind == nil or context.create_card
                        if sleeve.in_strength then
                            local base_key = SMODS.Suits[card.base.suit].card_key ..
                                "_" .. sleeve.get_rank_after_ace()
                            card:set_base(G.P_CARDS[base_key], initial)
                        elseif sleeve.in_ouija then
                            if sleeve.ouija_rank == nil then
                                local random_base = pseudorandom_element(sleeve.allowed_card_centers,
                                    pseudoseed("sedmasleeve"))
                                local card_instance = Card(0, 0, 0, 0, random_base, G.P_CENTERS.c_base)
                                sleeve.ouija_rank = SMODS.Ranks[card_instance.base.value]
                                card_instance:remove()
                            end
                            local base_key = SMODS.Suits[card.base.suit].card_key ..
                                "_" .. sleeve.ouija_rank.card_key
                            card:set_base(G.P_CARDS[base_key], initial)
                        elseif sleeve.in_incantation then
                            local random_base = pseudorandom_element(sleeve.incantation_allowed_card_centers,
                                pseudoseed("sedmasleeve"))
                            card:set_base(random_base, initial)
                        else
                            local random_base = pseudorandom_element(sleeve.allowed_card_centers,
                                pseudoseed("sedmasleeve"))
                            card:set_base(random_base, initial)
                        end
                    end
                end
            end
        end
    }
    CardSleeves.Sleeve {
        key = "acrobat",
        name = "Acrobat Sleeve",
        atlas = "shenSleeves",
        pos = { x = 6, y = 1 },
        unlocked = false,
        config = {},
        unlock_condition = { deck = "b_shen_acrobatdeck", stake = "stake_black" },
        loc_vars = function(self)
            return { key = card_sleeve_key(self) }
        end,
        apply = function(self, sleeve)
            if unique_effect(self) then
                G.GAME.starting_params.acrobatsleeve = true
                G.GAME.modifiers.money_per_hand = 0
            else
                G.GAME.starting_params.acrobatdeck = true
            end
        end,
        calculate = function(self, sleeve, context)
            if unique_effect(self) then

            else
                return acrobat_deck.calculate(self, sleeve, context)
            end
        end
    }
    CardSleeves.Sleeve {
        key = "treasure",
        name = "Treasure Sleeve",
        atlas = "shenSleeves",
        pos = { x = 6, y = 2 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_shen_treasuredeck", stake = "stake_black" },
        loc_vars = function(self) return { key = card_sleeve_key(self) } end,
        apply = function(self, sleeve)
            if not unique_effect(self) then
                return treasure_deck.apply(self, sleeve)
            else
                G.GAME.starting_params.voucher_given = false
            end
        end,
        calculate = function(self, sleeve, context)
            if unique_effect(self) then
                if context.buying_card then
                    if context.card.ability.set == "Voucher" and not G.GAME.starting_params.voucher_given then
                        SMODS.add_voucher_to_shop()
                        G.GAME.starting_params.voucher_given = true
                    end
                elseif context.round_eval and G.GAME.last_blind and G.GAME.last_blind.boss then
                    G.GAME.starting_params.voucher_given = false
                end
            end
        end
    }
    CardSleeves.Sleeve {
        key = "throwback",
        name = "Throwback Sleeve",
        atlas = "shenSleeves",
        pos = { x = 8, y = 1 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_shen_throwbackdeck", stake = "stake_black" },
        loc_vars = function(self) return { key = card_sleeve_key(self) } end,
        apply = function(self, sleeve)
            if unique_effect(self) then
            else
                return throwback_deck.apply(self, sleeve)
            end
        end,
        calculate = function(self, sleeve, context)
            if unique_effect(self) then
                if context.skip_blind then
                    if (G.GAME.skips % 3 == 0) then
                        G.E_MANAGER:add_event(Event({
                            trigger = 'immediate',
                            func = function()
                                local ante_UI = G.hand_text_area.ante
                                local col = G.C.RED
                                G.GAME.round_resets.ante = G.GAME.round_resets.ante - 1
                                ante_UI.config.object:update()
                                G.HUD:recalculate()
                                attention_text({
                                    text = '-1',
                                    scale = 1,
                                    hold = 0.7,
                                    cover = ante_UI.parent,
                                    cover_colour = col,
                                    align = 'cm',
                                })
                                --Play a chip sound
                                play_sound('highlight2', 0.685, 0.2)
                                play_sound('generic1')
                                return true
                            end
                        }))
                        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
                        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - 1
                        G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 1.25
                    end
                end
            else
                return throwback_deck.calculate(self, sleeve, context)
            end
        end
    }
    CardSleeves.Sleeve {
        key = "steam",
        name = "Steam Sleeve",
        atlas = "shenSleeves",
        pos = { x = 5, y = 1 },
        config = {},
        unlocked = false,
        unlock_condition = { deck = "b_shen_steamdeck", stake = "stake_black" },
        loc_vars = function(self)
            if unique_effect(self) then
                return { key = card_sleeve_key(self), vars = { localize { type = 'name_text', key = 'v_clearance_sale', set = 'Voucher' }, localize { type = 'name_text', key = 'v_liquidation', set = 'Voucher' } } }
            else
                return { key = card_sleeve_key(self), vars = { localize { type = 'name_text', key = 'tag_coupon', set = 'Tag' } } }
            end
        end,
        apply = function(self, sleeve)
            if unique_effect(self) then
                G.GAME.starting_params.steamsleeve = true
                G.GAME.used_vouchers['v_clearance_sale'] = true
                G.GAME.used_vouchers['v_liquidation'] = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.starting_voucher_count = (G.GAME.starting_voucher_count or 0) + 2
                        Card.apply_to_run(nil, G.P_CENTERS['v_clearance_sale'])
                        Card.apply_to_run(nil, G.P_CENTERS['v_liquidation'])
                        return true
                    end
                }))
            end
        end,
        calculate = function(self, sleeve, context)
            if not unique_effect(self) then
                return steam_deck.calculate(self, sleeve, context)
            end
        end
    }
end
