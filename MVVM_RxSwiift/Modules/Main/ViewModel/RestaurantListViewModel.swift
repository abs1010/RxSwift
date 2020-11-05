//
//  RestaurantListViewModel.swift
//  MVVM_RxSwiift
//
//  Created by Alan Silva on 05/11/20.
//

import Foundation
import RxSwift

final class RestaurantListViewModel {
    
    let title = "Restaurants"
    
    private let restaurantService: RestaurantServiceProtocol
    
    init(restaurantService: RestaurantServiceProtocol = RestaurantService()) {
        self.restaurantService = restaurantService
    }
    
    func fetchRestaurantViewModels() -> Observable<[RestaurantViewModel]> {
        restaurantService.getRestaurants().map { $0.map { RestaurantViewModel(restaurant: $0) } }
    }
    
}
