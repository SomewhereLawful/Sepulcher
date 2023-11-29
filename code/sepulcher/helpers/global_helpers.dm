//changes foundry metal supply value
/proc/change_foundry_supply_value(amount)
	GLOB.foundry_metal_supply = max(0, GLOB.foundry_metal_supply + amount)
