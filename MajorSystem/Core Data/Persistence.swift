//
// Persistence.swift
// MajorSystem
//
// Copyright (c) 2021 Jochen Pfeiffer
//

import CoreData

struct PersistenceController {
    let container: NSPersistentCloudKitContainer

    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "MajorSystem")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}

#if DEBUG
extension PersistenceController {
    static let previewNumbers =
        [
            1: [
                0: ["CIA"],
                1: ["tea"],
                2: ["Noah"],
                3: ["home"],
                4: ["raw"],
                5: ["loo"],
                6: ["shoe"],
                7: ["cow"],
                8: ["foe"],
                9: ["bee"],
            ],
            2: [
                00: ["sushi"],
                01: ["seed"],
                02: ["sun"],
                03: ["sumo"],
                04: ["czar"],
                05: ["seal"],
                06: ["switch"],
                07: ["sock"],
                08: ["safe"],
                09: ["soap", "soup", "spa", "spy"],
                10: ["dice"],
                11: ["toad"],
                12: ["dino"],
                13: ["dam"],
                14: ["tire"],
                15: ["doll"],
                16: ["tissue"],
                17: ["dick"],
                18: ["TV"],
                19: ["tipi"],
                20: ["noose"],
                21: ["knight"],
                22: ["onion"],
            ],
        ]

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        let settings = viewContext.createSettings()
        let mapping = settings.addMapping(withName: "preview", inContext: viewContext)

        previewNumbers.forEach { numberOfDigits, numbers in
            numbers.forEach { value, words in
                let number = mapping.addNumber(withValue: Int32(value), numberOfDigits: Int16(numberOfDigits), inContext: viewContext)
                words.forEach { word in
                    number.addWord(withValue: word, inContext: viewContext)
                }
            }
        }

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    static var previewSettings: Settings {
        let context = PersistenceController.preview.container.viewContext
        let settings: Settings! = try! context.fetchOrCreateSettings()
        return settings
    }

    static var previewMapping: Mapping {
        let mapping: Mapping! = previewSettings.currentMapping
        return mapping
    }

    static var previewNumber: Number {
        let context = PersistenceController.preview.container.viewContext
        let number: Number! = try! context.fetchNumber(withValue: 9, numberOfDigits: 2, inMappingWithName: "preview")
        return number
    }

    static var previewWord: Word {
        let word: Word! = previewNumber.mainWord
        return word
    }
}
#endif
