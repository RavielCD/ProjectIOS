//
//  YelpService.swift
//  Project
//
//  Created by William Cisneros on 01/05/2018.
//  Copyright © 2018 William Cisneros. All rights reserved.
//

import Foundation

public class YelpService {
    let baseURL = "https://api.yelp.com/v3/businesses/search?"
    let apiKey = "Bearer -i2_RtObe_vHhaW4B09FUOvjTxNS0pQKmR5sxeqss_6uLGeQVC2mBqIZwBHP2cter3nytwIZ2-nC-n3PqokPz8AQypyV2wZEhQhdhBj8V-z8kM0IO8aINnMa1oXoWnYx"

    func getBar(term: String? = nil, latitude: String, longitude: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        if (term != nil) {
            API.init(url: baseURL, key: apiKey).APIRequest(subURL: initSubURL(term: term, latitude: latitude, longitude: longitude), completion: completion)
        }
    }

    func initSubURL(term: String?, latitude: String, longitude: String) -> String {
        var url = URLComponents(string: baseURL)!

        url.queryItems = [
            URLQueryItem(name: "term", value: term),
            URLQueryItem(name: "latitude", value: latitude),
            URLQueryItem(name: "longitude", value: longitude)
        ]

        return url.percentEncodedQuery!
    }
}
