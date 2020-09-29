//
//  MovieCell.swift
//  Movies-MVVM
//
//  Created by Aya Essam on 9/26/20.
//  Copyright © 2020 Aya E Mahmoud. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var overView: UILabel!
    @IBOutlet weak var releseDate: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
