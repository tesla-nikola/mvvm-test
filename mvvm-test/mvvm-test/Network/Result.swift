//
//  Result.swift
//  mvvm-test
//
//  Created by Soham Ray on 15/06/20.
//  Copyright © 2020 jet2travels. All rights reserved.
//


import Foundation

enum Result<T, U> where U: Error  {
    case success(T)
    case failure(U)
}
