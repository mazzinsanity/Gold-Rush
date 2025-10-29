import { Feature, FeatureShortTextInput, FeatureTextInput } from '../base';

export const flavor_text: Feature<string> = {
  name: 'Flavor Text',
  component: FeatureTextInput,
};

export const flavor_text_nsfw: Feature<string> = {
  name: 'Flavor Text NSFW',
  component: FeatureTextInput,
};

export const custom_species_name: Feature<string> = {
  name: 'Custom Species Name',
  component: FeatureShortTextInput,
};

export const custom_species_lore: Feature<string> = {
  name: 'Custom Species Lore',
  component: FeatureTextInput,
};

export const ooc_notes: Feature<string> = {
  name: 'OOC Notes',
  component: FeatureTextInput,
};

export const ooc_notes_nsfw: Feature<string> = {
  name: 'OOC Notes NSFW',
  component: FeatureTextInput,
};

export const headshot_url: Feature<string> = {
  name: 'Headshot Image URL',
  description:
    "A https URL to a hosted image of your character's headshot. Must be: size 350x350px (larger images will be scaled down), a jpg/png/jpeg file, and hosted on either Gyazo (i.gyazo.com), Byondhome (files.byondhome.com), Imgbox (images2.imgbox.com) or Catbox (files.catbox.moe).",
  component: FeatureShortTextInput,
};
