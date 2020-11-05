//
//  RestaurantViewModel.swift
//  MVVM_RxSwiift
//
//  Created by Alan Silva on 05/11/20.
//

import Foundation

struct RestaurantViewModel {

    private let restaurant: Restaurant
    
    var displayText: String {
        return "\(restaurant.id)) " + restaurant.name + " - " + restaurant.cuisine
    }
    
    var nameExt: String {
        return "\(restaurant.id)) " + restaurant.name
    }

    var categoryCuisine: String {
        return restaurant.cuisine
    }

    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }
    
}

