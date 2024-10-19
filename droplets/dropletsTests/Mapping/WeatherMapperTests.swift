//
//  WeatherMapperTests.swift
//  dropletsTests
//
//  Created by Lareen Melo on 10/19/24.
//

import droplets
import Foundation
import Testing

let weatherResponse = """

{
	"id": 5122280,
	"main": {
		"temp": 291.6
	},
	"weather": [
		{
			"main": "Clouds",
			"description": "few clouds"
		},
		{
			"main": "Clouds",
			"description": "few clouds"
		}
	]
}

"""

struct WeatherMapperTests {

    @Test
	func dataMapperDecodesData() throws {
		let validData = weatherResponse.data(using: .utf8) ?? Data()
		let	weatherResponse = try JSONDecoder().decode(WeatherMapper.WeatherResponse.self, from: validData)

		#expect(weatherResponse != nil)
    }

	@Test
	func dataMapperDecodesDataToWeather() throws {
		let validData = weatherResponse.data(using: .utf8) ?? Data()
		let	weatherResponse = try JSONDecoder().decode(WeatherMapper.WeatherResponse.self, from: validData)
		let weather = WeatherMapper.decode(response: weatherResponse)

		#expect(weather != nil)
		#expect(weather.temperature == 291.6)
		#expect(weather.description.title == "Clouds")
		#expect(weather.description.body == "few clouds")
	}
}
