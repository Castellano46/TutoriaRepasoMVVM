//
//  BootcampUseCase.swift
//  TutoriaRepasoMVVM
//
//  Created by Pedro on 30/10/23.
//

import Foundation


protocol caseUseBootcampProtocol {
    var repository: BootCampsRepositoryProtocol {get set}
    func loadBootcamps(succes: @escaping sucesssClosure, onError: @escaping errorClosure) -> Void
}

final class CaseUseBootCamp: caseUseBootcampProtocol {
    var repository : BootCampsRepositoryProtocol
    
    init(repository: BootCampsRepositoryProtocol = BootCampsRepository()){
        self.repository = repository
    }
    
    func loadBootcamps(succes: @escaping sucesssClosure, onError: @escaping errorClosure) {
        repository.loadBootcamps(succes: succes, onError: onError)
    }
}

//esta clase nos vale para diseño de UI de UIKIt y SwiftUI y Testing.
final class CaseUseBootCampFakeSuccess: caseUseBootcampProtocol{
    var repository : BootCampsRepositoryProtocol
    
    init(repository: BootCampsRepositoryProtocol = BootCampsRepository(network: NetworkBootCampsFakeSuccess())){
        self.repository = repository
    }
    
    func loadBootcamps(succes: @escaping sucesssClosure, onError:  @escaping errorClosure) -> Void{
       
        repository.loadBootcamps(succes: succes, onError: onError)
       
    }
}


//parar Testing, prueba del error
final class CaseUseBootCampFakeError: caseUseBootcampProtocol{
    
    var repository : BootCampsRepositoryProtocol
    
    init(repository: BootCampsRepositoryProtocol = BootCampsRepository(network: NetworkBootCampsFakeError())){
        self.repository = repository
    }
    
    func loadBootcamps(succes: @escaping sucesssClosure, onError: @escaping errorClosure) -> Void{
        repository.loadBootcamps(succes: succes, onError: onError)
    }
}
