//
//  RequestManager.swift
//  s2g
//
//  Created by Nikita Fedorenko on 30.12.2020.
//

import Foundation

class RequestManager: NSObject, URLSessionDelegate, URLSessionDataDelegate{
    
    public typealias ResultHandler = (Data?, RequestError?) -> Void
    public var resultHandler : ResultHandler?
    
    
    private lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        
        //Authorization block
        //let auth = "Bearer ***paste token here***"
        //configuration.httpAdditionalHeaders = ["Authorization": auth]
        
        return URLSession(configuration: configuration,
                          delegate: self, delegateQueue: nil)
    }()
    
    func post<T>(data: T, url: URL) where T: Codable & Decodable {
        var urlRequest = URLRequest(url: url)
        print(url)
        urlRequest.httpMethod = "POST"
        
        //media type is acceptable for body
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //media type is acceptable for response
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do{
            let jsonData = try JSONEncoder().encode(data)
            urlRequest.httpBody = jsonData
        }catch{
            print(error)
        }
        
        let task = session.dataTask(with: urlRequest)
        task.resume()
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        //self.receivedData?.append(data)
        
        //let jsonData = String(data: data, encoding: .utf8)!
        //print(jsonData)
        
        self.resultHandler?(data, nil)
    }
    
    func urlSession(_ session: URLSession, taskIsWaitingForConnectivity task: URLSessionTask){
        self.resultHandler?(nil, RequestError(code: 1004, description: "Waiting for connectivity"))
        //RequestResult(data: nil, error: nil, msg: "Waiting for connectivity")
        
        //self.requestError = RequestError(code: 1004, description: "Waiting for connectivity")
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        //print(receivedData ?? "")
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        guard let response = response as? HTTPURLResponse,
              (200...299).contains(response.statusCode) else {
            completionHandler(.cancel)
            return
        }
        completionHandler(.allow)
    }
}
