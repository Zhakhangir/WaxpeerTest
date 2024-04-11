//
//  SocketService.swift
//  WaxpeerTest
//
//  Created by Zhakhangir on 10.04.2024.
//

//
//  SocketService.swift
//  WaxpeerTest
//
//  Created by Zhakhangir on 10.04.2024.
//

import SocketIO
import Combine
import UIKit

struct SocketListenResult {
    var event: SocketListenEvent
    var messageData: [String: Any]?
    
    var message: String {
        return (messageData?["message"] as? String) ?? ""
    }
}

enum SocketListenEvent: String, CaseIterable {
    case subscribed
    case unsubscribed
    case connect
    case disconnect
    case error
    case reconnect
    case reconnectAttempt
    
    var statusColor: UIColor? {
        switch self {
        case .connect, .subscribed, .unsubscribed:
            return R.color.wpGreen()
        case .disconnect:
            return R.color.wpGray()
        case .error:
            return R.color.wpRed()
        case .reconnect, .reconnectAttempt:
            return R.color.wpYellow()
        }
    }
}

enum SocketUserListenEvent: String, CaseIterable {
    case addItem = "add_item"
    case remove
}


final class SocketService {
    
    struct SocketEventSubject {
        let skins = PassthroughSubject<[Any], Error>()
        let removedSkins = PassthroughSubject<[Any], Error>()
        let eventResult = PassthroughSubject<SocketListenResult, Error>()
    }
    
    var subjets = SocketEventSubject()
    private var socket: SocketIOClient!
    private var manager: SocketManager!
    
    init() {
        start()
        addListeners()
    }
    
    private func start() {
        
        guard let authorizationHeader = KeychainService.shared.get(key: "Authorization") else  {
            print("Authorization Header not found in Keychain")
            return
        }
        
        guard let cookieHeader = KeychainService.shared.get(key: "Cookie") else  {
            print("Cookie Header not found in Keychain")
            return
        }
        
        guard let url = AppConstants.shared.socketURL else {
            print("Socket URL not valid")
            return
        }
        
        let requestHeaders: [String: String] = [
            "authorization": authorizationHeader,
            "Cookie": cookieHeader
        ]
        
        manager = SocketManager(socketURL: url, config: [ .compress, .secure(true), .forceWebsockets(true), .extraHeaders(requestHeaders), .log(true) ])
        socket = manager.defaultSocket
    }
    
    private func addListeners() {
        socket.listen(event: .connect, subject: subjets.eventResult)
        socket.listen(event: .disconnect, subject: subjets.eventResult)
        socket.listen(event: .error, subject: subjets.eventResult)
        socket.listen(event: .reconnect, subject: subjets.eventResult)
        socket.listen(event: .reconnectAttempt, subject: subjets.eventResult)
        socket.listen(event: .subscribed, subject: subjets.eventResult)
        socket.listen(event: .unsubscribed, subject: subjets.eventResult)
        
        socket.listen(event: .addItem, subject: subjets.skins)
        socket.listen(event: .remove, subject: subjets.removedSkins)
    }
    
    func connect() {
        socket.connect()
    }
    
    func disconnect() {
        socket.disconnect()
    }
    
    func subscribeTo(_ event: SocketUserListenEvent) {
        socket.emit("subscribe", ["name": event.rawValue])
    }
    
    func unsubscribeFrom(_ event: SocketUserListenEvent) {
        socket.emit("unsubscribe", ["name": event.rawValue])
    }
}
