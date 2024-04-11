//
//  SocketExtensions.swift
//  WaxpeerTest
//
//  Created by Zhakhangir on 10.04.2024.
//

import UIKit
import SocketIO
import Combine

extension SocketIOClient {
    func listen(event: SocketUserListenEvent, subject:  PassthroughSubject<[Any], Error>) {
        on(event.rawValue) { items, _ in
            subject.send(items)
        }
    }
    
    func listen(event: SocketListenEvent, subject: PassthroughSubject<SocketListenResult, Error>) {
        on(event.rawValue) { message, _ in
            let dataMessage = (message as? [[String: Any]])?.first
            let result = SocketListenResult(event: event, messageData: dataMessage)
            subject.send(result)
        }
        

    }
}
