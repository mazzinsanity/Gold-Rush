/mob/living/carbon/human/apply_damage(damage, \
							damagetype = BRUTE, \
							def_zone = null, \
							blocked = FALSE, \
							forced = FALSE, \
							spread_damage = FALSE, \
							wound_bonus = 0, \
							bare_wound_bonus = 0, \
							sharpness = NONE, \
							attack_direction = null, \
							reduced = 0, \
							edge_protection = 0, \
							subarmor_flags = NONE)
	return dna.species.apply_damage(damage, \
									damagetype, \
									def_zone, \
									blocked, \
									src, \
									forced, \
									spread_damage, \
									wound_bonus, \
									bare_wound_bonus, \
									sharpness, \
									attack_direction, \
									reduced, \
									edge_protection, \
									subarmor_flags)
