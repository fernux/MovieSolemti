//
//  LoginView.swift
//  MovieSolemti
//
//  Created by Fernando Arriaga on 27/01/22.
//

import SwiftUI

struct LoginView: View {
    
    @State var authenticationDidFail: Bool = true
    @ObservedObject var loginViewModel: LoginViewModel //injected when LoginView
    var body: some View {
    
        NavigationView {
          VStack {
            LoginImage()
            
            UserNameField(userNameString: $loginViewModel.userName)
               PasswordField(passwordString: $loginViewModel.userPass)
              if loginViewModel.isLoginAlertShown {
                  Text("Invalid username and/or password: You did not provide a valid login.")
                      .font(.system(size: 11))
                      .offset(y: -10)
                      .foregroundColor(.red)
                         }
              LoginButton(loginViewModel: loginViewModel)
             
          }.padding()
            //.padding(Constants.Styles.pagePadding50)
            
        }
    }
}

struct LoginImage:View {
    var body: some View{
        Image("themoviedb")
        .resizable()
        .aspectRatio(
            contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .clipped()
    }
    
}
struct UserNameField:View {
    var userNameString:Binding<String>
    var body: some View{
        TextField("Username",text:userNameString)
            .padding()
                        .background(Color("lightGreyColor"))
                        .cornerRadius(5.0)
                        .padding([.leading, .bottom, .trailing], 33.0)
    }
}
struct PasswordField:View {
  var passwordString:Binding<String>
  var body:some View {
    SecureField("Password", text: passwordString)
          .padding()
          .background(Color("lightGreyColor"))
          .cornerRadius(5.0)
          .padding([.leading, .bottom, .trailing], 33.0)
  }
}
struct LoginButton:View{
  @ObservedObject var loginViewModel: LoginViewModel

  var body:some View {

    Button(action: {
      self.loginViewModel.validateLoginButton()
    }) {
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.green)
            .cornerRadius(15.0)
        
    }
    

  }


}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(loginViewModel: LoginViewModel(router: ViewRouter()))
    }
}
