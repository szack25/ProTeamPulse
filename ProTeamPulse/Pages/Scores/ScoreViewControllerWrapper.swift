//
//  ScoreViewControllerWrapper.swift
//  ProTeamPulse
//
//  Created by Sam Zack on 8/21/23.
//

import SwiftUI

struct ScoresViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        let scoresViewController = ScoresViewController()
        let navigationController = UINavigationController(rootViewController: scoresViewController)
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
    }
}
