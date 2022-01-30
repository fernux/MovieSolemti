//
//  ContentView.swift
//  MovieSolemti
//
//  Created by Fernando Arriaga on 27/01/22.
//

import SwiftUI

import SwiftUI


struct ContentView: View {
   
    @ObservedObject var viewRouter: ViewRouter
    let networkManager = NetworkManager()
    var body: some View {
        ZStack{
        VStack {
           if viewRouter.currentPageId == .login {
              LoginView(loginViewModel: LoginViewModel(router: viewRouter))
            } else if viewRouter.currentPageId == .home {
              MovieListView(viewModel:MovieListViewModel(router: viewRouter, networkManager: networkManager), viewRouter: viewRouter)
            }else if viewRouter.currentPageId == .profile {
                ProfileView(viewModel:ProfileViewModel(router: viewRouter), viewRouter: viewRouter)
              }
           
        }
    }
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
        //MovieSmallCard()
    }
}
