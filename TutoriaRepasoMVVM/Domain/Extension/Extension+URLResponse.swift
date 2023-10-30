//
//  Extension+URLResponse.swift
//  TutoriaRepasoMVVM
//
//  Created by Pedro on 30/10/23.
//

import Foundation


extension URLResponse {

    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}

