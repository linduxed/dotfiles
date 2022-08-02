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
}
