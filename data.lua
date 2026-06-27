data:extend({
  {
    type = "selection-tool",
    name = "instant-kill-tool",
    icon = "__base__/graphics/icons/deconstruction-planner.png",
    icon_size = 64,
    -- WICHTIG FÜR 2.1: "spawnable" erlaubt der Shortcut-Bar das Erschaffen!
    flags = {"only-in-cursor", "spawnable"}, 
    hidden = false, -- MUSS in 2.1 auf false stehen, sonst blockiert die Shortcut-Bar!
    subgroup = "tool",
    order = "c[automated-construction]-z[instant-kill]",
    stack_size = 1,
    
    select = {
      border_color = {r = 1, g = 0, b = 0},
      cursor_box_type = "not-allowed",
      mode = {"deconstruct"},
      ignore_cannot_select_entities = true,
      ignore_cannot_select_tiles = true
    },
    alt_select = {
      border_color = {r = 1, g = 0, b = 0},
      cursor_box_type = "not-allowed",
      mode = {"deconstruct"},
      ignore_cannot_select_entities = true,
      ignore_cannot_select_tiles = true
    },
    
    selection_color = {r = 1, g = 0, b = 0},
    alt_selection_color = {r = 1, g = 0, b = 0},
    entity_filter_slots = 0
  },
  {
    type = "recipe",
    name = "instant-kill-tool",
    enabled = true,
    -- Blendet das Rezept komplett vor den Augen des Spielers im Baumenü aus
    hide_from_player_crafting = true, 
    ingredients = {
      {type = "item", name = "iron-plate", amount = 1}
    },
    results = {{type = "item", name = "instant-kill-tool", amount = 1}}
  },
  {
    type = "custom-input",
    name = "get-instant-kill-tool-hotkey",
    key_sequence = "SHIFT + K",
    consuming = "none"
  },
  {
    type = "shortcut",
    name = "give-instant-kill-tool-shortcut",
    action = "spawn-item",          
    item_to_spawn = "instant-kill-tool", 
    icon = "__base__/graphics/icons/deconstruction-planner.png",
    icon_size = 64,
    small_icon = "__base__/graphics/icons/deconstruction-planner.png",
    small_icon_size = 64
  }
})
