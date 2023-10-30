//
//  NetworkBootCamps.swift
//  TutoriaRepasoMVVM
//
//  Created by Pedro on 30/10/23.
//

import Foundation


//Protocolo
protocol NetworkBootCampsProtocol {
    func loadBootcamps(succes: @escaping sucesssClosure, onError: @escaping errorClosure) -> Void
}


final class NetworkBootCamps: NetworkBootCampsProtocol{
    func loadBootcamps(succes: @escaping sucesssClosure, onError: @escaping errorClosure) {
        let url = URL(string: "https://dragonball.keepcoding.education/api/data/bootcamps")
        var request : URLRequest = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            //control de errores
            if error != nil {
                onError()
                return
            }
  
            //evaluamos la respuesta
            if (response?.getStatusCode() == 200){
                do{
                    if let datos = data {
                        let responseData = try JSONDecoder().decode([BootCamps].self, from: datos)
                        succes(responseData)
                    }
                    else{
                        onError()
                    }
                }
                catch{
                    onError()
                }
            } else {
                //error
                print("error \(String(describing: response?.getStatusCode()))")
                onError()
                return
            }

        }
        
        task.resume()
    }
    
    
    
}


//Fake Success
final class NetworkBootCampsFakeSuccess: NetworkBootCampsProtocol{
    func loadBootcamps(succes: @escaping sucesssClosure, onError: @escaping errorClosure) {
        //Aqui siempre Mockeado..
        
        
        //execute the code after 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() ) {
            let model =    [BootCamps(id: UUID(), name: "Bootcamp 1"),
                            BootCamps(id: UUID(), name: "Bootcamp 2"),
                            BootCamps(id: UUID(), name: "Bootcamp 3")
                            ]
            //ejecuto la closure de exito
            succes(model)
        }
    }
    
    
}


final class NetworkBootCampsFakeError: NetworkBootCampsProtocol{
    func loadBootcamps(succes: @escaping sucesssClosure, onError: @escaping errorClosure) {
        //execute the code after 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            //ejecuto la closure de error
            onError()
        }
    }
    
    
}
