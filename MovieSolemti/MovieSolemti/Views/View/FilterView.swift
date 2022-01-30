//
//  FilterView.swift
//  MovieSolemti
//
//  Created by Fernando Arriaga on 29/01/22.
//

import SwiftUI

struct FilterView: View {
    
    @ObservedObject var viewModel:MovieListViewModel
    @State var index = 0
    var body: some View {
        HStack(spacing:0){
            Text("Popular")
                .foregroundColor(viewModel.isItemSelect == 0 ? .white : Color("lightGreyColor").opacity(0.7)).fontWeight(.bold).padding(.vertical,10)
                .padding(.horizontal,5)
                .background(Color("lightGreyColor").opacity(viewModel.isItemSelect == 0 ? 1 : 0)).clipShape(RoundedRectangle(cornerRadius: 9)).onTapGesture {
                    withAnimation(.default){
                        
                        viewModel.performSelect(value: 0)
                    }
                   
                }
            Spacer(minLength: 0)
            
            Text("Top Rated")
                .foregroundColor(viewModel.isItemSelect == 1 ? .white : Color("lightGreyColor").opacity(0.7)).fontWeight(.bold).padding(.vertical,10)
                .padding(.horizontal,5)
                .background(Color("lightGreyColor").opacity(viewModel.isItemSelect == 1 ? 1 : 0)).clipShape(RoundedRectangle(cornerRadius: 9)).onTapGesture {
                    withAnimation(.default){
               
                    viewModel.performSelect(value: 1)
                        
                    }
                }
            Spacer(minLength: 0)
            
            Text("On TV")
                .foregroundColor(viewModel.isItemSelect == 2 ? .white : Color("lightGreyColor").opacity(0.7)).fontWeight(.bold).padding(.vertical,10)
                .padding(.horizontal,5)
                .background(Color("lightGreyColor").opacity(viewModel.isItemSelect == 2 ? 1 : 0)).clipShape(RoundedRectangle(cornerRadius: 9)).onTapGesture {
                    withAnimation(.default){
                   
                    viewModel.performSelect(value: 2)
                       
                    }
                }
            Spacer(minLength: 0)
            
            Text("Airing Today")
                .foregroundColor(viewModel.isItemSelect == 3 ? .white : Color("lightGreyColor").opacity(0.7)).fontWeight(.bold).padding(.vertical,10)
                .padding(.horizontal,5)
                .background(Color("lightGreyColor").opacity(viewModel.isItemSelect == 3 ? 1 : 0)).clipShape(RoundedRectangle(cornerRadius: 9)).onTapGesture {
                    withAnimation(.default){
                    
                    viewModel.performSelect(value: 3)
                    }
                }
            
        }.background(Color.black.opacity(0.6))
            .clipShape(RoundedRectangle(cornerRadius: 9))
            .padding(.horizontal)
            .padding(.top, 25)
    }
}



