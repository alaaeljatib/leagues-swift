//
//  LeagueTableViewCell.swift
//  LeaguesApp
//
//  Created by Alaa Eljatib Etmaz Alsebaei on 2019-03-13.
//  Copyright © 2019 thescore. All rights reserved.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
    
    

    func configureCell(with name: String) {
        self.name.text = name
    }
    
}
