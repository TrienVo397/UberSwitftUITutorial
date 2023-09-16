//
//  LocationSearchViewModel.swift
//  UberSwitftUITutorial
//
//  Created by kiet on 17/09/2023.
//

import SwiftUI
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject {
    
    // MARK: - Property
    
    @Published var results = [MKLocalSearchCompletion]()// a fully-form string that complete a partial string
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = ""{
        didSet{
            //print("DEBUG: Query fragment is \(queryFragment)")
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    override init() {
        super.init()// due to conforming to NSObject
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment// for example, 123 is query fragment for (123 E Fremont Ave Sunnyvale, CA, United States)
    }
}

// Mark - MKLocalSearchCompleterDelegate

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate{
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results // the most recently received search completions
    }
    
}
