-- data-updates
if mods["IndustrialRevolution"] then  -- An experiment with leaving the transformer unlock until later with IR3
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

if mods["pyalternativeenergy"] then
  table.insert(data.raw.technology["electric-energy-distribution-3"].effects, {
    type = "unlock-recipe",
    recipe = "po-nexelit-power-fuse"
  })
end

if mods["bzlead"] then
  table.insert(data.raw.recipe["po-huge-electric-pole"].ingredients, {type="item", name="lead-plate", amount=10})
  table.insert(data.raw.recipe["po-huge-electric-fuse"].ingredients, {type="item", name="lead-plate", amount=200})
  table.insert(data.raw.recipe["po-interface"].ingredients, {type="item", name="lead-plate", amount=25})  
end

if mods["bzaluminum"] then
  table.insert(data.raw.recipe["po-huge-electric-pole"].ingredients, {type="item", name="acsr-cable", amount=4})
  table.insert(data.raw.recipe["po-huge-electric-fuse"].ingredients, {type="item", name="acsr-cable", amount=80})
  table.insert(data.raw.recipe["po-interface"].ingredients, {type="item", name="acsr-cable", amount=50})
end

if mods["space-exploration"] then
  table.insert(data.raw.technology["se-energy-beam-defence"].prerequisites, "po-electric-energy-distribution-3")
end