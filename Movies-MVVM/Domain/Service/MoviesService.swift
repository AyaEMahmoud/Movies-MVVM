//
//  MoviesService.swift
//  Movies-MVVM
//
//  Created by Aya Essam on 9/27/20.
//  Copyright © 2020 Aya E Mahmoud. All rights reserved.
//

import Foundation
import ObjectMapper
import Moya

class MoviesService {
    
   class func getMovies(moviesRequest:MoviesRequest, completionHandler: @escaping ([Movie] , Error?)-> Void) {

            let provider = MoyaProvider<MoviesApi>()
    
            provider.request(.getPopularMovies(moviesRequest: moviesRequest), completion: { result in
                switch result {
                case let .success(newsResponse):
                    do {
                        print(try newsResponse.mapJSON() as! [String : Any])
                        let movies = Mapper<Movies>().map(JSON:try newsResponse.mapJSON() as! [String : Any])
                        completionHandler(movies?.movie ?? [], nil)
                    } catch {
                        completionHandler([], error)
                    }
                    
                break
                case .failure(let error):
                    completionHandler([], error)
                    break
                }
                
            })
    }
}
