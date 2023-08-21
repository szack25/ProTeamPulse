//
//  ContentView.swift
//  ProTeamPulse
//
//  Created by Sam Zack on 8/17/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            ScoresViewControllerWrapper()
                .tabItem {
                    Image(systemName: "00.square.fill")
                    Text("Scores")
                }
            NewsViewControllerWrapper()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("News")
                }
            HighlightsView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Highlights")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
