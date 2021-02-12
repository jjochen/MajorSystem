//
// UserPreferences.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import Combine
import Foundation

class UserPreferences: ObservableObject {
    static var maxAvailableNumberOfDigits = 3

    @PreferenceValue("maxNumberOfDigitsInOrganizer", defaultValue: 2) var maxNumberOfDigitsInOrganizer: Int {
        willSet {
            objectWillChange.send()
        }
    }

    var indexOfMaxNumberOfDigitsInOrganizer: Int {
        get {
            maxNumberOfDigitsInOrganizer - 1
        }
        set {
            maxNumberOfDigitsInOrganizer = newValue + 1
        }
    }
}

@propertyWrapper class PreferenceValue<T> {
    // TODO: inject
    let userDefaults = UserDefaults.standard
    let ubiquitousKeyValueStore = NSUbiquitousKeyValueStore.default
    let notificationCenter = NotificationCenter.default

    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue

        prepareKeyValueStoreForUse()
    }

    var wrappedValue: T {
        get {
            valueInUserDefaults
        }
        set {
            valueInUserDefaults = newValue
            valueInUbiquitousKeyValueStore = newValue
        }
    }

    var valueInUserDefaults: T {
        get {
            userDefaults.object(forKey: key) as? T ?? defaultValue
        }
        set {
            userDefaults.set(newValue, forKey: key)
        }
    }

    var valueInUbiquitousKeyValueStore: T {
        get {
            ubiquitousKeyValueStore.object(forKey: key) as? T ?? defaultValue
        }
        set {
            ubiquitousKeyValueStore.set(newValue, forKey: key)
        }
    }

    func prepareKeyValueStoreForUse() {
        notificationCenter.addObserver(self,
                                       selector: #selector(ubiquitousKeyValueStoreDidChange(_:)),
                                       name: NSUbiquitousKeyValueStore.didChangeExternallyNotification,
                                       object: ubiquitousKeyValueStore)

        if ubiquitousKeyValueStore.synchronize() == false {
            fatalError("This app was not built with the proper entitlement requests.")
        }
    }

    @objc
    func ubiquitousKeyValueStoreDidChange(_ notification: Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }

        guard let keys = userInfo[NSUbiquitousKeyValueStoreChangedKeysKey] as? [String] else {
            return
        }

        guard keys.contains(key) else {
            return
        }

        guard let reasonForChange = userInfo[NSUbiquitousKeyValueStoreChangeReasonKey] as? Int else {
            return
        }

        if reasonForChange == NSUbiquitousKeyValueStoreAccountChange {
            wrappedValue = valueInUserDefaults
        } else {
            wrappedValue = valueInUbiquitousKeyValueStore
        }
    }
}
