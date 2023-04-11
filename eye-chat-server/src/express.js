const express = require('express')

const app = express();

var offer = true; 

app.get('/', (_, response) => {
    const currentOffer = offer;
    offer = !offer;
    return response.status(200).send({ offer: currentOffer })
})

module.exports = { app }