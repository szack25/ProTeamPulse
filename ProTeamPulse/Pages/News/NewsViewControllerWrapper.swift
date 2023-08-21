//
//  NewsViewControllerWrapper.swift
//  ProTeamPulse
//
//  Created by Sam Zack on 8/17/23.
//

import SwiftUI

struct NewsViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        let newsViewController = NewsViewController()
        let navigationController = UINavigationController(rootViewController: newsViewController)
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
    }
}
