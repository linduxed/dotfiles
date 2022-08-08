local p = require("luasnip.extras").partial
local random_hex = function(target_string_length)
    local hex = {
        "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
        "a", "b", "c", "d", "e", "f",
    }

    local chosen_chars = {}
    for i = 1, target_string_length, 1 do
        chosen_chars[i] = hex[math.random(#hex)]
    end

    return table.concat(chosen_chars)
end

return {
    s(
        {
            trig = "time",
            name = "Current time",
            dscr = "Insert the current time"
        },
        { p(os.date, "%H:%M"), }
    ),
    s(
        {
            trig = "date",
            name = "Current date",
            dscr = "Insert the current date"
        },
        { p(os.date, "%Y-%m-%d"), }
    ),
    s(
        {
            trig = "hex6tag",
            name = "Random 6 hex characters tag",
            dscr = "Tag comprised of random hex characters, for simple " ..
                "creation of a semi-unique tag."
        },
        p(random_hex, 6)
    ),
    s(
        {
            trig = "hex8tag",
            name = "Random 8 hex characters tag",
            dscr = "Tag comprised of random hex characters, for simple " ..
                "creation of a semi-unique tag."
        },
        p(random_hex, 8)
    )
}
