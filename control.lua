-- 1. Reagiert auf den Tastatur-Hotkey (SHIFT + K)
script.on_event("get-instant-kill-tool-hotkey", function(event)
    local player = game.get_player(event.player_index)
    if not player or not player.valid then return end
    
    if player.cursor_stack and player.cursor_stack.valid_for_read and player.cursor_stack.name == "instant-kill-tool" then
        player.cursor_stack.clear()
    else
        player.cursor_stack.set_stack({name = "instant-kill-tool", count = 1})
    end
end)

-- 2. Die Tötungs-Logik über den Koordinaten-Suchbefehl beim Rahmenziehen
script.on_event(defines.events.on_player_selected_area, function(event)
    if event.item == "instant-kill-tool" then
        local player = game.get_player(event.player_index)
        if not player or not player.valid then return end

        local targets = player.surface.find_entities_filtered{
            area = event.area,
            force = "enemy"
        }

        local killed_count = 0
        for _, entity in pairs(targets) do
            if entity.valid then
                if entity.type == "unit-spawner" or entity.type == "turret" then
                    entity.surface.create_entity{
                        name = "big-explosion", 
                        position = entity.position
                    }
                end
                entity.die()
                killed_count = killed_count + 1
            end
        end
        
        if killed_count > 0 then
            player.print({"message.enemies-pulverized", killed_count})
        end
    end
end)
