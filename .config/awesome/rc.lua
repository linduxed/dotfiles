-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")
-- Widget library
vicious = require("vicious")
require("colours")

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init(awful.util.getdir("config") .. "/themes/linduxed/theme.lua")

-- Make critical notifications disappear automatically.
naughty.config.presets.critical.timeout = 8

-- This is used later as the default terminal and editor to run.
terminal = "roxterm"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.tile,
    --awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.max,
    --awful.layout.suit.tile.top,
    --awful.layout.suit.fair,
	awful.layout.suit.fair.horizontal,
    --awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.magnifier,
    awful.layout.suit.floating
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
	if s == 1 then
		tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, { awful.layout.suit.spiral.dwindle, awful.layout.suit.tile, awful.layout.suit.tile, awful.layout.suit.tile, awful.layout.suit.tile, awful.layout.suit.tile, awful.layout.suit.tile, awful.layout.suit.tile, awful.layout.suit.fair.horizontal })
	elseif s == 2 then
		tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, awful.layout.suit.tile.bottom)
	else
		tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, awful.layout.suit.tile)
	end
end
-- }}}

-- {{{ Wibox
-- Awesome logo
logo = widget({ type = "imagebox" })
logo.image = image(beautiful.awesome_icon)

-- Create a textclock widget
datetime = awful.widget.textclock({ align = "right" }, "" .. colbblu .. "%a %b %d" .. coldef .. " " .. colcya .. "%H:%M:%S" .. coldef, 1)

-- Create a systray
mysystray = widget({ type = "systray" })

space = widget({ type = "textbox" })
space.text  = " "

separator = widget({ type = "textbox" })
separator.text = "" .. colwhi .. "|" .. coldef .. ""

-- CPU widget
cpu = widget({type = "textbox" })
vicious.register(cpu,  vicious.widgets.cpu, "" .. colblu .. "CPU: " .. coldef .. colcya .. "$1" .. coldef .. coldblu .. "%" .. coldef, 5)

-- Thermal widget
thermal = widget({type = "textbox" })
vicious.register(thermal,  vicious.widgets.thermal, "" .. colcya .. "$1" .. coldef .. coldblu .. "C" .. coldef, 5, { "coretemp.0", "core"})

-- Network widget
net = widget({ type = "textbox" })
vicious.register(net, vicious.widgets.net, "" .. colbgre .. "${wlan0 down_kb}" .. coldef .. coldblu .. "k " .. coldef .. colcya .. "${wlan0 up_kb}" .. coldef .. coldblu .. "k" .. coldef, 5)

-- Volume widget
vol = widget({ type="textbox" })
vicious.register(vol, vicious.widgets.volume, "" .. colblu .. "Vol: " .. coldef .. colcya .. "$1" .. coldef .. coldblu .. "%" .. coldef, 2, "Master")

vol:buttons(awful.util.table.join(
    awful.button({ }, 1, function () awful.util.spawn_with_shell("urxvt -e alsamixer") end)
))

mpd = widget({ type = "textbox"})
vicious.register(mpd, vicious.widgets.mpd, "" .. colmag .. "${Artist}" .. coldef .. " - " .. colbblu .. "${Title}" .. coldef)

function mpd_text_rotate()
    if string.len(mpd_text) >= mpd_text_max_size then
        mpd_text = string.gsub(mpd_text, '^(.)(.+)$', '%2%1')
        mpd_text_box.text = string.sub(mpd_text, 1, mpd_text_max_size).."..."
    else
        mpd_text_box.text = mpd_text
    end
end

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if not c:isvisible() then
                                                  awful.tag.viewonly(c:tags()[1])
                                              end
                                              client.focus = c
                                              c:raise()
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })
    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        {
			logo,
            mytaglist[s],
            mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
        mylayoutbox[s],
		space,
		datetime,
		space, separator, space,
		net,
		space, separator, space,
		vol, volicon,
		space, separator, space,
		thermal, space, cpu,
		space, separator, space,
		mpd,
		space, separator, space,
        s == 1 and mysystray or nil,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
end
-- }}}

-- {{{ Mouse bindings
--root.buttons(awful.util.table.join(
    --awful.button({ }, 3, function () mymainmenu:toggle() end),
    --awful.button({ }, 4, awful.tag.viewnext),
    --awful.button({ }, 5, awful.tag.viewprev)
--))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "l",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "y",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "i",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "n",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    --awful.key({ modkey,           }, "w", function () mymainmenu:show(true)        end),
    --awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "i", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "n", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "i", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "n", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

	-- Layout manipulation
    awful.key({ modkey,           }, "u",  function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "e",  function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "u",  function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "e",  function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "u",  function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "e",  function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "F2", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "F2", function () awful.layout.inc(layouts, -1) end),

	-- Volume
	awful.key({ modkey }, "F10", function () awful.util.spawn("/home/linduxed/bin/pa-volume.sh down") end),
	awful.key({ modkey }, "F11", function () awful.util.spawn("/home/linduxed/bin/pa-volume.sh up")   end),
	awful.key({ modkey }, "F12", function () awful.util.spawn("/home/linduxed/bin/pa-volume.sh mute") end),

	-- Background switching
	awful.key({ modkey }, "F9", function () awful.util.spawn("/home/linduxed/bin/dual_bg_random_switch.sh") end),
	awful.key({ modkey }, "F8", function () awful.util.spawn("/home/linduxed/bin/bg_random_switch.sh")      end),

	-- MPD control
	awful.key({ "Control", "Mod1" }, "p", function () awful.util.spawn("mpc toggle") end),
	awful.key({ "Control", "Mod1" }, "s", function () awful.util.spawn("mpc stop")   end),
	awful.key({ "Control", "Mod1" }, "y", function () awful.util.spawn("mpc next")   end),
	awful.key({ "Control", "Mod1" }, "l", function () awful.util.spawn("mpc prev")   end),

    -- Prompt
    awful.key({ modkey }, "F1", function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "F4",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey,           }, "`",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "F2",     awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "k",      function (c) c.minimized = not c.minimized    end),
    awful.key({ modkey, "Shift"   }, "k",
   	function ()
	    for _, ttag in pairs(awful.tag.selectedlist(mouse.screen)) do
		for _, tclient in pairs(ttag:clients()) do
		    if tclient.minimized then
			tclient.minimized = false
			client.focus = tclient
		    end
	        end
	    end
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ },        1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },     properties = { floating = true } },
    { rule = { class = "gimp" },        properties = { floating = true } },
    { rule = { class = "Shredder" },    properties = { tag = tags[1][8] } },
    { rule = { class = "Thunderbird" }, properties = { tag = tags[1][8] } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
	awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
