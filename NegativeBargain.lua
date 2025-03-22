local voucherName = "Negative Bargain"
local voucherID = "negative_bargain"
local modID = "NegativeBargain"

local voucherLocalizedText = {
	name = voucherName,
	text = {
		"{C:dark_edition}Negative{} Jokers",
		"appear {C:attention}3X{} more often",
	},
}

local originalNegativeWeight = false

SMODS.Atlas({
	key = string.format("v_%s", voucherID),
	path = string.format("v_%s.png", voucherID),
	px = 71,
	py = 95,
})

local VOUCHER = SMODS.Voucher({
	name = voucherName,
	key = voucherID,
	config = {},
	pos = { x = 0, y = 0 },
	loc_txt = voucherLocalizedText,
	cost = 12,
	unlocked = true,
	discovered = true,
	available = true,
	atlas = string.format("%s_v_%s", modID, voucherID),
	redeem = function(self, card)
		--print('Negative Bargain Activated from Redeem()!')
		if not originalNegativeWeight then originalNegativeWeight = G.P_CENTERS["e_negative"].weight end

		G.P_CENTERS["e_negative"].weight = originalNegativeWeight * 3
	end,
	load = function(self, card, card_table, other_card)
		if originalNegativeWeight then G.P_CENTERS["e_negative"].weight = originalNegativeWeight end

		if G.GAME.used_vouchers.v_NegativeBargain_negative_bargain then
			if not originalNegativeWeight then originalNegativeWeight = G.P_CENTERS["e_negative"].weight end

			G.P_CENTERS["e_negative"].weight = originalNegativeWeight * 3
		end
	end,
})

VOUCHER:register()
sendDebugMessage("RekoyPlus Initialized!")
