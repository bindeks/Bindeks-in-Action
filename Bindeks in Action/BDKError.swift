//
//  GoodCardsErrors.swift
//  GoodCards
//
//  Created by volodymyrkhmil on 11/1/16.
//  Copyright © 2016 GoodCards. All rights reserved.
//

enum BDKError: ErrorProtocol {
    
    case custom(error: Error, statusCode: Int?)
    
    
    //MARK: BDKError
    
    var statusCode: Int {
        switch self {
        case .custom(_, let statusCode):
            return statusCode ?? 0
        default:
            return -1
        }
    }
    
    var description: String {
        switch self {
        case .custom(let error, _):
            return error.localizedDescription
        }
    }
}
