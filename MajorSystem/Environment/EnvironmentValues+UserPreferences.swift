//
// EnvironmentValues+UserPreferences.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import SwiftUI

struct UserPreferencesKey: EnvironmentKey {
    static let defaultValue = UserPreferences()
}

extension EnvironmentValues {
    var userPreferences: UserPreferences {
        get {
            self[UserPreferencesKey.self]
        }
        set {
            self[UserPreferencesKey.self] = newValue
        }
    }
}
