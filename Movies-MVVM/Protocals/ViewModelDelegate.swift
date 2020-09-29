//
//  ViewModelDelegate.swift
//  Movies-MVVM
//
//  Created by Aya Essam on 9/29/20.
//  Copyright © 2020 Aya E Mahmoud. All rights reserved.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    
    func sendValue(movies: [Movie])
    
}
