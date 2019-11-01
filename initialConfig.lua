local keyOrder = {
    "parseESPs",
    "skillCap",
    "fMajorSkillBonus",
    "fMinorSkillBonus",
    "fMiscSkillBonus",
    "fSpecialSkillBonus",
    "iLevelUpTotal",
    "iLevelUpMajorMult",
    "iLevelUpMinorMult",
    "iLevelUpMajorMultAttribute",
    "iLevelUpMinorMultAttribute",
    "iLevelupMiscMultAttriubte",
}

local values = {
    parseESPs = false,
    skillCap = 100,
    fMajorSkillBonus = 0.75,
    fMinorSkillBonus = 1,
    fMiscSkillBonus = 1.25,
    fSpecialSkillBonus = 0.8,
    iLevelUpTotal = 10,
    iLevelUpMajorMult = 1,
    iLevelUpMinorMult = 1,
    iLevelUpMajorMultAttribute = 1,
    iLevelUpMinorMultAttribute = 1,
    iLevelupMiscMultAttriubte = 1,
}

return { keyOrder = keyOrder, values = values }