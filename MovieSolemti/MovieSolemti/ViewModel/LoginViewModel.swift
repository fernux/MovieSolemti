//
//  LoginViewModel.swift
//  MovieSolemti
//
//  Created by Fernando Arriaga on 27/01/22.
//


import Foundation
import SwiftUI

class LoginViewModel : ObservableObject {
  let viewRouter:ViewRouter!

  init(router:ViewRouter) {
    self.viewRouter = router
  }

  @Published var userName = "" {
    didSet {
      self.changeLoginButtonState()
    }
  }

  @Published var userPass = "" {
    didSet{
      self.changeLoginButtonState()
    }
  }

  @Published var isLoginEnable = false
      @Published var isLoginAlertShown = false

  private func changeLoginButtonState(){
    if (userName.count > 0 && userPass.count > 0) {
      self.isLoginEnable = true
    }
    else{
      self.isLoginEnable = false
    }
  }

  func validateLoginButton() {
    if (userName.lowercased() == Config.testUserName && userPass.lowercased() == Config.testPassword) {
      viewRouter.currentPageId = .home
    }
    else{
      self.isLoginEnable = false
      self.isLoginAlertShown = true
    }
  }
  
}

