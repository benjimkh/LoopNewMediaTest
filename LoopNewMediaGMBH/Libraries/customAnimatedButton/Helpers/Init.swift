//
//  Extentions.swift
//  LoopNewMedia
//
//  Created by BenyaminMokhtarpour on 9/16/20.
//  Copyright © 2020 BenyaminMokhtarpour. All rights reserved.
//


import Foundation


internal func Init<T>( _ object: T, block: (T) throws -> ()) rethrows -> T{
    try block(object)
    return object
}
