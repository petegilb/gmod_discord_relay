Discord.commands['status'] = function()
    local plys = player.GetCount() .. '/' .. game.MaxPlayers()
    local plyList = ''
    local plysTable = player.GetAll()

    if #plysTable > 0 then
        for num, ply in ipairs(plysTable) do
            plyList = plyList .. ply:Nick() .. '\n'
        end
    else plyList = 'nobody ¯\\_(ツ)_/¯' end

    local form = {
        ['embeds'] = {{
            ['color'] = 5793266,
            ['title'] = GetHostName(),
            ['description'] = [[
**Connect** - steam://connect/]] .. game.GetIPAddress() .. [[

**Current Map** - ]] .. game.GetMap() .. [[

**Players** - ]] .. plys .. [[
            ]],
            ['fields'] = {{
                ['name'] = 'Player List',
                ['value'] = plyList
            }}
        }}
    }

    Discord.send(form)
end

Discord.commands['ping'] = function()
    local form = {
        ['content'] = ':ping_pong: pong'
    }

    Discord.send(form)
end