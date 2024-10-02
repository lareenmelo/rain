//
//  LoadWeather.swift
//  droplets
//
//  Created by Lareen Melo on 9/23/24.
//

import Testing

protocol DataLoader {
	func get(completion: @escaping () -> Void)
}

class APIDataLoader: DataLoader {
	func get(completion: @escaping () -> Void) {
		completion()
	}
}

struct DataLoadingTests {
	private let sut = MockDataLoader()

	@Test("Data Loader Calls")
	func dataLoaderCallCount() {
		sut.get { }

		#expect(sut.callCount == 1)

		sut.get { }
		sut.get { }

		#expect(sut.callCount == 3)
	}


	private class MockDataLoader: DataLoader {
		var callCount = 0

		func get(completion: @escaping () -> Void) {
			callCount += 1
		}
	}
}
