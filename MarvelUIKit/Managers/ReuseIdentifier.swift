//
//  ReuseIdentifier.swift
//

import Foundation
import UIKit

public protocol ReuseIdentifierInterface: AnyObject{
    static var defaultReuseIdentifier: String { get }
}

public extension ReuseIdentifierInterface where Self: UIView{
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}


public protocol ReuseIdentifierInterfaceViewController: AnyObject{
    static var defaultReuseIdentifierViewController: String { get }
}

public extension ReuseIdentifierInterfaceViewController where Self: UIViewController{
    static var defaultReuseIdentifierViewController: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

