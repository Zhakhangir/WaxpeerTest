//
//  HomeViewModel.swift
//  WaxpeerTest
//
//  Created by Zhakhangir on 08.04.2024.
//

import UIKit
import Combine

enum HomeMarketItemType {
    case activate
    case skin(data: SkinItemModel)
}

class HomeViewModel {
    private let socketService = SocketService()
    private var addItemEvent =  SocketUserListenEvent.addItem
    private var subscribers = Set<AnyCancellable>()
    
    var dataSource = PassthroughSubject<[HomeMarketItemType], Never>()
    var currentDataSource = [HomeMarketItemType.activate]
    
    @Published var eventStatus = SocketListenResult(event: .disconnect)
    @Published var addItemLive = LiveP2PState.unsubsribed
    
    init() {
        dataSource.send(currentDataSource)
        socketService.connect()
        addSubscribers()
    }
    
    private func addSubscribers() {
        socketService.subjets.skins.sink { error in
            print(error)
        } receiveValue: { [weak self] skin in
            guard let self else { return }
            
            do  {
                let jsonData = try JSONSerialization.data(withJSONObject: skin.first, options: [])
                let skinItem = try JSONDecoder().decode(SkinItemModel.self, from: jsonData)
                
                self.currentDataSource.insert(.skin(data: skinItem), at: 1)
                self.dataSource.send(self.currentDataSource)
                
            } catch {
               print(error)
            }
        }.store(in: &subscribers)

        
        socketService.subjets.eventResult.sink { [weak self] error in
            print(error)
        } receiveValue: { [weak self]  result in
            self?.eventStatus = result
            
            switch result.event {
            case .subscribed:
                if (result.messageData?["name"] as? String) == self?.addItemEvent.rawValue {
                    self?.addItemLive = .subscribed
                }
            case .unsubscribed:
                if (result.messageData?["name"] as? String) == self?.addItemEvent.rawValue {
                    self?.addItemLive = .unsubsribed
                }
            case .error:
                if (result.messageData?["id"] as? String) == self?.addItemEvent.rawValue {
                    self?.addItemLive = .error
                }
            default: 
                return
            }
        }.store(in: &subscribers)

    }

    func toggleP2PState() {
        addItemLive == .unsubsribed ? socketService.subscribeTo(.addItem) : socketService.unsubscribeFrom(.addItem)
    }
    
    func disconnectSocket() {
        socketService.disconnect()
    }
    
    func connectSocket() {
        socketService.connect()
    }
}
