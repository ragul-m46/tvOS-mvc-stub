//
//  NetworkRequestCalls.swift
//  CoffeeApp
//
//  Created by @ragul on 18/01/23.
//

import Foundation
import UIKit


public typealias Parameter = [String: String]
public typealias JSON = [String: Any]


final class GetCoffeeNetworkRequest: NetworkRequest {
    init() {
        
        super.init(.get, authorizationRequirement: .never)
        path = "coffee/hot"

    }
}

