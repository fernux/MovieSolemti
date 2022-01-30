//
//  UserModel.swift
//  MovieSolemti
//
//  Created by Fernando Arriaga on 27/01/22.
//

import Foundation
class UserModel:Codable {
  var userName:String? = "admin"
  var password:String? = "admin"
  var isRegistered:Bool?
}
