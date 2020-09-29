//
//  MoviesViewModel.swift
//  Movies-MVVM
//
//  Created by Aya Essam on 9/27/20.
//  Copyright © 2020 Aya E Mahmoud. All rights reserved.
//

import Foundation

class MoviesViewModel: ViewModelDelegate {
    
    weak var delegate: ViewControllerDelegate?
    var page = 1
    var movies: [Movie] = []
    
    func getMovies() {
        let moviesRequest = MoviesRequest(page: page)
            
        MoviesService.getMovies(moviesRequest: moviesRequest) { (movies, error) in
            if error == nil {
                if self.page == 1 {
                    self.movies = movies
                } else {
                    self.movies.append(contentsOf: movies)
                }
                    self.delegate?.getMoviesBack(movies: self.movies)
                }
            }
        }
    
    func sendValue(movies: [Movie]) {
        
    }
}
