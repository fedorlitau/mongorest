import express from 'express'
import { NextFunction, Request, Response } from 'express'
import mongoose from 'mongoose'

import { router } from "./routes"

function appStarted() {
    console.log("Server has started!")
}

function getIndex(req: Request, res: Response) {
    res.send('Welchome to MongoREST!')
}

function errorHandler(err: any, req: Request, res: Response, next: NextFunction) {
    console.log("****** Unhandled error ****** \n", err);
    if (res.headersSent) {
        return next(err)
    }
    res.status(500).send("Internal error occurred")
}

function setupApp() {
    const app = express()
    
    app.listen(3000, appStarted)
    app.use(express.json())
    app.use("/api", router)
    app.get("/", getIndex)
    app.use(errorHandler)
}

mongoose
    .connect("mongodb://mongodb:27017/some_random_db", { useNewUrlParser: true })
    .then(setupApp)

process.on("uncaughtException", function (err) {
    console.log("****** process.uncaughtException ****** \n", err);
});
