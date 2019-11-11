local skillOver100 = {}

function skillOver100.progressSkill(eventStatus, pid)
    local fl = false
    for skillName, skill in pairs(Players[pid].data.skills) do
        local progress = skill.progress
        local base = skill.base
        skill.progress = 0
        LevelingFramework.progressSkill(pid, skillName, progress, 1)
        fl = fl or (base < skill.base)
    end

    if fl then
        Players[pid]:LoadSkills()
    end
end

customEventHooks.registerHandler('OnPlayerSkill', skillOver100.progressSkill)

return skillOver100