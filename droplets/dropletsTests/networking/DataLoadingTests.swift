//
//  LoadWeather.swift
//  droplets
//
//  Created by Lareen Melo on 9/23/24.
//

import droplets
import Foundation
import Testing

struct DataLoadingTests {
	private let sut = MockAPIDataLoader()

	@Test("Data Loader Calls")
	func dataLoaderCallCount() {
		sut.get { _ in }

		#expect(sut.calls.count == 1)

		sut.get { _ in }
		sut.get { _ in }

		#expect(sut.calls.count == 3)
	}


	private class MockAPIDataLoader: DataLoader {
		var calls = [(Result<Data, Error>) -> Void]()

		func get(completion: @escaping (Result<Data, Error>) -> Void) {
			calls.append(completion)
		}
	}
}


//
//Test Cases
//- test that my get function gets called ✅
//- test that my get function gets called as many times as I call it ✅
//- test that my get function returns the right object
//- test that my get function returns an error if something happens
//
