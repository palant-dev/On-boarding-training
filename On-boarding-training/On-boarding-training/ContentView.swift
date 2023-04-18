//
//  ContentView.swift
//  On-boarding-training
//
//  Created by Antonio Palomba on 18/04/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("shouldShowOnBoarding") var shouldShowOnBoarding = true
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("You are in the main app now!")
            }
            .navigationTitle("Home")
            .padding()
        }
//        .onAppear(perform: deleteAppStorage)
        .fullScreenCover(isPresented: $shouldShowOnBoarding) {
            OnboardingView(shouldShowOnBoarding: $shouldShowOnBoarding)
        }

    }

    /// Use this function to flush AppStorage and test the onBoarding again
//    func deleteAppStorage() {
//        if let bundleID = Bundle.main.bundleIdentifier {
//            UserDefaults.standard.removePersistentDomain(forName: bundleID)
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
