//
//  Weather.swift
//  droplets
//
//  Created by Lareen Melo on 10/19/24.
//

public struct Weather {
	public let id: Int
	public let temperature: Double
	public let description: Weather.Description

	public struct Description {
		public let title: String
		public let body: String
	}
}

