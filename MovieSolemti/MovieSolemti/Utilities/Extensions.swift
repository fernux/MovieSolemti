//
//  Extensions.swift
//  MovieSolemti
//
//  Created by Fernando Arriaga on 27/01/22.
//

import Foundation

extension UserDefaults {
  var isLoggedIn: Bool {
    get { return bool(forKey: #function) }
    set { set(newValue, forKey: #function) }
  }

}
