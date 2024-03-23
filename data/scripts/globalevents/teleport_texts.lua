local effects = {
    {position = Position(32341, 32220, 7), text = 'Click To Remove Shopping Bags', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32365, 32236, 7), text = 'Trainers', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32373, 32236, 7), text = 'Event Room', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32373, 32239, 7), text = 'Roulette', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32365, 32239, 7), text = 'WAR Event', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32335, 31923, 7), text = 'Enter Blue Team', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32345, 31923, 7), text = 'Enter Green Team', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32343, 32219, 7), text = 'Tasks', effect = CONST_ME_GROUNDSHAKER},
}
	

local animatedText = GlobalEvent("AnimatedText") 
function animatedText.onThink(interval)
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
        if #spectators > 0 then
            if settings.text then
                for i = 1, #spectators do
                    spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
                end
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
   return true
end

animatedText:interval(10000)
animatedText:register()