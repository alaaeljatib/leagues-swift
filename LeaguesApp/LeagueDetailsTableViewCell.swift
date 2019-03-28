//
//  LeagueDetailsTableViewCell.swift
//  LeaguesApp
//
//  Created by Alaa Eljatib Etmaz Alsebaei on 2019-03-13.
//  Copyright © 2019 Alaa Eljatib Etmaz Alsebaei. All rights reserved.
//

import UIKit
import SDWebImage

class LeagueDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    
    func configureCell(with name: String,image url: URL? ) {
        self.name.text = name
        
        
        self.logoImage.sd_setImage(with: url, completed:    nil)
    }
    
}
