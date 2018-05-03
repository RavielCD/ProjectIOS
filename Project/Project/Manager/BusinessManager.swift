//
//  BusinessManager.swift
//  Project
//
//  Created by William Cisneros on 02/05/2018.
//  Copyright © 2018 William Cisneros. All rights reserved.
//

import Foundation

final public class BusinessManager: Manager {
    public var onBusinessesChange: (() -> (Void))?
    public var onFiltredBusinessesChange: (() -> (Void))?
    var businesses: [Business] = []
    var filtredBusinesses: [Business] = []
    static let sharedInstance = BusinessManager()

    private init() {
        updateData(term: "bar")
    }

    public func updateData(term: String) {
        YelpService.init().getBar(term: term, latitude: "44.8404400", longitude: "-0.5805000") {data, response, error in
            if (error != nil) {
                print(error!.localizedDescription)
            }
            let yelpResponse = try! JSONDecoder().decode(YelpResponse.self, from: data!)
            self.businesses = yelpResponse.businesses
            self.filtredBusinesses = self.businesses

            self.onBusinessesChange?()
            self.onFiltredBusinessesChange?()
        }
    }

    public func getFiltredData(term: String) {
        YelpService.init().getBar(term: term, latitude: "44.8404400", longitude: "-0.5805000") {data, response, error in
            if (error != nil) {
                print(error!.localizedDescription)
            }
            let yelpResponse = try! JSONDecoder().decode(YelpResponse.self, from: data!)
            self.filtredBusinesses = yelpResponse.businesses

            self.onFiltredBusinessesChange?()
        }
    }
}
