import winston from 'winston';
import moment from 'moment-timezone';

const t:any = winston.transports;

const level = () => {
  const env = process.env.NODE_ENV || 'development'
  const isDevelopment = env === 'development'
  return isDevelopment ? 'debug' : 'warn'
}

const formatConsole = winston.format.combine(
  winston.format.timestamp({ format: 'YYYY-MM-DDTHH:mm:ssZ' }),
  winston.format.printf(
    (meta) => {
      const { level, message, timestamp, namespace, stack, ...restMeta } = meta;
      return `${timestamp} ${level}: ${message.trim()}`;
    },
  ),
)

const Logger = winston.createLogger({
  transports: [
    new winston.transports.Console({ format: formatConsole }),
    new winston.transports.File({ format: formatConsole, filename: '/tmp/logs/defi-chainant-dixx/logs.log', level: level() })
  ],
})

export default Logger





