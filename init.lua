-- set up your instance(s)
expose = hs.expose.new(nil,{showThumbnails=false}) -- default windowfilter, no thumbnails
expose_app = hs.expose.new(nil,{onlyActiveApplication=true}) -- show windows for the current application
expose_space = hs.expose.new(nil,{includeOtherSpaces=false}) -- only windows in the current Mission Control Space
expose_browsers = hs.expose.new{'Safari','Google Chrome'} -- specialized expose using a custom windowfilter
-- for your dozens of browser windows :)

-- then bind to a3
hs.hotkey.bind('ctrl-cmd-shift','e','App Expose',function()expose_app:toggleShow()end)

-- init grid
hs.grid.MARGINX 	= 0
hs.grid.MARGINY 	= 0
hs.grid.GRIDWIDTH 	= 24
hs.grid.GRIDHEIGHT 	= 12

hs.window.animationDuration = 0

units = {
  right30       = { x = 0.67, y = 0.00, w = 0.33, h = 1.00 },
  right70       = { x = 0.33, y = 0.00, w = 0.67, h = 1.00 },
  left70        = { x = 0.00, y = 0.00, w = 0.67, h = 1.00 },
  left30        = { x = 0.00, y = 0.00, w = 0.33, h = 1.00 },
  mid30         = { x = 0.33, y = 0.00, w = 0.33, h = 1.00 },
  mid67         = { x = 0.167, y = 0.00, w = 0.67, h = 1.00 },
  top50         = { x = 0.00, y = 0.00, w = 1.00, h = 0.50 },
  bot50         = { x = 0.00, y = 0.50, w = 1.00, h = 0.50 },
  left50        = { x = 0.00, y = 0.00, w = 0.50, h = 1.00 },
  right50       = { x = 0.50, y = 0.00, w = 0.50, h = 1.00 },
  upright30     = { x = 0.67, y = 0.00, w = 0.33, h = 0.67 },
  botright30    = { x = 0.67, y = 0.67, w = 0.33, h = 0.33 },
  upleft70      = { x = 0.00, y = 0.00, w = 0.67, h = 0.50 },
  botleft70     = { x = 0.00, y = 0.50, w = 0.67, h = 0.50 },
  upleft25      = { x = 0.00, y = 0.00, w = 0.50, h = 0.50 },
  botleft25     = { x = 0.00, y = 0.50, w = 0.50, h = 0.50 },
  upright25     = { x = 0.50, y = 0.00, w = 0.50, h = 0.50 },
  botright25    = { x = 0.50, y = 0.50, w = 0.50, h = 0.50 },
  maximum       = { x = 0.00, y = 0.00, w = 1.00, h = 1.00 }
}

mash = { 'alt', 'ctrl', 'cmd' }
hs.hotkey.bind(mash, 'g', function() hs.window.focusedWindow():move(units.right30,    nil, true) end)
hs.hotkey.bind(mash, 't', function() hs.window.focusedWindow():move(units.right70,     nil, true) end)
hs.hotkey.bind(mash, 'e', function() hs.window.focusedWindow():move(units.left70,     nil, true) end)
hs.hotkey.bind(mash, 'd', function() hs.window.focusedWindow():move(units.left30,     nil, true) end)
hs.hotkey.bind(mash, 'f', function() hs.window.focusedWindow():move(units.mid30,     nil, true) end)
hs.hotkey.bind(mash, 'r', function() hs.window.focusedWindow():move(units.mid67,     nil, true) end)
hs.hotkey.bind(mash, ']', function() hs.window.focusedWindow():move(units.upright30,  nil, true) end)
hs.hotkey.bind(mash, '[', function() hs.window.focusedWindow():move(units.upleft70,   nil, true) end)
hs.hotkey.bind(mash, ';', function() hs.window.focusedWindow():move(units.botleft70,  nil, true) end)
hs.hotkey.bind(mash, "'", function() hs.window.focusedWindow():move(units.botright30, nil, true) end)
hs.hotkey.bind(mash, 'return', function() hs.window.focusedWindow():move(units.maximum,    nil, true) end)
hs.hotkey.bind(mash, 'left', function() hs.window.focusedWindow():move(units.left50,      nil, true) end)
hs.hotkey.bind(mash, 'right', function() hs.window.focusedWindow():move(units.right50,      nil, true) end)
hs.hotkey.bind(mash, 'up', function() hs.window.focusedWindow():move(units.top50,      nil, true) end)
hs.hotkey.bind(mash, 'down', function() hs.window.focusedWindow():move(units.bot50,      nil, true) end)
hs.hotkey.bind(mash, 'Q', function() hs.window.focusedWindow():move(units.upleft25,      nil, true) end)
hs.hotkey.bind(mash, 'A', function() hs.window.focusedWindow():move(units.botleft25,      nil, true) end)
hs.hotkey.bind(mash, 'W', function() hs.window.focusedWindow():move(units.upright25,      nil, true) end)
hs.hotkey.bind(mash, 'S', function() hs.window.focusedWindow():move(units.botright25,      nil, true) end)

-- move windows
hs.hotkey.bind(mash, 'H', hs.grid.pushWindowLeft)
hs.hotkey.bind(mash, 'J', hs.grid.pushWindowDown)
hs.hotkey.bind(mash, 'K', hs.grid.pushWindowUp)
hs.hotkey.bind(mash, 'L', hs.grid.pushWindowRight)
-- hs.hotkey.bind(mash, 'R', function() rescue_windows() end)

-- resize windows
hs.hotkey.bind(mash, 'Y', hs.grid.resizeWindowThinner)
hs.hotkey.bind(mash, 'U', hs.grid.resizeWindowShorter)
hs.hotkey.bind(mash, 'I', hs.grid.resizeWindowTaller)
hs.hotkey.bind(mash, 'O', hs.grid.resizeWindowWider)

-- Window Hints
hs.hotkey.bind('ctrl-cmd', 'F', hs.hints.windowHints)
hs.hints.hintChars = {'D','S','F','A','J','K','L'}
