//
//  APIDataLoader.swift
//  droplets
//
//  Created by Lareen Melo on 10/15/24.
//

import Foundation

public protocol DataLoader {
	func get(completion: @escaping (Result<Data, Error>) -> Void)
}

class APIDataLoader: DataLoader {
	func get(completion: @escaping (Result<Data, Error>) -> Void) {
		guard let url = URL(string: "https://www.example.com") else { return }
		let request = URLRequest(url: url)

		URLSession.shared.dataTask(with: request) { data, response, error in
			if let error {
				completion(.failure(error))
			} else {
				guard let data = data else { return }
				completion(.success(data))
			}
		}.resume()
	}
}
