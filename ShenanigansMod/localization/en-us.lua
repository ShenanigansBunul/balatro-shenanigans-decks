return {
    misc = {
        dictionary = {
            k_temple_game = "Temple Game",
            b_temple_game_cards = "Temple Games",
            k_temple_common = "Common",
            k_temple_divine = "Divine",
            k_freaky = "Freaky!",
        },
        labels = {
            temple_game = "Temple Game",
            temple_common = "Common",
            temple_divine = "Divine",
        }
    },
    descriptions = {
        ["Other"] = {
            ["freaky_six"] = {
                ["name"] = "Freaky 6",
                text = {
                    "anybody gonna",
                    "match my freak?"
                }
            },
            ["freaky_nine"] = {
                ["name"] = "Freaky 9",
                text = {
                    "i'm a freak fr",
                    "just lmk"
                }
            }
        },
        temple_game = {
            c_shen_temple_after_egypt = {
                name = "After Egypt",
                text = {
                    "Permanently",
                    "gain {C:red}+1{} discard",
                    "each round"
                }
            },
            c_shen_temple_battle_lines = {
                name = "Battle Lines",
                text = {
                    "{C:attention}+1{} card slot",
                    "available in shop"
                }
            },
            c_shen_temple_bomber_golf = {
                name = "Bomber Golf",
                text = {
                    "{C:attention}+1{} consumable slot"
                }
            },
            c_shen_temple_eagle_dive = {
                name = "Eagle Dive",
                text = {
                    "Permanently",
                    "gain {C:blue}+1{} hand",
                    "per round",
                }
            },
            c_shen_temple_strut = {
                name = "Strut",
                text = {
                    "Balance {C:blue}Chips{} and",
                    "{C:red}Mult{} when calculating",
                    "score for played hand at",
                    "{C:blue}640{}:{C:red}480{} ratio"
                }
            },
            c_shen_temple_varoom = {
                name = "Varoom",
                text = {
                    "{C:dark_edition}+1{} Joker Slot"
                }
            },
            c_shen_temple_zone_out = {
                name = "Zone Out",
                text = {
                    "{C:attention}+1{} hand size"
                }
            }
        },
        Voucher = {
            v_shen_balance = {
                name = "Balance",
                text = {
                    "Common {C:temple_game}Temple Games{} can be",
                    "purchased from the {C:attention}shop{}"
                }
            },
            v_shen_power = {
                name = "Power",
                text = {
                    "{C:dark_edition}Divine{} {C:temple_game}Temple Games{}",
                    "can be purchased from the {C:attention}shop{}"
                }
            }
        },
        Back = {
            b_shen_caniodeck = {
                name = "Canio Deck",
                text = {
                    "Discarded cards have a",
                    "{C:green}1 in 10{} chance",
                    "to be destroyed"
                }
            },
            b_shen_tribouletdeck = {
                name = "Triboulet Deck",
                text = {
                    "Retrigger all",
                    "{C:attention}Kings{} and {C:attention}Queens{}",
                }
            },
            b_shen_yorickdeck = {
                name = "Yorick Deck",
                text = {
                    "Discarded cards trigger",
                    "their end of round effects"
                }
            },
            b_shen_chicotdeck = {
                name = "Chicot Deck",
                text = {
                    "During the {C:attention}Boss Blind{}, your",
                    "rightmost Joker triggers",
                    "an additional time",
                }
            },
            b_shen_perkeodeck = {
                name = "Perkeo Deck",
                text = {
                    "After using four consumables",
                    "get a {C:dark_edition}Negative{} copy",
                    "of one of them"
                }
            },
            b_shen_duskdeck = {
                name = "Dusk Deck",
                text = {
                    "Retrigger all played",
                    "cards in {C:attention}final hand{}",
                    "of round {C:attention}twice{}",
                    "{C:blue}-1{} hand every round"
                }
            },
            b_shen_grosmicheldeck = {
                name = "Gros Michel Deck",
                text = {
                    "The leftmost non-eternal",
                    "{C:attention}Joker{} has a {C:green}1 in 6{} chance to be",
                    "destroyed at end of round",
                    "Start with a {C:gold,T:j_gros_michel}#1#{}"
                }
            },
            b_shen_hieroglyphdeck = {
                name = "Hieroglyph Deck",
                text = {
                    "Start in {C:attention}Ante 0{}",
                    "{C:attention}+2{} Antes to win"
                }
            },
            b_shen_freakydeck = {
                name = "Freaky Deck",
                text = {
                    "Jokers are now {C:attention}freaky{}"
                }
            },
            b_shen_showmandeck = {
                name = "Showman Deck",
                text = {
                    "Cards may appear",
                    "multiple times, higher",
                    "chance for duplicates."
                }
            },
            b_shen_snakeskindeck = {
                name = "Snakeskin Deck",
                text = {
                    "After Play or Discard,",
                    "always draw 3 cards"
                }
            },
            b_shen_turtlebeandeck = {
                name = "Turtle Bean Deck",
                text = {
                    "{C:attention}+5{} hand size, reduces by {C:red}1{}",
                    "after each played hand",
                    "or discard. Resets after",
                    "defeating the {C:attention}Boss Blind{}"
                }
            },
            b_shen_templedeck = {
                name = "Temple Deck",
                text = {
                    "Start run with",
                    "{C:temple_game,T:c_shen_balance}#1#{} and {C:temple_game,T:c_shen_power}#2#{}",
                    "{C:blue}-1{} hand size",
                }
            },
            b_shen_cartomancerdeck = {
                name = "Cartomancer Deck",
                text = {
                    "Create a specific {C:purple}Tarot{} card",
                    "when {C:attention}Blind{} is selected",
                    "(changes each {C:attention}Ante{})"
                }
            },
            b_shen_diplopiadeck = {
                name = "Diplopia Deck",
                text = {
                    "After defeating",
                    "each {C:attention}Boss Blind{},",
                    "gain a {C:dark_edition}Negative{} {C:attention}Perishable{}",
                    "copy of a random {C:attention}Joker{}"
                }
            },
            b_shen_riffraffdeck = {
                name = "Riff-Raff Deck",
                text = {
                    "Start with {C:dark_edition}ANY{} random",
                    "eternal {C:attention}Joker{} that",
                    "retriggers once",
                }
            }
        }
    }
}
