//
//  URLSession+JSON.swift
//  IOS
//
//  Created by Ivan Sales Mendez on 15/3/24.
//

import Foundation

extension URLSession {
    
    struct ApiCallError: Error {
        
        public enum ApiErrorType{
            case RequestError(Error)
            case CantReadJson
            case CantParseJson(String)
        }
        
        let apiErrorType: ApiErrorType
    }
    
    static func getData<T:Decodable>(
        url: URL,
        onSuccess: @escaping (T) -> (),
        onFailure: @escaping (ApiCallError) -> ()) {
        
            let request = URLRequest(url: url)
            
            let task = shared.dataTask(with: request) { data, response, error in
                
                if let error = error {
                    DispatchQueue.main.async {
                        onFailure(ApiCallError(apiErrorType: .RequestError(error)))
                    }
                    return
                }
                
                guard let data = data, let jsonString = String(data: data, encoding: .utf8) else {
                    DispatchQueue.main.async {
                        onFailure(ApiCallError(apiErrorType: .CantReadJson ))
                    }
                    return
                }
                
                guard let parsedData = try? JSONDecoder().decode(T.self, from: data) else {
                    DispatchQueue.main.async {
                        onFailure(ApiCallError(apiErrorType: .CantParseJson(jsonString) ))
                    }
                    return
                }
                
                DispatchQueue.main.async {
                    onSuccess(parsedData)
                }
                
            }
            
            task.resume()
    }
}
