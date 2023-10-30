//
//  ViewModelBootcamps.swift
//  TutoriaRepasoMVVM
//
//  Created by Pedro on 30/10/23.
//

import Foundation


final class ViewModelBootCamps {
    
    //binding with UI
    var modelChange: (([BootCamps]) -> Void)?          //binding VM To UI
    var modelStatusload: ((StatusLoad) -> Void)?  //binding VM To UI
    
    //model
    var dataBoots : [BootCamps] = Array<BootCamps>()
    
    
    let caseUse: caseUseBootcampProtocol
    
    init(caseUse: caseUseBootcampProtocol = CaseUseBootCamp()){
        self.caseUse = caseUse
    }
    
    
    //load function
    func loadBoocamps(){
        
        //estado a loading
        modelStatusload?(.loading)
        
        //Llamo a la carga al Caso de uso
        caseUse.loadBootcamps { [weak self] boots in
            //En el hilo principal, para actualizar la UI
            DispatchQueue.main.async{
                self?.dataBoots = boots //the data
                self?.modelChange?(boots) //Send to UI
                self?.modelStatusload?(.loaded) //estado a loaded
            }
        } onError: {
            DispatchQueue.main.async{
                self.modelStatusload?(.error) //error
            }
        }
    }
    
}
