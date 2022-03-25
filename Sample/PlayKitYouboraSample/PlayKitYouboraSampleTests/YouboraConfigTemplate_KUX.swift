//
//  YouboraConfigTemplate_KUX.swift
//  PlayKitYouboraSampleTests
//
//  Created by Nilit Danan on 25/03/2022.
//


// A test case for KUX sent values.
extension YouboraConfigTemplate {
    class KUXValues {
        static let accountCode = "cetin"
        static let username = "b61f49d6-3931-3c56-9236-9502ae4d6ce4"
        
        class App {
            static let releaseVersion = "1.4.1"
            static let name = "com.Kaltura.telenorserbia.web"
        }
        
        class Content {
            static let channel = "Discovery Channel | HD"
            static let type = "Entertainment"
            static let genre = "Profession"
            static let subtitles = ""
            static let title = "Lovac na starine"
            static let program = "Lovac na starine"
            
            class CustomDimension {
                static let cd1 = "3200"
            }
        }
    }
    
    static let ybKUXConfigParams: [String: Any] = [
        "accountCode": KUXValues.accountCode,
        "username": KUXValues.username,
        "app": [
            "releaseVersion": KUXValues.App.releaseVersion,
            "name": KUXValues.App.name
        ],
        "content": [
            "customDimension": [
                "1": KUXValues.Content.CustomDimension.cd1
            ],
            "channel": KUXValues.Content.channel,
            "type": KUXValues.Content.type,
            "genre": KUXValues.Content.genre,
            "subtitles": KUXValues.Content.subtitles,
            "title": KUXValues.Content.title,
            "program": KUXValues.Content.program
        ]
    ]
}
