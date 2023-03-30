const WebSocket = require("ws")

const wss = new WebSocket.Server({ port: 8080}, () => {
    console.log("[EYE-CHAT-SERVER]: SIGNALING SERVER IS LISTENING ON 8080")
})

const isPossibleToBroadcast = (currentClient, data, onWs) => {
    return currentClient !== onWs && currentClient.readyState == WebSocket.OPEN
}

wss.broadcast = (ws, data) => {
    wss.clients.forEach((client) => {
        if(isPossibleToBroadcast(client, data, ws)) client.send(data)
    })
}

wss.on("connection", (ws) => {
    console.log(`[EYE-SERVER-CHAT]: CLIENT CONNECTED. ${wss.clients.size} CONNECTED`);


    ws.onmessage = (message) => {
        console.log(`[EYE-SERVER-CHAT]: ${message.data}`);
        wss.broadcast(ws, message.data);
    }

    ws.onclose = () => {
        console.log(`[EYE-SERVER-CHAT]: CLIENT DISCONECTED. ${wss.clients.size} CONNECTED`);
    }
})