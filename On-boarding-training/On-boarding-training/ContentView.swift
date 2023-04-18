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
        .fullScreenCover(isPresented: $shouldShowOnBoarding) {
            OnboardingView(shouldShowOnBoarding: $shouldShowOnBoarding)
        }

    }
}

// Onboarding

struct OnboardingView: View {
    @Binding var shouldShowOnBoarding: Bool
    var body: some View {
        TabView {
            PageView(
                title: "Push Notifications",
                subtitle: "Enable notifications to stay up to date with friends.",
                imageName: "bell",
                showsDismissButton: false,
                shouldShowOnBoarding: $shouldShowOnBoarding
            )

            PageView(
                title: "Bookmarks",
                subtitle: "Save your favorite pieces of content.",
                imageName: "bookmark",
                showsDismissButton: false,
                shouldShowOnBoarding: $shouldShowOnBoarding
            )

            PageView(
                title: "Flights",
                subtitle: "Book flights to the places you want to go",
                imageName: "airplane",
                showsDismissButton: false,
                shouldShowOnBoarding: $shouldShowOnBoarding
            )

            PageView(
                title: "Home",
                subtitle: "Go home wherever you might be",
                imageName: "house",
                showsDismissButton: true,
                shouldShowOnBoarding: $shouldShowOnBoarding
            )
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct PageView: View {
    let title: String
    let subtitle: String
    let imageName: String
    let showsDismissButton: Bool
    @Binding var shouldShowOnBoarding: Bool

    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .padding()

            Text(title)
                .font(.system(size: 32))
                .padding()

            Text(subtitle)
                .font(.system(size: 24))
                .foregroundColor(Color(.secondaryLabel))
                .padding()

            if showsDismissButton == true {
                Button {
                    shouldShowOnBoarding.toggle()
                } label: {
                    Text("Get Started")
                        .frame(width: 200, height: 50)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(6)
                }

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
