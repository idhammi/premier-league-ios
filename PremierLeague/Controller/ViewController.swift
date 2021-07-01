//
//  ViewController.swift
//  PremierLeague
//
//  Created by Idham on 29/06/21.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var teamTableView: UITableView!
    
    private var teams: [Team] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Premier League"
        teamTableView.dataSource = self
        teamTableView.delegate = self
        teamTableView.register(UINib(nibName: "TeamTableViewCell", bundle: nil), forCellReuseIdentifier: "TeamCell")
        
        teams = getTeamsFromJson()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "AppPurple")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func getTeamsFromJson() -> [Team] {
        let decoder = JSONDecoder()
        guard
            let url = Bundle.main.url(forResource: "teams", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let response = try? decoder.decode(Response.self, from: data)
        else {
            return []
        }
        return response.teams
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath) as? TeamTableViewCell {
            let team = teams[indexPath.row]
            cell.nameTeam.text = team.name
            cell.descTeam.text = team.desc
            cell.logoTeam.kf.setImage(with: URL(string: team.logo))
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailViewController(nibName: "DetailViewController", bundle: nil)
        detail.team = teams[indexPath.row]
        self.navigationController?.pushViewController(detail, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
