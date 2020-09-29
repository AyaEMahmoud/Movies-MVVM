//
//  ViewController.swift
//  Movies-MVVM
//
//  Created by Aya Essam on 9/26/20.
//  Copyright © 2020 Aya E Mahmoud. All rights reserved.
//

import UIKit
import Windless
import Kingfisher
import PullToRefreshKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!
    
    var windelssCount = 10
    var movies = [Movie]()
    var moviesViewModel = MoviesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        startWindless()
        initPullToRefresh()
        initLoadMore()
        moviesViewModel.delegate = self
        moviesViewModel.getMovies()
        
        // Do any additional setup after loading the view.
    }

    func registerCell() {
        movieTableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
    }
    
    func startWindless() {
        self.movieTableView.windless.apply {
            $0.beginTime = 0
            $0.pauseDuration = 1
            $0.duration = 1.5
            $0.animationLayerOpacity = 0.8
        }.start()
    }
    
    func initPullToRefresh() {
        self.movieTableView.configRefreshHeader(container: self) {
            self.moviesViewModel.page = 1
            self.moviesViewModel.getMovies()
        }
    }
    
    func initLoadMore() {
        self.movieTableView.configRefreshFooter(container: self) {
            self.moviesViewModel.page += 1
            self.moviesViewModel.getMovies()
        }
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "", message: "Nothing to show!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
        })
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension MoviesViewController: ViewControllerDelegate {
    func getMoviesBack(movies: [Movie]) {
        if movies.count > 0 {
            self.movieTableView.switchRefreshFooter(to: .normal)
            self.movieTableView.switchRefreshHeader(to: .normal(.success,0.0))

            self.movieTableView.windless.end()
            self.windelssCount = 0
            self.movies = movies
            self.movieTableView.reloadData()
        } else {
            showAlert()
        }
        
    }
}

extension MoviesViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
}

extension MoviesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if moviesViewModel.page == 1 && movies.count == 0 {
            return windelssCount
        }
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell
        if movies.count > 0 {
            let movie = movies[indexPath.row]
            cell?.releseDate.text = movie.releaseDate
            cell?.movieTitle.text = movie.title
            cell?.overView.text = movie.overview
            cell?.rating.text = String(describing: movie.voteAverage!)
            
            if let imageString = movie.posterPath, let url = URL(string: APPURL.BaseURL + imageString) {
                print("url \(url)")
                cell?.movieImage.kf.setImage(with: url)
            }
        }
        return cell!
    }

}
