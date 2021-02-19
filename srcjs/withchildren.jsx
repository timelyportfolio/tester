import { reactShinyInput, hydrate } from 'reactR';

const TextInput = ({ configuration, value, setValue }) => {
  // destructure children and additional props/attribs
  const {children, attribs} = configuration

  return hydrate(
    {}, // if using components then provide them here wrapped in an object
    {
      name: 'div',
      attribs: attribs,
      children: children
    }
  )
};

reactShinyInput('.withchildren', 'tester.withchildren', TextInput);
