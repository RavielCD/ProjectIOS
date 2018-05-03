//
//  API.swift
//  Project
//
//  Created by William Cisneros on 01/05/2018.
//  Copyright © 2018 William Cisneros. All rights reserved.
//

import Foundation

public class API {
    private let baseURL: String
    private let apiKey: String

    public init(url: String, key: String) {
        baseURL = url
        apiKey = key
    }

    public func APIRequest(subURL: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let url = "\(baseURL)\(subURL)"
        print(url)
        let request = NSMutableURLRequest(url: URL(string: url)!)
        request.setValue(apiKey, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"

        let requestAPI = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: completion)
        requestAPI.resume()
    }
}
