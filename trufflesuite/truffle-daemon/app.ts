import express from 'express';
import * as http from 'http';
import * as bodyparser from 'body-parser';
import cors from 'cors'
import morgan, { StreamOptions } from 'morgan';
import moment from 'moment-timezone';
const helmet = require("helmet");
const path = require("path");


import Logger from './config/winston-logger';
import { ErrorHandler } from './common/error';
import { CommonRoutesConfig } from './common/common.routes.config';

const SERVER_PORT: number = 3000;
//const Logger = require('./config/logger')(module);
const loggerFormat: string = '[Access] :method :url :status :res[content-type] :res[content-length]/bytes - :response-time/ms';
const app: express.Application = express();
const server: http.Server = http.createServer(app);
const routes: Array<CommonRoutesConfig> = [];
const favicon = Buffer.from('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', 'base64');

const stream: StreamOptions ={
    write: (message: string) =>  Logger.info(message)
}

function skipLog (req: express.Request, res: express.Response) {
    let url: string = req.url;
    if(url.toLowerCase().trim().startsWith('/info')) {
        return true;
    }
    if(url.indexOf('?')>0)
        url = url.substr(0,url.indexOf('?'));
    if(url.match(/(js|jpg|png|ico|css|woff|woff2|eot)$/ig)) {
        return true;
    }
    return false;
}

app.get("/favicon.ico", function(req, res) {
    res.statusCode = 200;
    res.setHeader('Content-Length', favicon.length);
    res.setHeader('Content-Type', 'image/x-icon');
    res.setHeader("Cache-Control", "public, max-age=2592000");                // expiers after a month
    res.setHeader("Expires", new Date(Date.now() + 2592000000).toUTCString());
    res.end(favicon);
});

app.use(morgan(loggerFormat, { skip: skipLog, stream }));
app.use(bodyparser.text({ limit: '50mb' }));
app.use(bodyparser.json({ limit: '50mb' }));
app.use(bodyparser.urlencoded({ extended: true, limit: '50mb' }));
app.use(cors());
app.use('/RichMedias', express.static(path.join(__dirname, '..', 'static')));

app.get('/', (req: express.Request, res: express.Response) => {
    res.status(200).send(`TruffleDaemonServer running at http://0.0.0.0:${SERVER_PORT}`)
});

app.get('/home', (req: express.Request, res: express.Response) => {
    res.status(200).send(`This is Home page.`)
});

app.use((req, res, next) => {
    if(res.status(404)) {
        res.statusMessage = 'Page Not Found';
        res.status(404).json({ code: 404, message: '[TruffleDaemonServer](Not Found)' });
    }
});

app.use((err: Error, req: express.Request, res: express.Response, next: express.NextFunction) => {
    ErrorHandler.handle(400, err, res);
});

process.on('unhandledRejection', (err: Error) => {
    Logger.error(`unhandledRejection: errorName=${err.name}, errorMessage=${err.message}, stack=${err.stack}`);
});

server.listen(SERVER_PORT, () => {
    Logger.info(`TruffleDaemonServer running [${process.env.ENV || 'development'}] on http://0.0.0.0:${SERVER_PORT} at ${moment().format('YYYY-MM-DDTHH:mm:ssZ')}`);
    routes.forEach((route: CommonRoutesConfig) => {
        Logger.info(`Routes configured for ${route.getName()}`);
    });
});
