//
//  ContentView.swift
//  droplets
//
//  Created by Lareen Melo on 9/21/24.
//

import SwiftUI

struct ContentView: View {
	@State var isConnected: Bool = false

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
				.tint(isConnected ? .green : .red)
            Text("Hello, world!")
        }
		.onAppear {
			APIDataLoader().get { result in
				switch result {
				case .success:
					isConnected = true
				case .failure:
					isConnected = false
				}
			}
		}
        .padding()
    }
}

#Preview {
    ContentView()
}
