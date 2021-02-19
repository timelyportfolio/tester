import { reactShinyInput } from 'reactR';

const TextInput = ({ configuration, value, setValue }) => {
  return <input type='text' value={value} onChange={e => setValue(e.target.value)}/>;
};

reactShinyInput('.withchildren', 'tester.withchildren', TextInput);