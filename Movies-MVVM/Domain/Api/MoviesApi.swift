//
//  MoviesApi.swift
//  Movies-MVVM
//
//  Created by Aya Essam on 9/27/20.
//  Copyright © 2020 Aya E Mahmoud. All rights reserved.
//

import Foundation
import Moya

struct MoviesParamters {
    static let page = "page"
    static let apiKey = "api_key"
}

enum MoviesApi {
    case getPopularMovies(moviesRequest: MoviesRequest)
}

extension MoviesApi: TargetType {
    
    public var baseURL: URL { return URL(string: APPURL.BaseURL)! }
    
    public var path: String {
        switch self {
        case .getPopularMovies(_):
            return APPURL.Paths.MoviesUrl
        }
    }
    
    public var method: Moya.Method {
            return .get
    }
    
    public var task: Task {
        switch self {
            
        case .getPopularMovies(let moviesRequest):
            return .requestParameters(parameters: [MoviesParamters.page: moviesRequest.page, MoviesParamters.apiKey: Key.Headers.MoviesApiKey], encoding: URLEncoding.default)
        }
    }
    
    var sampleData: Data { return Data() }  
    
    public var headers: [String: String]? {
        return [Key.Headers.KEY_ContentType: Key.Headers.KEY_ContentTypeValue]
    }
}
