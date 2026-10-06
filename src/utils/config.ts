import 'dotenv/config';
import environments from '../data/environments.json';

type Environment = keyof typeof environments;

export const getBaseUrl = (): string => {
  const environment = (process.env.TEST_ENV || 'prod') as Environment;

  return environments[environment].baseUrl;
};

export const validUser = JSON.parse(process.env.validUser || '{}');