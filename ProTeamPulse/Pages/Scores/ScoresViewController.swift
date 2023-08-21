//
//  ScoresViewController.swift
//  ProTeamPulse
//
//  Created by Sam Zack on 8/21/23.
//

import UIKit

class ScoresViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    let leagues = ["Major League Baseball", "National Football League", "NBA", "Soccer", "Hockey"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = "Sports Leagues"
    }
    
    // MARK: - UITableViewDelegate & UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueCell") ?? UITableViewCell(style: .default, reuseIdentifier: "LeagueCell")
        cell.textLabel?.text = leagues[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedLeague = leagues[indexPath.row]
        let leagueViewController = LeagueViewController(league: selectedLeague)
        navigationController?.pushViewController(leagueViewController, animated: true)
    }
}

class LeagueViewController: UIViewController {
    
    private let league: String
    
    init(league: String) {
        self.league = league
        super.init(nibName: nil, bundle: nil)
        title = league
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let label = UILabel()
        label.text = "Content for \(league)"
        label.textAlignment = .center
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        label.center = view.center
        view.addSubview(label)
    }
}
