//
//  KeyConstants.swift
//  Movies-MVVM
//
//  Created by Aya Essam on 9/27/20.
//  Copyright © 2020 Aya E Mahmoud. All rights reserved.
//

import Foundation

struct Key {
    
    static let DeviceType = "iOS"
    
    struct Headers {
        static let Authorization = "Authorization"
        static let ContentType = "Content-Type"
        static let MoviesApiKey = "81214f14b3b4fc4623c6b48bb307ab11"
        static let KEY_ApiName = "X-Api-Key"
        static let KEY_ApiValue = "55axvd80c2jxp31y"
        static let KEY_LANG = "Accept-Language"
        static let KEY_Authorization = "Authorization"
        static let KEY_ContentType = "Content-type"
        static let KEY_ContentTypeValue = "application/json"
        static let KEY_Encoding = "Accept-Encoding"
        static let KEY_EncodingValue = "application/json"
    }
    
    struct ErrorMessage {
        static let listNotFound = "ERROR_LIST_NOT_FOUND"
    }
}
