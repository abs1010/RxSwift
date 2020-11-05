//
//  RestaurantService.swift
//  MVVM_RxSwiift
//
//  Created by Alan Silva on 04/11/20.
//

import Foundation
import RxSwift

protocol RestaurantServiceProtocol {
    func getRestaurants() -> Observable<RestaurantArray>
}

typealias RestaurantArray = [Restaurant]

class RestaurantService: RestaurantServiceProtocol {
    
    func getRestaurants() -> Observable<RestaurantArray> {
        
        return Observable.create { observerObj -> Disposable in
            
            guard let path = Bundle.main.path(forResource: "restaurants", ofType: "json") else {
                let error = NSError(domain: "", code: -1, userInfo: nil)
                observerObj.onError(error)
                return Disposables.create { }
            }
            
            do {
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let decodeObject = try JSONDecoder().decode(RestaurantArray.self, from: data)
                
                observerObj.onNext(decodeObject)
                
            }catch {
                observerObj.onError(error)
            }
            
            return Disposables.create { }
            
        }
        
    }
    
}
