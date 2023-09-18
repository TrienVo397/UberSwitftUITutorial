//
//  LocationSearchViewModel.swift
//  UberSwitftUITutorial
//
//  Created by kiet on 17/09/2023.
//

// to complete an unfinished search of users and populate the search results
import SwiftUI
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject {
    
    // MARK: - Property
    //In practical terms, that means whenever an object with a property marked @Published is changed, all views using that object will be reloaded to reflect those changes.
    @Published var results = [MKLocalSearchCompletion]()// a fully-form string that complete a partial string
    @Published var selectedLocationCoordinate: CLLocationCoordinate2D?// when it get published it sends a notification to the views that are listening for changes
    
    
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
    
    // MARK: - helpers
    func selectLocation(_ localSearch :MKLocalSearchCompletion){// storing the location
        locationSearch(forLocalSearchCompletion: localSearch){
            response, error in
            if let error = error {
                print("DEBUG: Location search failed with error \(error.localizedDescription)")
                return
            }
            guard let item = response?.mapItems.first else{return}
            let coordinate = item.placemark.coordinate // to get an actual coordinate associated with the selectec location that user has selected
            self.selectedLocationCoordinate = coordinate
            print("DEBUG: selected lcoation is \(coordinate)")
            
        }
        
        
        //self.selectedLocation = location
    // print("DEBUG: selected lcoation is \(self.selectedLocation)")
    }
    
    func locationSearch(forLocalSearchCompletion localSearch: MKLocalSearchCompletion, completion: @escaping MKLocalSearch.CompletionHandler) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchRequest)
        
        search.start(completionHandler: completion)
        
    }
    /*In the method signature func selectLocation(_ location: String), the underscore (_) before the parameter name location indicates that the parameter is unnamed or unlabelled.
     By using an underscore, you are specifying that the parameter should be called without an explicit label when invoking the method. It allows you to omit the parameter name when calling the method, resulting in a more concise syntax.
     For example:*/
}

// MARK: - MKLocalSearchCompleterDelegate
 
extension LocationSearchViewModel: MKLocalSearchCompleterDelegate{
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results // the most recently received search completions
    }
    
}
