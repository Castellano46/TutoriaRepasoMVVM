//
//  BootCampsRepository.swift
//  TutoriaRepasoMVVM
//
//  Created by Pedro on 30/10/23.
//

import Foundation

///protocolo viene del Domain-> Protocolos

final class BootCampsRepository: BootCampsRepositoryProtocol{
    
    
    private var network: NetworkBootCampsProtocol
    
    init(network: NetworkBootCampsProtocol = NetworkBootCamps()) {
        self.network = network
    }
    
    //inyectar el network...
    
    func loadBootcamps(succes: @escaping sucesssClosure, onError: @escaping errorClosure) {
        network.loadBootcamps(succes: succes, onError: onError)
        
    }
}
