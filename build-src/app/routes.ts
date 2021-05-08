import express from 'express'
import mongoose from 'mongoose'

import { Card } from './models/Card'

export const router = express.Router()

router.get("/cards", async (req, res) => {
    const cards = await Card.find()
    res.send(cards)
})

router.get("/cards/:id", async (req, res) => {
    const id = req.params.id
    
    // TODO: What if we do not check this - how to return 500?
    if (! mongoose.Types.ObjectId.isValid(id)) {
        res.status(404).send()
        return
    }
    
    const card = await Card.findOne({ _id: id })
    if (card !== null) {
        res.send(card)
    } else {
        res.status(404).send()
    }
})

router.post("/cards", async (req, res) => {
    const card = new Card({
        title: req.body.title,
        priority: req.body.priority,
    })
    await card.save()
    res.send(card)
})
