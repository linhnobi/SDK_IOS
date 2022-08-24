//
//  HTTPClient.swift
//  AppDemo
//
//  Created by LinhNobi on 27/09/2021.
//

import Foundation
import UIKit

@available(iOSApplicationExtension, unavailable)
public class HTTPClient {
    
    typealias Handler<T: Codable> = (_ value: T?, _ error: Error?) -> Void

    static let shared = HTTPClient()
    private var session: URLSession
    var maxRetryTime = 3
    
    init() {
        session = URLSession.configured()
    }
    
    func request<T: Codable>(input: ServiceBaseRequest, completion: @escaping Handler<T>) {
                
        let analytics = MobioSDK.shared
        if analytics.configuration.trackable == false {
            let failApi = FailAPI(urlString: input.urlString, event: input.event, params: input.params, type: input.type)
            return
        }
        
        func startRetry(input: ServiceBaseRequest, counter: Int, error: BaseError) {
            if counter < maxRetryTime {
                callApi(input: input, counter: counter + 1)
            } else {
                completion(nil, error)
            }
        }
        
        func callApi(input: ServiceBaseRequest, counter: Int = 0) {
            print("------- debug ------ Retry --- event = \(input.event) = ", counter)
            let params = input.params
            let event = input.event
            
            guard let url = URL(string: input.urlString) else {
                return
            }
            let data = try? JSONSerialization.data(withJSONObject: params, options: [])
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = data
            session.dataTask(with: request) { data, response, error in
                guard error == nil else {
                    startRetry(input: input, counter: counter, error: BaseError.unexpectedError)
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse else {
                    startRetry(input: input, counter: counter, error: BaseError.unexpectedError)
                    return
                }
                print("\n\n-------- START REQUEST INPUT")
                print("url = ", input.urlString)
                print("event = ", event)
                print("param = ")
                DictionaryPrinter.printBeauty(with: params)
                print("------------ END REQUEST INPUT\n")
                print("------------ START Response --------")
                let statusCode = httpResponse.statusCode
                if statusCode == 200 {
                    let dictionaryResponse = ResponseParse.parseJson(from: data)
                    DictionaryPrinter.printBeauty(with: dictionaryResponse)
                    let result = JSONManager.decode(T.self, from: data!)
                    print("------ debug ------ retry ----- 200")
                    completion(result, nil)
                } else {
                    print("------ debug ------ retry ----- erro")

                    let baseError = BaseError.httpError(httpCode: statusCode)
                    print("------------- Base Error ------- ", baseError.errorMessage ?? "no error")
                    startRetry(input: input, counter: counter, error: baseError)
                }
                print("------------ END Response --------")
            }.resume()
        }
        
        callApi(input: input)
    }
}
