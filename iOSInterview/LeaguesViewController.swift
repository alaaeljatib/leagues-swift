//
//  LeaguesViewController.swift
//  iOSInterview
//
//  Created by Alaa Eljatib Etmaz Alsebaei on 2019-03-13.
//  Copyright © 2019 thescore. All rights reserved.
//

import UIKit

class LeaguesViewController: UIViewController {
    
    @IBOutlet weak var leagueTableView: UITableView!
    
    var leagues : [League] = []
    var selectedTeams: [Team] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Leagues"
        
        self.leagues =  SportsAPI.instance.leagues()
        
        self.setupTableView(self.leagueTableView)
    }
    
    func setupTableView(_ tableView: UITableView) {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // nibs
        
        let nib = UINib(nibName: leagueTableViewCellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: leagueTableViewCellIdentifier)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == leagueSegueIdentifier {
            if let vc = segue.destination as? LeagueDetailsViewController {
                vc.teams = self.selectedTeams
            }
        }
    }
}

extension LeaguesViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: leagueTableViewCellIdentifier) as? LeagueTableViewCell else {
            return UITableViewCell()
        }
        let league = self.leagues[indexPath.row]
        cell.configureCell(with: league.name)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedTeams = self.leagues[indexPath.row].teams
        
        self.performSegue(withIdentifier: leagueSegueIdentifier, sender: self)
    }
}
