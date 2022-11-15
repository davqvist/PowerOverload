-- data-updates
if mods["IndustrialRevolution"] then
  table.insert(data.raw.technology["ir2-steam-power"].effects, {
    type = "unlock-recipe",
    recipe = "po-transformer"
  })

  for i, effect in pairs(data.raw.technology["electric-energy-distribution-1"].effects) do
    if effect.type == "unlock-recipe" and effect.recipe == "po-transformer" then
      data.raw.technology["electric-energy-distribution-1"].effects[i] = nil
    end
  end
end

if mods["bzlead"] then
  table.insert(data.raw.recipe["po-huge-electric-pole"].ingredients, {"lead-plate", 10})
  table.insert(data.raw.recipe["po-huge-electric-fuse"].ingredients, {"lead-plate", 200})
  table.insert(data.raw.recipe["po-interface"].ingredients, {"lead-plate", 25})  
end

if mods["space-exploration"] then
  table.insert(data.raw.technology["se-energy-beam-defence"].prerequisites, "po-electric-energy-distribution-3")
end