import { useState } from 'react';
import { Box, Button, Image, Section, Stack } from 'tgui-core/components';

import { resolveAsset } from '../assets';
import { useBackend } from '../backend';
import { Window } from '../layouts';

export type ExaminePanelData = {
  name: string;
  flavor_text: string;
  flavor_text_nsfw: string;
  custom_species_name: string;
  custom_species_lore: string;
  ooc_notes: string;
  ooc_notes_nsfw: string;
  headshot_url: string;
};

export const ExaminePanel = (props) => {
  const { data } = useBackend<ExaminePanelData>();
  const [oocNotesIndex, setOocNotesIndex] = useState('SFW');
  const [flavorTextIndex, setFlavorTextIndex] = useState('SFW');

  return (
    <Window title={data.name} width={920} height={700} theme="mojavesun">
      <Window.Content>
        <Stack fill>
          <Stack fill vertical>
            <Stack.Item align="center">
              <Image
                src={resolveAsset(data.headshot_url)}
                width="350px"
                height="350px"
              />
            </Stack.Item>
            <Stack.Item grow>
              <Stack fill>
                <Stack.Item grow width="300px">
                  <Section
                    scrollable
                    fill
                    title="OOC Notes"
                    preserveWhitespace
                    buttons={
                      <>
                        <Button
                          selected={oocNotesIndex === 'SFW'}
                          bold={oocNotesIndex === 'SFW'}
                          onClick={() => setOocNotesIndex('SFW')}
                          textAlign="center"
                          minWidth="60px"
                        >
                          SFW
                        </Button>
                        <Button
                          selected={oocNotesIndex === 'NSFW'}
                          disabled={!data.ooc_notes_nsfw}
                          bold={oocNotesIndex === 'NSFW'}
                          onClick={() => setOocNotesIndex('NSFW')}
                          textAlign="center"
                          minWidth="60px"
                        >
                          NSFW
                        </Button>
                      </>
                    }
                  >
                    {oocNotesIndex === 'SFW' && <Box>{data.ooc_notes}</Box>}
                    {oocNotesIndex === 'NSFW' && (
                      <Box>{data.ooc_notes_nsfw}</Box>
                    )}
                  </Section>
                </Stack.Item>
              </Stack>
            </Stack.Item>
          </Stack>
          <Stack.Item grow>
            <Section
              scrollable
              fill
              preserveWhitespace
              title="Flavor Text"
              buttons={
                <>
                  <Button
                    selected={flavorTextIndex === 'SFW'}
                    bold={flavorTextIndex === 'SFW'}
                    onClick={() => setFlavorTextIndex('SFW')}
                    textAlign="center"
                    width="60px"
                  >
                    SFW
                  </Button>
                  <Button
                    selected={flavorTextIndex === 'NSFW'}
                    disabled={!data.flavor_text_nsfw}
                    bold={flavorTextIndex === 'NSFW'}
                    onClick={() => setFlavorTextIndex('NSFW')}
                    textAlign="center"
                    width="60px"
                  >
                    NSFW
                  </Button>
                  <Button
                    selected={flavorTextIndex === 'Species'}
                    bold={flavorTextIndex === 'Species'}
                    onClick={() => setFlavorTextIndex('Species')}
                    textAlign="center"
                    width="60px"
                  >
                    Species
                  </Button>
                </>
              }
            >
              {flavorTextIndex === 'SFW' && (
                <Box maxWidth="100%">{data.flavor_text}</Box>
              )}
              {flavorTextIndex === 'NSFW' && (
                <Box maxWidth="100%">{data.flavor_text_nsfw}</Box>
              )}
              {flavorTextIndex === 'Species' && (
                <Section title={data.custom_species_name}>
                  <Box maxWidth="100%">{data.custom_species_lore}</Box>
                </Section>
              )}
            </Section>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
