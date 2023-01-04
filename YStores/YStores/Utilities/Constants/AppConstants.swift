//
//  AppConstants.swift
//  YStores
//
//  Created by Prateek Juneja on 22/12/22.
//

import Foundation

// MARK: Public Enum for storyboard name
public enum AppStoryboards: String {
    case main = "Main"
}

// MARK:  UI Elements Dimensions Enums
public enum CollectionViewDimensions: Int {
    case noOfColumnsRequired = 2
    case cellheight = 250
}


// MARK: Public Enum AlertView Variables
public enum AlertVariables: String {
    case alertErrorTitle = "Error"
    case ok = "Ok"
    case cancel = "Cancel"
    case alertErrorMessageForJailBreakDevice = "The device is not secure, please exit from the app."
}
