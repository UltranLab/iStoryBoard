//
//  iStoryBoard+Generics.swift
//  iStoryBoard
//
//  Created by Tuhin S on 24/05/18.
//  Copyright © 2019 Backyard Mangrove Networks Pvt. Ltd. All rights reserved.
//

import Foundation

/**
 Default type of IStoryBoardName Name defined here which is a type of String
 */
public typealias IStoryBoardName = String
internal struct IStoryBoardMessages {
    private init() {}
    static let defaultError: String = "You need to pass atleast a message to shoot up! 😌"
    static let runOnMainThread: String = "Please run all the IStoryBoard Methods on Main Thread!"
    static let storyBoardEmpty: String = "Please provide a valid storyboard name. It should be in 'IStoryBoardName' format!"
    static let currentVcNotFound: String = "ViewController with given identifier not found in current storyboard. Please cross-check the ViewController Identifier. Also, you must give the ViewController ID same as the ViewController Class Name."
}
