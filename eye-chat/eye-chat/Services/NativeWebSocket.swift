//
//  NativeWebSocket.swift
//  eye-chat
//
//  Created by alexdamascena on 02/04/23.
//

import Foundation

@available(iOS 13.0, *)
class NativeWebSocket: NSObject, WebSocketProvider {
    
    var delegate: WebSocketProviderDelegate?
    private var socket: URLSessionWebSocketTask?
    private let url: URL
    private lazy var session = URLSession(configuration: .default,
                                          delegate: self,
                                          delegateQueue: nil)
    
    init(url: URL){
        self.url = url
        super.init()
    }
    
    func connect() {
        let socket = session.webSocketTask(with: url)
        socket.resume()
        self.socket = socket
        readMessage()
    }
    
    private func readMessage(){
        self.socket?.receive{ [weak self] message in
            
            guard let self = self else { return }
            
            switch message {
                
            case .success(.data(let data)):
                self.delegate?.webSocket(self, didReceiveData: data)
                self.readMessage()
                
            case .success:
                debugPrint("Expected to receive data format but received a string")
                self.readMessage()
                
            case .failure:
                self.disconnect()
            }
        }
    }
    
    func send(data: Data) {
        self.socket?.send(.data(data)){ _ in} 
    }
    
    private func disconnect() {
        self.socket?.cancel()
        self.socket = nil
        self.delegate?.webSocketDidDisconnect(self)
    }
}

@available(iOS 13.0, *)
extension NativeWebSocket: URLSessionWebSocketDelegate, URLSessionDelegate  {
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        self.delegate?.webSocketDidConnect(self)
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        self.disconnect()
    }
}
