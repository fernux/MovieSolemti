//
//  ProfileView.swift
//  MovieSolemti
//
//  Created by Fernando Arriaga on 29/01/22.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @ObservedObject var viewRouter: ViewRouter
    var body: some View {
        let fullPosterURL = URL.init(string:
        "https://cdn-icons-png.flaticon.com/512/219/219986.png")
        ZStack {
            NavigationView {
            VStack(alignment: .leading){
                HStack(alignment: .center, spacing: 16) {
                  WebImage(imageURL:fullPosterURL)
                        .cornerRadius(60)

                  VStack(alignment: .leading, spacing: 4, content: {
                    HStack {
                      Text("@Juan Aleman").foregroundColor(Color.green.opacity(0.75))
                    }

                  })
                   
                }
                .padding(8)
                ScrollView {
                    VStack(alignment: .leading) {
                        Spacer(minLength: 60)
                        ScrollView(.horizontal) {
                          HStack(spacing: 16) {
                              
                              Text("Favorite Shows").foregroundColor(.green)
                           /* ForEach($viewModel.upcoming.wrappedValue, id: \.self) { upcoming in
                              Button(action: {
                                isPresented = true
                                selectedMovieId = upcoming.id
                              }) {
                                MovieSmallCard(movie: upcoming)
                              }.padding(.bottom, 16.0)
                            }
                              */
                          }

                        }.padding(.horizontal)
                        .padding(.bottom)
                    }
                    
                }
            }.navigationTitle("Profile")
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            Button {
                                //showingAlert = true
                                self.viewModel.routerMovieListButton()
                            }label: {
                                Label("Return", systemImage: "xmark")
                            }
                           
                             
                            

                          
                        }
                    }
            }
        }

    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(router: ViewRouter()), viewRouter: ViewRouter())
    }
}
