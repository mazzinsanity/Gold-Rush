import { Feature, FeatureNumberInput } from '../base';

export const strength: Feature<number> = {
  name: '1. SPECIAL Strength',
  description:
    'SPECIAL stats are purely cosmetic. You can use the *strength or *str emote to do a Strength check for roleplay purposes.',
  component: FeatureNumberInput,
};

export const perception: Feature<number> = {
  name: '2. SPECIAL Perception',
  description:
    'SPECIAL stats are purely cosmetic. You can use the *perception or *per emote to do a Perception check for roleplay purposes.',
  component: FeatureNumberInput,
};

export const endurance: Feature<number> = {
  name: '3. SPECIAL Endurance',
  description:
    'SPECIAL stats are purely cosmetic. You can use the *endurance or *end emote to do an Endurance check for roleplay purposes.',
  component: FeatureNumberInput,
};

export const charisma: Feature<number> = {
  name: '4. SPECIAL Charisma',
  description:
    'SPECIAL stats are purely cosmetic. You can use the *charisma or *chr emote to do a Charisma check for roleplay purposes.',
  component: FeatureNumberInput,
};

export const intelligence: Feature<number> = {
  name: '5. SPECIAL Intelligence',
  description:
    'SPECIAL stats are purely cosmetic. You can use the *intelligence or *int emote to do an Intelligence check for roleplay purposes.',
  component: FeatureNumberInput,
};

export const agility: Feature<number> = {
  name: '6. SPECIAL Agility',
  description:
    'SPECIAL stats are purely cosmetic. You can use the *agility or *agi emote to do an Agility check for roleplay purposes.',
  component: FeatureNumberInput,
};

export const luck: Feature<number> = {
  name: '7. SPECIAL Luck',
  description:
    'SPECIAL stats are purely cosmetic. You can use the *luck or *lck emote to do a Luck check for roleplay purposes.',
  component: FeatureNumberInput,
};
