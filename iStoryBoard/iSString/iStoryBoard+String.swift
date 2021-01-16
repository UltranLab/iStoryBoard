//
//  iStoryBoard+String.swift
//  iStoryBoard
//
//  Created by Tuhin S on 24/05/18.
//  Copyright © 2019 Backyard Mangrove Networks Pvt. Ltd. All rights reserved.
//

import UIKit

/**
 Main Storyboard String Extension to manage StoryBoard names and initialize the ViewControllers.
 */

internal extension String {
    /**
     Returns a StoryBoard instance of UIStoryboard using the current provided name of StoryBoard.
     */
    private var instance: UIStoryboard {
        return UIStoryboard(name: self, bundle: Bundle.main)
    }
    /**
     This is an internal function of StoryBoard String Extension and you should not call this. To initialize a ViewController you must call thorugh the UIViewController extension instantiate function.
     
     - with: Pass the ViewController here to instantiate it.
     
     You must provide the ViewController ID same as the ViewController Class Name. Returns the response using closure by checking and applying the main thread.
     */
    func getInstantiatedVC<T: UIViewController>(with vcClass: T.Type, completion: @escaping (_ vc: T) -> Void) {
        let viewControllerIDForStoryBoard = (vcClass as UIViewController.Type).viewControllerID
        switch Thread.isMainThread {
        case true:
            guard let checkCurrentVC = instance.instantiateViewController(withIdentifier: viewControllerIDForStoryBoard) as? T else {
                IStoryBoard.shared.debugLog(withData: IStoryBoardMessages.currentVcNotFound)
                fatalError()
            }
            completion(checkCurrentVC)
        case false:
            DispatchQueue.main.async {
                guard let checkCurrentVC = self.instance.instantiateViewController(withIdentifier: viewControllerIDForStoryBoard) as? T else {
                    IStoryBoard.shared.debugLog(withData: IStoryBoardMessages.currentVcNotFound)
                    fatalError()
                }
                completion(checkCurrentVC)
            }
        }
    }
    /**
     This is an internal function of StoryBoard String Extension and you should not call this. To initialize a ViewController you must call thorugh the UIViewController extension instantiate function.
     
     - with: Pass the ViewController here to instantiate it.
     
     You must provide the ViewController ID same as the ViewController Class Name. Returns the response normally and does not check or apply main thread.
     */
    func getInstantiatedVC<T: UIViewController>(with vcClass: T.Type) -> UIViewController {
        let viewControllerIDForStoryBoard = (vcClass as UIViewController.Type).viewControllerID
        guard let checkCurrentVC = instance.instantiateViewController(withIdentifier: viewControllerIDForStoryBoard) as? T else {
            IStoryBoard.shared.debugLog(withData: IStoryBoardMessages.currentVcNotFound)
            fatalError()
        }
        return checkCurrentVC
    }
}
