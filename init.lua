local addon, ns = ...

local Dispels = CreateFrame("Frame")
Dispels.SpellList = {}

Dispels.isRetail = (WOW_PROJECT_ID == WOW_PROJECT_MAINLINE)
Dispels.isBCC = (WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC)
Dispels.isClassic = WOW_PROJECT_ID == WOW_PROJECT_CLASSIC
Dispels.isWotLK = (WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC)

ns.Dispels = Dispels
