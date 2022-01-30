//
//  ViewRouter.swift
//  MovieSolemti
//
//  Created by Fernando Arriaga on 27/01/22.
//

import Foundation
import Combine
import SwiftUI

enum PageId: Equatable {
  case login
  case home
  case profile
  case movieDetail(movieId:Int)
}

class ViewRouter: ObservableObject {

  let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    
  var currentPageId:PageId = UserDefaults.standard.isLoggedIn ? .home : .login {
    didSet {
      objectWillChange.send(self)
    }
  }

}
