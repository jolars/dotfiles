local select = require "select"
local follow = require "follow"

select.label_maker = function ()
    local chars = charset("asdfqwerzxcv")
    return trim(sort(reverse(chars)))
end

follow.pattern_maker = follow.pattern_styles.match_label

