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

export const feature_tail_color_list: Feature<string[]> = {
  name: 'Tail colors',
  component: FeatureTriColorInput,
};

export const feature_head_markings_1: FeatureChoiced = {
  name: 'a. Head Markings',
  component: FeatureDropdownInput,
};

export const feature_head_markings_1_color_list: Feature<string[]> = {
  name: 'a. Head Markings Colors',
  component: FeatureTriColorInput,
};

export const feature_head_markings_2: FeatureChoiced = {
  name: 'aa. Head Markings 2',
  component: FeatureDropdownInput,
};

export const feature_head_markings_2_color_list: Feature<string[]> = {
  name: 'aa. Head Markings 2 Colors',
  component: FeatureTriColorInput,
};

export const feature_head_markings_3: FeatureChoiced = {
  name: 'aaa. Head Markings 3',
  component: FeatureDropdownInput,
};

export const feature_head_markings_3_color_list: Feature<string[]> = {
  name: 'aaa. Head Markings 3 Colors',
  component: FeatureTriColorInput,
};

export const feature_chest_markings_1: FeatureChoiced = {
  name: 'b. Chest Markings',
  component: FeatureDropdownInput,
};

export const feature_chest_markings_1_color_list: Feature<string[]> = {
  name: 'b. Chest Markings Colors',
  component: FeatureTriColorInput,
};

export const feature_chest_markings_2: FeatureChoiced = {
  name: 'bb. Chest Markings 2',
  component: FeatureDropdownInput,
};

export const feature_chest_markings_2_color_list: Feature<string[]> = {
  name: 'bb. Chest Markings 2 Colors',
  component: FeatureTriColorInput,
};

export const feature_chest_markings_3: FeatureChoiced = {
  name: 'bbb. Chest Markings 3',
  component: FeatureDropdownInput,
};

export const feature_chest_markings_3_color_list: Feature<string[]> = {
  name: 'bbb. Chest Markings 3 Colors',
  component: FeatureTriColorInput,
};

export const feature_left_arm_markings_1: FeatureChoiced = {
  name: 'c. Left Arm Markings',
  component: FeatureDropdownInput,
};

export const feature_left_arm_markings_1_color_list: Feature<string[]> = {
  name: 'c. Left Arm Markings Colors',
  component: FeatureTriColorInput,
};

export const feature_left_arm_markings_2: FeatureChoiced = {
  name: 'cc. Left Arm Markings 2',
  component: FeatureDropdownInput,
};

export const feature_left_arm_markings_2_color_list: Feature<string[]> = {
  name: 'cc. Left Arm Markings 2 Colors',
  component: FeatureTriColorInput,
};

export const feature_left_arm_markings_3: FeatureChoiced = {
  name: 'ccc. Left Arm Markings 3',
  component: FeatureDropdownInput,
};

export const feature_left_arm_markings_3_color_list: Feature<string[]> = {
  name: 'ccc. Left Arm Markings 3 Colors',
  component: FeatureTriColorInput,
};

export const feature_left_hand_markings_1: FeatureChoiced = {
  name: 'd. Left Hand Markings',
  component: FeatureDropdownInput,
};

export const feature_left_hand_markings_1_color_list: Feature<string[]> = {
  name: 'd. Left Hand Markings Colors',
  component: FeatureTriColorInput,
};

export const feature_left_hand_markings_2: FeatureChoiced = {
  name: 'dd. Left Hand Markings 2',
  component: FeatureDropdownInput,
};

export const feature_left_hand_markings_2_color_list: Feature<string[]> = {
  name: 'dd. Left Hand Markings 2 Colors',
  component: FeatureTriColorInput,
};

export const feature_left_hand_markings_3: FeatureChoiced = {
  name: 'ddd. Left Hand Markings 3',
  component: FeatureDropdownInput,
};

export const feature_left_hand_markings_3_color_list: Feature<string[]> = {
  name: 'ddd. Left Hand Markings 3 Colors',
  component: FeatureTriColorInput,
};

export const feature_right_arm_markings_1: FeatureChoiced = {
  name: 'e. Right Arm Markings',
  component: FeatureDropdownInput,
};

export const feature_right_arm_markings_1_color_list: Feature<string[]> = {
  name: 'e. Right Arm Markings Colors',
  component: FeatureTriColorInput,
};

export const feature_right_arm_markings_2: FeatureChoiced = {
  name: 'ee. Right Arm Markings 2',
  component: FeatureDropdownInput,
};

export const feature_right_arm_markings_2_color_list: Feature<string[]> = {
  name: 'ee. Right Arm Markings 2 Colors',
  component: FeatureTriColorInput,
};

export const feature_right_arm_markings_3: FeatureChoiced = {
  name: 'eee. Right Arm Markings 3',
  component: FeatureDropdownInput,
};

export const feature_right_arm_markings_3_color_list: Feature<string[]> = {
  name: 'eee. Right Arm Markings 3 Colors',
  component: FeatureTriColorInput,
};

export const feature_right_hand_markings_1: FeatureChoiced = {
  name: 'f. Right Hand Markings',
  component: FeatureDropdownInput,
};

export const feature_right_hand_markings_1_color_list: Feature<string[]> = {
  name: 'f. Right Hand Markings Colors',
  component: FeatureTriColorInput,
};

export const feature_right_hand_markings_2: FeatureChoiced = {
  name: 'ff. Right Hand Markings 2',
  component: FeatureDropdownInput,
};

export const feature_right_hand_markings_2_color_list: Feature<string[]> = {
  name: 'ff. Right Hand Markings 2 Colors',
  component: FeatureTriColorInput,
};

export const feature_right_hand_markings_3: FeatureChoiced = {
  name: 'fff. Right Hand Markings 3',
  component: FeatureDropdownInput,
};

export const feature_right_hand_markings_3_color_list: Feature<string[]> = {
  name: 'fff. Right Hand Markings 3 Colors',
  component: FeatureTriColorInput,
};

export const feature_left_leg_markings_1: FeatureChoiced = {
  name: 'g. Left Leg Markings',
  component: FeatureDropdownInput,
};

export const feature_left_leg_markings_1_color_list: Feature<string[]> = {
  name: 'g. Left Leg Markings Colors',
  component: FeatureTriColorInput,
};

export const feature_left_leg_markings_2: FeatureChoiced = {
  name: 'gg. Left Leg Markings 2',
  component: FeatureDropdownInput,
};

export const feature_left_leg_markings_2_color_list: Feature<string[]> = {
  name: 'gg. Left Leg Markings 2 Colors',
  component: FeatureTriColorInput,
};

export const feature_left_leg_markings_3: FeatureChoiced = {
  name: 'ggg. Left Leg Markings 3',
  component: FeatureDropdownInput,
};

export const feature_left_leg_markings_3_color_list: Feature<string[]> = {
  name: 'ggg. Left Leg Markings 3 Colors',
  component: FeatureTriColorInput,
};

export const feature_left_foot_markings_1: FeatureChoiced = {
  name: 'h. Left Foot Markings',
  component: FeatureDropdownInput,
};

export const feature_left_foot_markings_1_color_list: Feature<string[]> = {
  name: 'h. Left Foot Markings Colors',
  component: FeatureTriColorInput,
};

export const feature_left_foot_markings_2: FeatureChoiced = {
  name: 'hh. Left Foot Markings 2',
  component: FeatureDropdownInput,
};

export const feature_left_foot_markings_2_color_list: Feature<string[]> = {
  name: 'hh. Left Foot Markings 2 Colors',
  component: FeatureTriColorInput,
};

export const feature_left_foot_markings_3: FeatureChoiced = {
  name: 'hhh. Left Foot Markings 3',
  component: FeatureDropdownInput,
};

export const feature_left_foot_markings_3_color_list: Feature<string[]> = {
  name: 'hhh. Left Foot Markings 3 Colors',
  component: FeatureTriColorInput,
};

export const feature_right_leg_markings_1: FeatureChoiced = {
  name: 'i. Right Leg Markings',
  component: FeatureDropdownInput,
};

export const feature_right_leg_markings_1_color_list: Feature<string[]> = {
  name: 'i. Right Leg Markings Colors',
  component: FeatureTriColorInput,
};

export const feature_right_leg_markings_2: FeatureChoiced = {
  name: 'ii. Right Leg Markings 2',
  component: FeatureDropdownInput,
};

export const feature_right_leg_markings_2_color_list: Feature<string[]> = {
  name: 'ii. Right Leg Markings 2 Colors',
  component: FeatureTriColorInput,
};

export const feature_right_leg_markings_3: FeatureChoiced = {
  name: 'iii. Right Leg Markings 3',
  component: FeatureDropdownInput,
};

export const feature_right_leg_markings_3_color_list: Feature<string[]> = {
  name: 'iii. Right Leg Markings 3 Colors',
  component: FeatureTriColorInput,
};

export const feature_right_foot_markings_1: FeatureChoiced = {
  name: 'j. Right Foot Markings',
  component: FeatureDropdownInput,
};

export const feature_right_foot_markings_1_color_list: Feature<string[]> = {
  name: 'j. Right Foot Markings Colors',
  component: FeatureTriColorInput,
};

export const feature_right_foot_markings_2: FeatureChoiced = {
  name: 'jj. Right Foot Markings 2',
  component: FeatureDropdownInput,
};

export const feature_right_foot_markings_2_color_list: Feature<string[]> = {
  name: 'jj. Right Foot Markings 2 Colors',
  component: FeatureTriColorInput,
};

export const feature_right_foot_markings_3: FeatureChoiced = {
  name: 'jjj. Right Foot Markings 3',
  component: FeatureDropdownInput,
};

export const feature_right_foot_markings_3_color_list: Feature<string[]> = {
  name: 'jjj. Right Foot Markings 3 Colors',
  component: FeatureTriColorInput,
};
