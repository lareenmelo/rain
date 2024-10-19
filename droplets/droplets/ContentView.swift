//
//  ContentView.swift
//  droplets
//
//  Created by Lareen Melo on 9/21/24.
//

import SwiftUI

struct ContentView: View {
	@State var temperature: Double = 0.0

    var body: some View {
        VStack {
			Text("\(temperature)°K")
        }
		.onAppear {
			APIDataLoader().get { result in
				switch result {
					case .success(let weatherData):
					temperature = weatherData.temperature
				case .failure:
					temperature = 0.0
				}
			}
		}
        .padding()
    }
}

#Preview {
    ContentView()
}
