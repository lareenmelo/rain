//
//  WeatherMapper.swift
//  droplets
//
//  Created by Lareen Melo on 10/19/24.
//

public struct WeatherMapper {
	public static func decode(response: WeatherResponse) -> Weather {
		Weather(
			id: response.id,
			temperature: response.main.temp,
			description: .init(
				title: response.weather.first?.main ?? "",
				body: response.weather.first?.description ?? ""
			)
		)
	}

	public struct WeatherResponse: Decodable {
		public let id: Int
		public let weather: [WeatherData]
		public let main: MainData

		public struct WeatherData: Decodable {
			public let main: String
			public let description: String
		}

		public struct MainData: Decodable {
			///  Default temperature is in Kelvin
			public let temp: Double
		}
	}
}
