//
//  WeatherMapper.swift
//  droplets
//
//  Created by Lareen Melo on 10/19/24.
//

struct WeatherMapper {
	static func decode(response: WeatherResponse) -> Weather {
		Weather(
			id: response.id,
			temperature: response.main.temp,
			description: .init(
				title: response.weather.first?.main ?? "",
				body: response.weather.first?.description ?? ""
			)
		)
	}

	struct WeatherResponse: Decodable {
		let id: Int
		let weather: [WeatherData]
		let main: MainData

		struct WeatherData: Decodable {
			let main: String
			let description: String
		}

		struct MainData: Decodable {
			///  Default temperature is in Kelvin
			let temp: Double
		}
	}
}
