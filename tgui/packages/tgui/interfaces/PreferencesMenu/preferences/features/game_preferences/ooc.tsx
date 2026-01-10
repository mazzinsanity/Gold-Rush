import {
  CheckboxInput,
  Feature,
  FeatureColorInput,
  FeatureToggle,
} from '../base';

export const ooccolor: Feature<string> = {
  name: 'OOC color',
  category: 'CHAT',
  description: 'The color of your OOC messages.',
  component: FeatureColorInput,
};

export const enable_looc_runechat: FeatureToggle = {
  name: 'Enable LOOC runechat',
  category: 'RUNECHAT',
  description:
    "If TRUE, LOOC will appear above the speaker's head as well as in the chat.",
  component: CheckboxInput,
};
