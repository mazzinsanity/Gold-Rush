import {
  Feature,
  FeatureChoiced,
  FeatureColorInput,
  FeatureDropdownInput,
  FeatureTriColorInput,
} from './base';

export const eye_color: Feature<string> = {
  name: 'Eye color',
  component: FeatureColorInput,
};

export const facial_hair_color: Feature<string> = {
  name: 'Facial hair color',
  component: FeatureColorInput,
};

export const facial_hair_gradient: FeatureChoiced = {
  name: 'Facial hair gradient',
  component: FeatureDropdownInput,
};

export const facial_hair_gradient_color: Feature<string> = {
  name: 'Facial hair gradient color',
  component: FeatureColorInput,
};

export const hair_color: Feature<string> = {
  name: 'Hair color',
  component: FeatureColorInput,
};

export const hair_gradient: FeatureChoiced = {
  name: 'Hair gradient',
  component: FeatureDropdownInput,
};

export const hair_gradient_color: Feature<string> = {
  name: 'Hair gradient color',
  component: FeatureColorInput,
};

export const feature_legs: FeatureChoiced = {
  name: 'Legs',
  component: FeatureDropdownInput,
};

export const feature_mcolor: Feature<string> = {
  name: 'Mutant color',
  component: FeatureColorInput,
};

export const underwear_color: Feature<string> = {
  name: 'Underwear color',
  component: FeatureColorInput,
};

export const feature_vampire_status: Feature<string> = {
  name: 'Vampire status',
  component: FeatureDropdownInput,
};

export const feature_frills_color_list: Feature<string[]> = {
  name: 'Frills colors',
  component: FeatureTriColorInput,
};

export const feature_horns_color_list: Feature<string[]> = {
  name: 'Horns colors',
  component: FeatureTriColorInput,
};

export const feature_snout_color_list: Feature<string[]> = {
  name: 'Snout colors',
  component: FeatureTriColorInput,
};

export const feature_spines: FeatureChoiced = {
  name: 'Spines',
  component: FeatureDropdownInput,
};

export const feature_spines_color_list: Feature<string[]> = {
  name: 'Spines colors',
  component: FeatureTriColorInput,
};

export const feature_ears_color_list: Feature<string[]> = {
  name: 'Ears colors',
  component: FeatureTriColorInput,
};

export const feature_antennae_color_list: Feature<string[]> = {
  name: 'Antennae colors',
  component: FeatureTriColorInput,
};

export const feature_mushcap_color_list: Feature<string[]> = {
  name: 'Cap colors',
  component: FeatureTriColorInput,
};

export const feature_wings_color_list: Feature<string[]> = {
  name: 'Wings colors',
  component: FeatureTriColorInput,
};

export const feature_moth_wings_color_list: Feature<string[]> = {
  name: 'Moth wings colors',
  component: FeatureTriColorInput,
};

export const feature_tail_color_list: Feature<string[]> = {
  name: 'Tail colors',
  component: FeatureTriColorInput,
};

export const feature_head_markings_1: FeatureChoiced = {
  name: 'Head markings',
  component: FeatureDropdownInput,
};

export const feature_head_markings_1_color_list: Feature<string[]> = {
  name: 'Head markings colors',
  component: FeatureTriColorInput,
};

export const feature_head_markings_2: FeatureChoiced = {
  name: 'Head markings 2',
  component: FeatureDropdownInput,
};

export const feature_head_markings_2_color_list: Feature<string[]> = {
  name: 'Head markings 2 colors',
  component: FeatureTriColorInput,
};

export const feature_head_markings_3: FeatureChoiced = {
  name: 'Head markings 3',
  component: FeatureDropdownInput,
};

export const feature_head_markings_3_color_list: Feature<string[]> = {
  name: 'Head markings 3 colors',
  component: FeatureTriColorInput,
};

export const feature_chest_markings_1: FeatureChoiced = {
  name: 'Chest markings',
  component: FeatureDropdownInput,
};

export const feature_chest_markings_1_color_list: Feature<string[]> = {
  name: 'Chest markings colors',
  component: FeatureTriColorInput,
};

export const feature_chest_markings_2: FeatureChoiced = {
  name: 'Chest markings 2',
  component: FeatureDropdownInput,
};

export const feature_chest_markings_2_color_list: Feature<string[]> = {
  name: 'Chest markings 2 colors',
  component: FeatureTriColorInput,
};

export const feature_chest_markings_3: FeatureChoiced = {
  name: 'Chest markings 3',
  component: FeatureDropdownInput,
};

export const feature_chest_markings_3_color_list: Feature<string[]> = {
  name: 'Chest markings 3 colors',
  component: FeatureTriColorInput,
};

export const feature_left_arm_markings_1: FeatureChoiced = {
  name: 'Left arm markings',
  component: FeatureDropdownInput,
};

export const feature_left_arm_markings_1_color_list: Feature<string[]> = {
  name: 'Left arm markings colors',
  component: FeatureTriColorInput,
};

export const feature_left_arm_markings_2: FeatureChoiced = {
  name: 'Left arm markings 2',
  component: FeatureDropdownInput,
};

export const feature_left_arm_markings_2_color_list: Feature<string[]> = {
  name: 'Left arm markings 2 colors',
  component: FeatureTriColorInput,
};

export const feature_left_arm_markings_3: FeatureChoiced = {
  name: 'Left arm markings 3',
  component: FeatureDropdownInput,
};

export const feature_left_arm_markings_3_color_list: Feature<string[]> = {
  name: 'Left arm markings 3 colors',
  component: FeatureTriColorInput,
};

export const feature_left_hand_markings_1: FeatureChoiced = {
  name: 'Left hand markings',
  component: FeatureDropdownInput,
};

export const feature_left_hand_markings_1_color_list: Feature<string[]> = {
  name: 'Left hand markings colors',
  component: FeatureTriColorInput,
};

export const feature_left_hand_markings_2: FeatureChoiced = {
  name: 'Left hand markings 2',
  component: FeatureDropdownInput,
};

export const feature_left_hand_markings_2_color_list: Feature<string[]> = {
  name: 'Left hand markings 2 colors',
  component: FeatureTriColorInput,
};

export const feature_left_hand_markings_3: FeatureChoiced = {
  name: 'Left hand markings 3',
  component: FeatureDropdownInput,
};

export const feature_left_hand_markings_3_color_list: Feature<string[]> = {
  name: 'Left hand markings 3 colors',
  component: FeatureTriColorInput,
};

export const feature_right_arm_markings_1: FeatureChoiced = {
  name: 'Right arm markings',
  component: FeatureDropdownInput,
};

export const feature_right_arm_markings_1_color_list: Feature<string[]> = {
  name: 'Right arm markings colors',
  component: FeatureTriColorInput,
};

export const feature_right_arm_markings_2: FeatureChoiced = {
  name: 'Right arm markings 2',
  component: FeatureDropdownInput,
};

export const feature_right_arm_markings_2_color_list: Feature<string[]> = {
  name: 'Right arm markings 2 colors',
  component: FeatureTriColorInput,
};

export const feature_right_arm_markings_3: FeatureChoiced = {
  name: 'Right arm markings 3',
  component: FeatureDropdownInput,
};

export const feature_right_arm_markings_3_color_list: Feature<string[]> = {
  name: 'Right arm markings 3 colors',
  component: FeatureTriColorInput,
};

export const feature_right_hand_markings_1: FeatureChoiced = {
  name: 'Right hand markings',
  component: FeatureDropdownInput,
};

export const feature_right_hand_markings_1_color_list: Feature<string[]> = {
  name: 'Right hand markings colors',
  component: FeatureTriColorInput,
};

export const feature_right_hand_markings_2: FeatureChoiced = {
  name: 'Right hand markings 2',
  component: FeatureDropdownInput,
};

export const feature_right_hand_markings_2_color_list: Feature<string[]> = {
  name: 'Right hand markings 2 colors',
  component: FeatureTriColorInput,
};

export const feature_right_hand_markings_3: FeatureChoiced = {
  name: 'Right hand markings 3',
  component: FeatureDropdownInput,
};

export const feature_right_hand_markings_3_color_list: Feature<string[]> = {
  name: 'Right hand markings 3 colors',
  component: FeatureTriColorInput,
};

export const feature_left_leg_markings_1: FeatureChoiced = {
  name: 'Left leg markings',
  component: FeatureDropdownInput,
};

export const feature_left_leg_markings_1_color_list: Feature<string[]> = {
  name: 'Left leg markings colors',
  component: FeatureTriColorInput,
};

export const feature_left_leg_markings_2: FeatureChoiced = {
  name: 'Left leg markings 2',
  component: FeatureDropdownInput,
};

export const feature_left_leg_markings_2_color_list: Feature<string[]> = {
  name: 'Left leg markings 2 colors',
  component: FeatureTriColorInput,
};

export const feature_left_leg_markings_3: FeatureChoiced = {
  name: 'Left leg markings 3',
  component: FeatureDropdownInput,
};

export const feature_left_leg_markings_3_color_list: Feature<string[]> = {
  name: 'Left leg markings 3 colors',
  component: FeatureTriColorInput,
};

export const feature_left_foot_markings_1: FeatureChoiced = {
  name: 'Left foot markings',
  component: FeatureDropdownInput,
};

export const feature_left_foot_markings_1_color_list: Feature<string[]> = {
  name: 'Left foot markings colors',
  component: FeatureTriColorInput,
};

export const feature_left_foot_markings_2: FeatureChoiced = {
  name: 'Left foot markings 2',
  component: FeatureDropdownInput,
};

export const feature_left_foot_markings_2_color_list: Feature<string[]> = {
  name: 'Left foot markings 2 colors',
  component: FeatureTriColorInput,
};

export const feature_left_foot_markings_3: FeatureChoiced = {
  name: 'Left foot markings 3',
  component: FeatureDropdownInput,
};

export const feature_left_foot_markings_3_color_list: Feature<string[]> = {
  name: 'Left foot markings 3 colors',
  component: FeatureTriColorInput,
};

export const feature_right_leg_markings_1: FeatureChoiced = {
  name: 'Right leg markings',
  component: FeatureDropdownInput,
};

export const feature_right_leg_markings_1_color_list: Feature<string[]> = {
  name: 'Right leg markings colors',
  component: FeatureTriColorInput,
};

export const feature_right_leg_markings_2: FeatureChoiced = {
  name: 'Right leg markings 2',
  component: FeatureDropdownInput,
};

export const feature_right_leg_markings_2_color_list: Feature<string[]> = {
  name: 'Right leg markings 2 colors',
  component: FeatureTriColorInput,
};

export const feature_right_leg_markings_3: FeatureChoiced = {
  name: 'Right leg markings 3',
  component: FeatureDropdownInput,
};

export const feature_right_leg_markings_3_color_list: Feature<string[]> = {
  name: 'Right leg markings 3 colors',
  component: FeatureTriColorInput,
};

export const feature_right_foot_markings_1: FeatureChoiced = {
  name: 'Right foot markings',
  component: FeatureDropdownInput,
};

export const feature_right_foot_markings_1_color_list: Feature<string[]> = {
  name: 'Right foot markings colors',
  component: FeatureTriColorInput,
};

export const feature_right_foot_markings_2: FeatureChoiced = {
  name: 'Right foot markings 2',
  component: FeatureDropdownInput,
};

export const feature_right_foot_markings_2_color_list: Feature<string[]> = {
  name: 'Right foot markings 2 colors',
  component: FeatureTriColorInput,
};

export const feature_right_foot_markings_3: FeatureChoiced = {
  name: 'Right foot markings 3',
  component: FeatureDropdownInput,
};

export const feature_right_foot_markings_3_color_list: Feature<string[]> = {
  name: 'Right foot markings 3 colors',
  component: FeatureTriColorInput,
};
