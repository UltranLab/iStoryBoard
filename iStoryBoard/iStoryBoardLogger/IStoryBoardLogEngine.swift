//
//  IStoryBoardLogEngine.swift
//  iStoryBoard
//
//  Created by Tuhin S on 11/11/19.
//  Copyright © 2019 Backyard Mangrove Networks Pvt. Ltd. All rights reserved.
//

import Foundation
import Swift

final public class IStoryBoard: NSObject {
    private static let single: IStoryBoard = IStoryBoard()
    public static var shared: IStoryBoard { return single }
    public var isDebuggable: Bool = false
    internal func debugLog(withData data: Any?) {
        #if DEBUG
        switch isDebuggable {
        case true:
            guard let printable = data else {
                Swift.debugPrint(IStoryBoardMessages.defaultError)
                return
            }
            Swift.debugPrint(printable)
        case false: break
        }
        #endif
    }
}
