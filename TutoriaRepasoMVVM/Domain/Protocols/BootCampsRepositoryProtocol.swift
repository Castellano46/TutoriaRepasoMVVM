//
//  BootCampsRepositoryProtocol.swift
//  TutoriaRepasoMVVM
//
//  Created by Pedro on 30/10/23.
//

import Foundation

// se usará en caso de uso como inyeccion dependencias y en Repository
protocol BootCampsRepositoryProtocol {
    func loadBootcamps(succes: @escaping sucesssClosure, onError: @escaping errorClosure) -> Void
}

