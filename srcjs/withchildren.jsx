import { reactShinyInput, hydrate } from 'reactR';
import { isDependency } from './utils';

const InputWithChild = ({ configuration, value, setValue }) => {
  // destructure children and additional props/attribs
  // note we are ignoring value here but we will probably want to use
  const {children, attribs, deps} = configuration;

  if(typeof(deps) !== 'undefined') {
    Shiny.renderDependencies(deps);
  }

  return hydrate(
    {}, // if using components then provide them here wrapped in an object
    {
      name: 'div', // name of parent tag or component
      attribs: attribs, // props from destructured configuration
      children: children // child tags or components
    }
  );
};

reactShinyInput('.withchildren', 'tester.withchildren', InputWithChild);
