import express from 'express';
import debug from 'debug';
import { AssertionError } from 'chai';

import Logger from '../config/winston-logger';

export class ErrorHandler extends Error {
  code: number;
  message: string;
  constructor(code: number, message: string) {
    super();
    this.code = code;
    this.message = message;
  }
  static handle(errCode: number, err: Error, res: express.Response) {
    if (err instanceof AssertionError) {
      const code = 413;
      const { message } = err;
      return res.status(200).json({ code: code, message: `Invalid-Params: \`${message.split(':')[0]}\``, app: 'TruffleDaemonServer' });
    }
    if (err instanceof ErrorHandler) {
      const { code, message } = err;
      Logger.info(`ErrorHandler: errorCode=${code}, errorMessage=${message}`);
      return res.status(200).json({ code: code, message: `Process-Failed: \`${message}\``, app: 'TruffleDaemonServer' });
    }
    Logger.error(`ErrorHandler: type=${typeof err}, errorCode=${errCode}, errorMessage=${err.message || err.stack?.toString().split('\n')[0]}, stack=${err.stack}`);
    return res.status(500).json({ code: 500, message: `Server-Internal-Error: \`${err.message || err.stack?.toString().split('\n')[0]}\``, app: 'TruffleDaemonServer' });
  }
}
