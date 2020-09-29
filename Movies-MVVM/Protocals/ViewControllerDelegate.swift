//
//  ViewControllerDelegate.swift
//  Movies-MVVM
//
//  Created by Aya Essam on 9/27/20.
//  Copyright © 2020 Aya E Mahmoud. All rights reserved.
//

import Foundation

protocol ViewControllerDelegate: AnyObject {
    func getMoviesBack(movies: [Movie])
}
