//
//  Weather.swift
//  droplets
//
//  Created by Lareen Melo on 10/19/24.
//

struct Weather {
	let id: Int
	let temperature: Double
	let description: Weather.Description

	struct Description {
		let title: String
		let body: String
	}
}

