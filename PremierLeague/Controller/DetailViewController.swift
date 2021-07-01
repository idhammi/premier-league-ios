//
//  DetailViewController.swift
//  PremierLeague
//
//  Created by Idham on 29/06/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var logoTeam: UIImageView!
    @IBOutlet weak var nameTeam: UILabel!
    @IBOutlet weak var formedYearTeam: UILabel!
    @IBOutlet weak var stadiumTeam: UILabel!
    @IBOutlet weak var websiteTeam: UILabel!
    @IBOutlet weak var descTeam: UILabel!
    
    var team: Team?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let result = team {
            logoTeam.kf.setImage(with: URL(string: result.logo))
            nameTeam.text = result.name
            formedYearTeam.text = result.formedYear
            stadiumTeam.text = result.stadium
            websiteTeam.text = result.website
            descTeam.text = result.desc
        }
    }
    
}
