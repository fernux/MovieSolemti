//
//  MovieListViewModel.swift
//  MovieSolemti
//
//  Created by Fernando Arriaga on 28/01/22.
//

import Foundation
import SwiftUI
import Combine

/*
 * View Model class for Movie List (Home page)
 */
class MovieListViewModel: NSObject, ObservableObject, Identifiable {
  var networkManager: NetworkManager!
  let viewRouter:ViewRouter!


   
  private var pageCounter = 1
  let willChange = PassthroughSubject<Void, Never>()

  @Published var isPopularVisible: Bool = false
  @Published var isTopRatedVisible: Bool = false
  @Published var isOnTheAirVisible: Bool  = false
  @Published var isAiringTodayVisible: Bool  = false
    
  @Published var isItemSelect: Int = 0
    

  var popular: [Results] = [Results]() {
    willSet {
      willChange.send()
    }
  }

  var toprated: [Results] = [Results]() {
    willSet {
      willChange.send()
    }
  }
    var onTheAir: [Results] = [Results]() {
      willSet {
        willChange.send()
      }
    }
    var airingToday: [Results] = [Results]() {
      willSet {
        willChange.send()
      }
    }


  init(router:ViewRouter, networkManager:NetworkManager) {
    self.viewRouter = router
    self.networkManager = networkManager
  }

  func loadPopularTV() {
    //Only 1 page loaded.
    self.networkManager.getPopularTV(page: 1) { movies, error in
      DispatchQueue.main.async {
        if error == nil {
          self.popular = movies?.results ?? [Results]()
          self.isPopularVisible = true
        }
      }
    }
  }

  func loadTopRatedTV() {

    self.networkManager.getTopRatedTV(page: pageCounter) { movies, error in
      DispatchQueue.main.async {
        if error == nil {
          self.toprated = movies?.results ?? [Results]()
          self.isTopRatedVisible = true
        }
      }
    }
  }
    
    func loadOnTheAirTV() {

      self.networkManager.getOnTheAirTV(page: pageCounter) { movies, error in
        DispatchQueue.main.async {
          if error == nil {
            self.onTheAir = movies?.results ?? [Results]()
            self.isOnTheAirVisible = true
          }
        }
      }
    }
    
    func loadAiringTodayTV() {

      self.networkManager.getAiringTodayTV(page: pageCounter) { movies, error in
        DispatchQueue.main.async {
          if error == nil {
            self.airingToday = movies?.results ?? [Results]()
            self.isAiringTodayVisible = true
          }
        }
      }
    }




    @objc func performSelect(value:Int) {
        self.isItemSelect = value
  }
    
    func routerLoginButton() {
        viewRouter.currentPageId = .login
    }
    
    func routerProfileButton() {
        viewRouter.currentPageId = .profile
    }


}


