const WebSocket = require("ws")
const { app } = require('./express')

const wss = new WebSocket.Server({ port: 8080}, () => {
    console.log("[EYE-CHAT-SERVER]: SIGNALING SERVER IS LISTENING ON 8080")
})

const isPossibleToBroadcast = (currentClient, data, onWs) => {
    return currentClient !== onWs && currentClient.readyState == WebSocket.OPEN
}

const hasToSendToSelf = (currentClient, data, onWs) => {
    return currentClient === onWs && currentClient.readyState == WebSocket.OPEN
}

wss.broadcast = (ws, data) => {
    wss.clients.forEach((client) => {
        if(isPossibleToBroadcast(client, data, ws)) client.send(data)
    })
}

wss.sendSelf = (ws, data) => {
    wss.clients.forEach((client) => {
        if(hasToSendToSelf(client, data, ws)) client.send(data)
    })
}

wss.on("connection", (ws) => {
    console.log(`[EYE-SERVER-CHAT]: CLIENT CONNECTED. ${wss.clients.size} CONNECTED`);


    ws.onmessage = (message) => {
        wss.broadcast(ws, message.data);
    }

    ws.onclose = () => {
        console.log(`[EYE-SERVER-CHAT]: CLIENT DISCONECTED. ${wss.clients.size} CONNECTED`);
    }
})

app.listen(8081, () => {
    console.log("Server listening")
})