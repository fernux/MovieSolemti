//
//  URLImage.swift
//  MovieSolemti
//
//  Created by Fernando Arriaga on 28/01/22.
//

import Foundation
import Combine

public class DataLoader: ObservableObject {

    public let objectWillChange = PassthroughSubject<Data,Never>()

    public private(set) var data = Data() {
        willSet {
            objectWillChange.send(newValue)
        }
    }

    private let resourseURL: URL?

    public init(resourseURL: URL?){
        self.resourseURL = resourseURL
    }

    public func loadImage() {
        guard let url = resourseURL else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data,_,_) in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                self.data = data
            }
        }   .resume()
    }
}
