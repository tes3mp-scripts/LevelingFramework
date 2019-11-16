Requires [DataManager](https://github.com/tes3mp-scripts/DataManager) and optionally [espParser](https://github.com/JakobCh/tes3mp_scripts/tree/master/espParser)!

Has to be `require`d before any of the modules that use it.

Includes an optional module `skillOver100.lua` which allows natural skill progression over 100. You need to require after `main.lua` (such as `require("custom.LevelingFramework.skillOver100")`). For it to function you should also change the `skillCap` value in LevelingFramework config.

You can find the configuration file in `server/data/custom/__config_LevelingFramework.json` after first server launch.
* `message`
  * `enabled` whether LevelingFramework should display a message and play a sound like for normal level ups. Default `true`.
  * `text` text of the skill increase message. Default `Your %s skill increased to %s`.
  * `sound` path to the skill increase sound file. Default `fx/inter/levelUP.wav`.
  * `id` id of the GUI message box. Default `6666`.
* `importESPs` whether to parse ESP files on startup. Setting this to `true` will significantly increase your server starting times and RAM usage overall. It is recommended to use the `lfimportesps` command when necessary. Default `false`.
* `cmdRank` rank required to use the `lfimportesps` command. Default `2` (admin).
* `skillCap` prevent increasing skills above this value. Default `100`.
GMST values, more info here [OpenMW Research](https://wiki.openmw.org/index.php?title=Research:Stats_and_Levelling#Skill_progress)
* `skillNames` list of skill names to display. Default are English version names.
* `fMajorSkillBonus` Default `0.75`.
* `fMinorSkillBonus` Default `1`.
* `fMiscSkillBonus` Default `1.25`.
* `fSpecialSkillBonus` Default `0.8`.
* `iLevelUpTotal` Default `10`.
* `iLevelUpMajorMult` Default `1`.
* `iLevelUpMinorMult` Default `1`.
* `iLevelUpMajorMultAttribute` Default `1`.
* `iLevelUpMinorMultAttribute` Default `1`.
* `iLevelupMiscMultAttriubte` Default `1`.

Using it in your modules
---
Methods:
* `importESPs()` trigger ESP import manually
* `increaseSkill(pid, skillName, value, keepProgress)` increases a skill by `value` whole levels. Sets skill progress to 0 unless `keepProgress` is true
* `progressSkill(pid, skillName, progress, count)` progresses the skill by `progress` `count` amount of times.
Events:
* `LevelingFramework_OnSkillIncrease` is triggered whenever a skill is increased through this script's methods.  
  callback arguments are `pid` and `arguments`, where `arguments` is a table with the arguments passed to `increaseSkill`: `skillName`, `value`, `keepProgress`.  
  This allows your validators to change values before `increaseSkill` logic takes place, such as to implement a custom skill cap (look into event hooks in `main.lua` for an example)

Commands:
* `lfimportesps` load skill and class data from ESPs

Examples
---
In my [CustomAlchemy](https://github.com/tes3mp-scripts/CustomAlchemy) script I do the following
```
LevelingFramework.progressSkill(pid, "Alchemy", 2, potion_count)
Players[pid]:LoadSkills()
Players[pid]:LoadLevel()
```
to progress players' alchemy skill, using vanilla values of `2` progress per potion brewed.  
Note `Players[pid]:LoadSkills()` and `Players[pid]:LoadLevel()`, `LevelingFramework`'s functions only operate `Players[pid].data`, you need to call these functions to sync changes with the client.