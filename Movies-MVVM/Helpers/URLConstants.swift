//
//  URLConstants.swift
//  Movies-MVVM
//
//  Created by Aya Essam on 9/27/20.
//  Copyright © 2020 Aya E Mahmoud. All rights reserved.
//

import Foundation

struct APPURL {
    
    private struct Domains {
        static let Dev = "https://api.themoviedb.org/3"
    }
    
    private struct Routes {
        static let Api = "" // for example api
    }
    
    private  struct Versions {
        static let Version1 = "" // for example V1
        static let Version2 = "" // for example V2
    }
    
    private static let Domain = Domains.Dev
 
    public static var BaseURL: String {
        return APPURL.Domain
    }
    
    struct Paths {
        static let MoviesUrl  =  "/movie/popular"
    }
    
}
