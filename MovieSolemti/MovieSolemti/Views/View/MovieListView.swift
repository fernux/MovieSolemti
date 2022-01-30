//
//  MovieListView.swift
//  MovieSolemti
//
//  Created by Fernando Arriaga on 28/01/22.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel: MovieListViewModel
    @ObservedObject var viewRouter: ViewRouter

    @State private var isPresented = false
    @State var selected:Int?
    @State private var showingAlert = false
    
 
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
       
    var body: some View {
        NavigationView {
            
            VStack{
                FilterView(viewModel: viewModel)
                TabView(selection: $viewModel.isItemSelect){
                    VStack{
                        ScrollView([ .vertical ], showsIndicators: false)
                              {
                                
                                 LazyVGrid(columns: columns, alignment: .center, spacing: 8)
                                  {
                                      ForEach($viewModel.popular.wrappedValue, id: \.self) { popular in
                                          MovieSmallCard(movie: popular)
                                      }
                                  }
                              }
                        
                        Spacer(minLength: 0)
                    }.tag(0)
                    VStack{
                        ScrollView([ .vertical ], showsIndicators: false)
                              {
                                
                                 LazyVGrid(columns: columns, alignment: .center, spacing: 8)
                                  {
                                      ForEach($viewModel.toprated.wrappedValue, id: \.self) { toprated in
                                          MovieSmallCard(movie: toprated)
                                      }
                                  }
                              }
                        Spacer(minLength: 0)
                    }.tag(1)
                    VStack{
                        ScrollView([ .vertical ], showsIndicators: false)
                              {
                                
                                 LazyVGrid(columns: columns, alignment: .center, spacing: 8)
                                  {
                                      ForEach($viewModel.onTheAir.wrappedValue, id: \.self) { onTheAir in
                                          MovieSmallCard(movie: onTheAir)
                                      }
                                  }
                              }
                    }.tag(2)
                    VStack{
                       
                        ScrollView([ .vertical ], showsIndicators: false)
                              {
                                
                                 LazyVGrid(columns: columns, alignment: .center, spacing: 8)
                                  {
                                      ForEach($viewModel.airingToday.wrappedValue, id: \.self) { airingToday in
                                          MovieSmallCard(movie: airingToday)
                                      }
                                  }
                              }
                    }.tag(3)
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }.padding(.top)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("TV Shows")
                        .toolbar {
                            ToolbarItemGroup(placement: .navigationBarTrailing) {
                                Button {
                                    showingAlert = true
                                }label: {
                                    Label("Edit", systemImage: "list.bullet")
                                }
                                .confirmationDialog("Important message", isPresented: $showingAlert) {
                                            Button("View Profile") {
                                                //navigation to Profile
                                                self.viewModel.routerProfileButton()
                                            }
                                    AnyView(Button(role:.destructive,action: {
                                       //navigation Login
                                        self.viewModel.routerLoginButton()
                                       }, label: {
                                           Text("Logout")
                                       }))
                                } message:{
                                    Text("What do you want to do?")
                                }

                              
                            }
                        }
       
        }.onAppear(perform: fetch).padding(.horizontal)
            
      
    }
    private func fetch(){
      viewModel.loadPopularTV()
      viewModel.loadTopRatedTV()
      viewModel.loadOnTheAirTV()
      viewModel.loadAiringTodayTV()
    }
}
struct MovieSmallCard: View {
  var movie:Results
    private let cardAndImageWidth: CGFloat = 170
    private let cardHeight: CGFloat = 174
    private let imageHeight: CGFloat = 116
    private let cornerRadius: CGFloat = 5

  var body: some View {
      
    let fullPosterURL = URL.init(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "")")!
      VStack(alignment: .leading){
          ZStack(alignment: .top ,content: {
              
              WebImage(imageURL:fullPosterURL).cornerRadius(20)
              
          })
          VStack(spacing : 4) {
                       HStack(){
                           Text(movie.name ?? "").lineLimit(2).foregroundColor(.green).font(.system(size: 13))
                           Spacer()
                       }.padding(7)
                       HStack(alignment: .center){
                       Text(movie.first_air_date ?? "").foregroundColor(Color.green.opacity(0.75)).font(.system(size: 12))
                           Spacer()
                           Image(systemName: "star.fill")
                             .foregroundColor(.green)
                             .font(.system(size: 12))
                           Text(String(format: "%.1f", Float(movie.vote_average ?? 0.0))).foregroundColor(Color.green.opacity(0.75)).font(.system(size: 12))
                       }.padding(5)
                      
              Text(movie.overview ?? "").lineLimit(5).foregroundColor(Color.white.opacity(0.75)).multilineTextAlignment(.leading).font(.system(size: 13))
          }.padding(.bottom)
      }.background(Color("greenDark"))
          .cornerRadius(15)
    
     
  }
}


          

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(viewModel: MovieListViewModel(router: ViewRouter(), networkManager: NetworkManager()), viewRouter: ViewRouter())
    }
}
