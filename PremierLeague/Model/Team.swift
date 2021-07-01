//
//  Team.swift
//  PremierLeague
//
//  Created by Idham on 29/06/21.
//

import UIKit

struct Team: Codable {
    var logo: String
    var name: String
    var desc: String
    var formedYear: String
    var stadium: String
    var website: String
    
    enum CodingKeys: String, CodingKey {
        case logo = "strTeamBadge"
        case name = "strTeam"
        case desc = "strDescriptionEN"
        case formedYear = "intFormedYear"
        case stadium = "strStadium"
        case website = "strWebsite"
    }
}

struct Response: Codable {
    var teams: [Team]
}
