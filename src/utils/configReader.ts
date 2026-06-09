import environments from '../data/environments.json';

type EnvironmentName = keyof typeof environments;

export const getBaseUrl = (): string => {
  const env = (process.env.TEST_ENV || 'prod') as EnvironmentName;

  return environments[env].baseUrl;
};