//
//  API_Caller.swift
//  ProTeamPulse
//
//  Created by Sam Zack on 8/24/23.
//

import Foundation

final class MLBAPICaller {
    static let shared = MLBAPICaller()
    

    
    struct Constants {
        static let MLBAPIKey = ProcessInfo.processInfo.environment["MLB_API_KEY"]
        
    }
    
    private init() {
        
    }
    
}

    
    struct MLBData: Codable {
        let homeTeam: String
        let awayTeam: String
        let currentBatter: String
        let currentPitcher: String
        let currentPitcherImg: URL
        let currentBatterImg: URL
        var homeScore: Int
        var awayScore: Int
        var currentInning: Int
        var currentStrikes: Int
        var currentBalls: Int
        var currentOuts: Int
    }

    
