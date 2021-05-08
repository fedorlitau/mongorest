import { model, Schema, Model, Document } from 'mongoose'

interface ICard extends Document {
    title: string;
    priority: string;
}

const CardSchema: Schema = new Schema({
    title: String,
    priority: String,
})

export const Card: Model<ICard> = model("Card", CardSchema)
