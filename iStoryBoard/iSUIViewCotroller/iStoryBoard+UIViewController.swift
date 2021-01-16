//
//  iStoryBoard+UIViewController.swift
//  iStoryBoard
//
//  Created by Tuhin S on 24/05/18.
//  Copyright © 2019 Backyard Mangrove Networks Pvt. Ltd. All rights reserved.
//

import UIKit

/**
 ViewController extension to manage ViewController ID and initialize the ViewControllers.
 */
public extension UIViewController {
    /**
     Returns current ViewController ID.
     
     You must provide the ViewController ID same as the ViewController Class Name inside the
     Storyboard -> Select the ViewController -> Identity Inspector -> Storyboard ID.
     */
    internal class var viewControllerID: String {
        return "\(self)"
    }
    
    /**
     UIViewController Extension Function which initializes the current ViewController and returns a new object. This method uses thread checking and closure. Returns the response always on main thread.
     
     You must provide the ViewController ID same as the ViewController Class Name inside the
     Storyboard -> Select the ViewController -> Identity Inspector -> Storyboard ID.
     
     - parameter storyBoard: StoryBoards 'iStoryBoardName' Type. Pass any valid storyboard names here as parameter.
     */
    static func instantiate(withName storyBoard: IStoryBoardName, onCompletion: @escaping (_ vc: UIViewController) -> Void) {
        guard !storyBoard.isEmpty else {
            IStoryBoard.shared.debugLog(withData: IStoryBoardMessages.storyBoardEmpty)
            fatalError()
        }
        storyBoard.getInstantiatedVC(with: self) { (response) in
            onCompletion(response)
        }
    }
    /**
     UIViewController Extension Function which initializes the current ViewController and returns new object. This method does not uses thread checking and closure.
     
     You must provide the ViewController ID same as the ViewController Class Name inside the
     Storyboard -> Select the ViewController -> Identity Inspector -> Storyboard ID.
     
     - parameter storyBoard: StoryBoards 'iStoryBoardName' Type. Pass any valid storyboard names here as parameter.
     */
    static func instantiate(withName storyBoard: IStoryBoardName) -> UIViewController {
        guard !storyBoard.isEmpty else {
            IStoryBoard.shared.debugLog(withData: IStoryBoardMessages.storyBoardEmpty)
            fatalError()
        }
        return storyBoard.getInstantiatedVC(with: self)
    }
}
