//
//  ProfileViewModel.swift
//  MovieSolemti
//
//  Created by Fernando Arriaga on 29/01/22.
//

import Foundation


class ProfileViewModel : ObservableObject {
  let viewRouter:ViewRouter!

    init(router:ViewRouter) {
     self.viewRouter = router
    }
    func routerMovieListButton() {
        viewRouter.currentPageId = .home
    }
  
}


