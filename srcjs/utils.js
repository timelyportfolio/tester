export function isDependency(value) {
  return (typeof value === 'object')
    && value.hasOwnProperty('name')
    && value.hasOwnProperty('version')
    && value.hasOwnProperty('src')
    && value.hasOwnProperty('script');
}
