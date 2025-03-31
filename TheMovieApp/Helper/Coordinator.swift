//
//  Coordinator.swift
//  TheMovieApp
//
//  Created by Gul Kzm on 17.03.25.
//
import UIKit
import Foundation

protocol Coordinator {
//    var children: [UIViewController] { get }
    var navigationController: UINavigationController { get }
    
    func start()
}
