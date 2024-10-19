//
//  APIDataLoader.swift
//  droplets
//
//  Created by Lareen Melo on 10/15/24.
//

import Foundation

public protocol DataLoader {
	func get(completion: @escaping (Result<Weather, Error>) -> Void)
}

class APIDataLoader: DataLoader {
	func get(completion: @escaping (Result<Weather, Error>) -> Void) {
		guard let url = URL(string: "https://www.example.com") else { return }
		let request = URLRequest(url: url)

		URLSession.shared.dataTask(with: request) { data, response, error in
			do {
				guard let data = data else { return }
				let weatherResponse = try JSONDecoder().decode(WeatherMapper.WeatherResponse.self, from: data)
				let weatherData = WeatherMapper.decode(response: weatherResponse)
				completion(.success(weatherData))

			} catch {
				completion(.failure(error))
			}
		}.resume()
	}
}
