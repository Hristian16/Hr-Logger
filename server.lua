Citizen.CreateThread(function()
    local discord = false
    local ip = false
    local steam = false
    local fivem = false
    local xbl = false
    
    for v,k in ipairs(GetPlayerIdentifiers(source)) do
        if string.match(v, 'steam') then
          local steam = v
        elseif string.match(v, 'discord') then
          local discord = v
        elseif string.match(v, 'fivem') then
          local fivem = v
        elseif string.match(v, 'ip') then
          local ip = v
        elseif string.match(v, 'xbl') then
          local xbl = v
        end
      local name = GetPlayerName(source)
      
      Mysql.Async.execute('INSERT INTO hr-logs (name, steam, discord, ip, fivem, xbl) (@username, @steamid, @discordid, @ip, @fivemid, @xblid)', {
        @username = name
        @steamid = steam
        @discordid = discord
        @ip = ip
        @fivemid = fivem
        @xblid = xbl
        })
end)
