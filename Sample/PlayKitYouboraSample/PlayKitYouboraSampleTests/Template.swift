//
//  YouboraConfigTemplate.swift
//  PlayKitYouboraSampleTests
//
//  Created by Sergey Chausov on 28.04.2021.
//

import Foundation

class YouboraConfigTemplate {
    /*
     let accountCode: String
     let username: String?
     let anonymousUser: String?
     let userType: String?
     let obfuscateIP: Bool?
     var httpSecure: Bool? = true
     let contentCDN: String?
     
     let autoDetectBackground: Bool?
     let offline: Bool?
     
     //let smartswitchConfigCode: String?
     //let smartswitchGroupCode: String?
     //let smartswitchContractCode: String?
     
     //let linkedViewId: String?
     //let waitForMetadata: Bool?
     //let pendingMetadata: [String]?
     
     let media: Media?
     let content: Content?
     let ads: Ads?
     
     let properties: Properties?
     let contentMetadata: ContentMetadata?
     //let contentMetrics: [String: AnyHashable]?
     //let sessionMetrics: [String: AnyHashable]?
     
     let customDimensions: CustomDimensions?
     let extraParams: ExtraParams?
     let houseHoldId: String?
     
     let appName: String?
     let app: App?
     let parse: Parse?
     */
    
    
    //
    //General
    static let accountCode = "kalturatest"
    static let obfuscateIP = false
    
    
    
    static let username = "User Name"
    static let userEmail = "aaa1@gmail.com"
    static let anonymousUser = "AnonymousUser123"
    static let appName = "My App name"
    static let appReleaseVersion = "v1.0.0"
    static let userType = "paid"
    static let houseHoldId = "qwerty"
    static let contentCDN = "KALTURA"
    
    static let autoDetectBackground = true
    static let offline = false
    
    static let httpSecure = true
    
    static let extraParam1 = "MyParam1"
    static let extraParam2 = "MyParam2"
    static let extraParam3 = "MyParam3"
    static let extraParam4 = "MyParam4"
    static let extraParam5 = "MyParam5"
    static let extraParam6 = "MyParam6"
    static let extraParam7 = "MyParam7"
    static let extraParam8 = "MyParam8"
    static let extraParam9 = "MyParam9"
    static let extraParam10 = "MyParam10"
    static let extraParam11 = "MyParam11"
    static let extraParam12 = "MyParam12"
    static let extraParam13 = "MyParam13"
    static let extraParam14 = "MyParam14"
    static let extraParam15 = "MyParam15"
    static let extraParam16 = "MyParam16"
    static let extraParam17 = "MyParam17"
    static let extraParam18 = "MyParam18"
    static let extraParam19 = "MyParam19"
    static let extraParam20 = "MyParam20"
    
    static let parseManifest = true
    static let parseCdnNode = false
    
    static let adBreaksTime = [1, 2, 3]
    static let adCampaign = "Campaign Name 1"
    static let campaign = "Campaign Name 2"
    static let adCreativeId = "123456"
    static let adExpectedBreaks = 123
    static let adGivenBreaks = 234
    static let adProvider = "Provider name"
    static let adResource = "Some resources"
    static let adTitle = "Ad title"
    
    static let adCustomDimension1 = "My_adCustomDimension1"
    static let adCustomDimension2 = "My_adCustomDimension2"
    static let adCustomDimension3 = "My_adCustomDimension3"
    static let adCustomDimension4 = "My_adCustomDimension4"
    static let adCustomDimension5 = "My_adCustomDimension5"
    static let adCustomDimension6 = "vadCustomDimension6"
    static let adCustomDimension7 = "My_adCustomDimension7"
    static let adCustomDimension8 = "My_adCustomDimension8"
    static let adCustomDimension9 = "My_adCustomDimension9"
    static let adCustomDimension10 = "My_adCustomDimension10"
    
    typealias Template = YouboraConfigTemplate
    
    static let ybConfigParams: [String: Any] = [
        "accountCode": Template.accountCode,
        "username": Template.username,
        "userEmail": Template.userEmail,
        "userType": Template.userType, // optional any string - free / paid etc.
        "houseHoldId": Template.houseHoldId, // optional which device is used to play
        "httpSecure": Template.httpSecure, // youbora events will be sent via https
        "autoDetectBackground": true,
        
        "parse": [
            "parseManifest": Template.parseManifest,
            "parseCdnNode": Template.parseCdnNode
        ],
        "app": [
            "appName": Template.appName,
            "appReleaseVersion": Template.appReleaseVersion
        ],
        "extraParams": [
            "extraParam1": Template.extraParam1,
            "extraParam2": Template.extraParam2,
            "extraParam3": Template.extraParam3,
            "extraParam4": Template.extraParam4,
            "extraParam5": Template.extraParam5,
            "extraParam6": Template.extraParam6,
            "extraParam7": Template.extraParam7,
            "extraParam8": Template.extraParam8,
            "extraParam9": Template.extraParam9,
            "extraParam10": Template.extraParam10,
            "extraParam11": Template.extraParam11,
            "extraParam12": Template.extraParam12,
            "extraParam13": Template.extraParam13,
            "extraParam14": Template.extraParam14,
            "extraParam15": Template.extraParam15,
            "extraParam16": Template.extraParam16,
            "extraParam17": Template.extraParam17,
            "extraParam18": Template.extraParam18,
            "extraParam19": Template.extraParam19,
            "extraParam20": Template.extraParam20
        ],
        "ads": [
            "adBreaksTime": Template.adBreaksTime,
            "adCampaign": Template.adCampaign,
            "campaign": Template.campaign,
            "adCreativeId": Template.adCreativeId,
            "adExpectedBreaks": Template.adExpectedBreaks,
            "adGivenBreaks": Template.adGivenBreaks,
            "adProvider": Template.adProvider,
            "adResource": Template.adResource,
            "adTitle": Template.adTitle,
            "adCustomDimensions": [
                "adCustomDimension1": Template.adCustomDimension1,
                "adCustomDimension2": Template.adCustomDimension2,
                "adCustomDimension3": Template.adCustomDimension3,
                "adCustomDimension4": Template.adCustomDimension4,
                "adCustomDimension5": Template.adCustomDimension5,
                "adCustomDimension6": Template.adCustomDimension6,
                "adCustomDimension7": Template.adCustomDimension7,
                "adCustomDimension8": Template.adCustomDimension8,
                "adCustomDimension9": Template.adCustomDimension9,
                "adCustomDimension10": Template.adCustomDimension10
            ]
        ]
    ]
}
