//
//  RequestManager.swift
//  s2g
//
//  Created by Nikita Fedorenko on 30.12.2020.
//

import Foundation

class RequestManager<T>: NSObject, URLSessionDelegate, URLSessionDataDelegate where T: Codable & Decodable{
    
    public typealias ResultHandler = (T?, RequestError?) -> Void
    public var resultHandler : ResultHandler?
    
    var receivedData: Data?
    var fullUrl: URL
    
    private lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        
        //Authorization block
        //let auth = "Bearer ***paste token here***"
        //configuration.httpAdditionalHeaders = ["Authorization": auth]
        
        return URLSession(configuration: configuration,
                          delegate: self, delegateQueue: nil)
    }()
    
    init(fullUrl: URL) {
        self.fullUrl = fullUrl
    }
    
//    func startLoad() {
//        receivedData = Data()
//        let task = session.dataTask(with: fullUrl)
//        task.resume()
//    }
    
    func post(data: T) {
        var urlRequest = URLRequest(url: fullUrl)
        urlRequest.httpMethod = "POST"
        
        //media type is acceptable for body
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //media type is acceptable for response
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do{
            urlRequest.httpBody = try JSONEncoder().encode(data)
        }catch{
            print(error)
        }
        
        let task = session.dataTask(with: urlRequest)
        task.resume()
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        self.receivedData?.append(data)
    }
    
    func urlSession(_ session: URLSession, taskIsWaitingForConnectivity task: URLSessionTask){
        self.resultHandler?(nil, RequestError(code: 1004, description: "Waiting for connectivity"))
        //RequestResult(data: nil, error: nil, msg: "Waiting for connectivity")
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        print(receivedData ?? "")
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
