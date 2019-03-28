//
//  BundViewController.swift
//  LeaguesApp
//
//  Created by Alaa Eljatib Etmaz Alsebaei on 2019-03-13.
//  Copyright © 2019 thescore. All rights reserved.
//

import UIKit

class LeagueDetailsViewController: UIViewController {
    @IBOutlet weak var leagueDetailsTableView: UITableView!
    
    var teams : [Team] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.setupTableView(self.leagueDetailsTableView)
    }
    
    func setupTableView(_ tableView: UITableView) {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // nibs
        
        let nib = UINib(nibName: leagueDetailsTableViewCellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: leagueDetailsTableViewCellIdentifier)
        
    }
    
}

extension LeagueDetailsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: leagueDetailsTableViewCellIdentifier) as? LeagueDetailsTableViewCell else {
            return UITableViewCell()
        }
        let team = self.teams[indexPath.row]
        cell.configureCell(with: team.name,image: team.logo)
        
        return cell
    }

}
