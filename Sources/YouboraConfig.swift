//
//  YouboraConfig.swift
//  Pods
//
//  Created by Nilit Danan on 5/8/18.
//

import YouboraLib

struct YouboraConfig: Decodable {
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
    
//    let errors: Errors?
    
    
    func options() -> YBOptions {
        let options = YBOptions()
        
        options.accountCode = accountCode
        options.username = username
        options.userType = userType
        options.userObfuscateIp = obfuscateIP != nil ? NSNumber(booleanLiteral: obfuscateIP!) : nil
        options.httpSecure = httpSecure ?? true
        options.anonymousUser = anonymousUser
        
        
        if let parse = parse {
            options.parseResource = parse.parseManifest ?? false
            options.parseCdnNode = parse.parseCdnNode ?? false
            
            if let parseCdnNameHeader = parse.parseCdnNameHeader { options.parseCdnNameHeader = parseCdnNameHeader }
            
            if let parseCdnNodeList = parse.parseCdnNodeList, !parseCdnNodeList.isEmpty {
                options.parseCdnNodeList = NSMutableArray(array: parseCdnNodeList)
            }
        }
        
        options.deviceCode = nil // List of device codes http://mapi.youbora.com:8081/devices
        options.contentCdn = contentCDN // List of CDNs: http://mapi.youbora.com:8081/cdns
        
        if let media = media {
            options.contentIsLive = media.isLive != nil ? NSNumber(booleanLiteral: media.isLive!) :  nil
            options.contentIsLiveNoSeek = media.isDVR != nil ? NSNumber(booleanLiteral: !(media.isDVR!)) : nil
            options.contentDuration = media.duration != nil ? NSNumber(value: media.duration!) : nil
            options.contentTitle = media.title
            options.program = media.title2
            
            if let program = media.program {
                options.program = program
            }
            
            options.contentTransactionCode = media.transactionCode
        }
        
        options.adResource = nil
        options.adCampaign = ads?.campaign
        options.adTitle = ""
        
        if let ads = ads, let adsExtraParams = ads.extraParams {
            options.adCustomDimension1 = adsExtraParams.param1
            options.adCustomDimension2 = adsExtraParams.param2
            options.adCustomDimension3 = adsExtraParams.param3
            options.adCustomDimension4 = adsExtraParams.param4
            options.adCustomDimension5 = adsExtraParams.param5
            options.adCustomDimension6 = adsExtraParams.param6
            options.adCustomDimension7 = adsExtraParams.param7
            options.adCustomDimension8 = adsExtraParams.param8
            options.adCustomDimension9 = adsExtraParams.param9
            options.adCustomDimension10 = adsExtraParams.param10
        }
        
        if let properties = properties {
            options.contentMetadata = ["genre": properties.genre ?? "",
                                       "type": properties.type ?? "",
                                       "transaction_type": properties.transactionType ?? "",
                                       "year": String(describing: properties.year),
                                       "cast": properties.cast ?? "",
                                       "director": properties.director ?? "",
                                       "owner": properties.owner ?? "",
                                       "parental": properties.parental ?? "",
                                       "price": properties.price ?? "",
                                       "rating": properties.rating ?? "",
                                       "audioType": properties.audioType ?? "",
                                       "audioChannels": properties.audioChannels ?? "",
                                       "device": properties.device ?? "",
                                       "quality": properties.quality ?? ""]
        }
        
        if let extraParams = extraParams {
            options.contentCustomDimension1 = extraParams.param1
            options.contentCustomDimension2 = extraParams.param2
            options.contentCustomDimension3 = extraParams.param3
            options.contentCustomDimension4 = extraParams.param4
            options.contentCustomDimension5 = extraParams.param5
            options.contentCustomDimension6 = extraParams.param6
            options.contentCustomDimension7 = extraParams.param7
            options.contentCustomDimension8 = extraParams.param8
            options.contentCustomDimension9 = extraParams.param9
            options.contentCustomDimension10 = extraParams.param10
        }
        
        if let customDimensions = customDimensions {
            options.contentCustomDimension1 = customDimensions.contentCustomDimension1
            options.contentCustomDimension2 = customDimensions.contentCustomDimension2
            options.contentCustomDimension3 = customDimensions.contentCustomDimension3
            options.contentCustomDimension4 = customDimensions.contentCustomDimension4
            options.contentCustomDimension5 = customDimensions.contentCustomDimension5
            options.contentCustomDimension6 = customDimensions.contentCustomDimension6
            options.contentCustomDimension7 = customDimensions.contentCustomDimension7
            options.contentCustomDimension8 = customDimensions.contentCustomDimension8
            options.contentCustomDimension9 = customDimensions.contentCustomDimension9
            options.contentCustomDimension10 = customDimensions.contentCustomDimension10
            options.contentCustomDimension11 = customDimensions.contentCustomDimension11
            options.contentCustomDimension12 = customDimensions.contentCustomDimension12
            options.contentCustomDimension13 = customDimensions.contentCustomDimension13
            options.contentCustomDimension14 = customDimensions.contentCustomDimension14
            options.contentCustomDimension15 = customDimensions.contentCustomDimension15
            options.contentCustomDimension16 = customDimensions.contentCustomDimension16
            options.contentCustomDimension17 = customDimensions.contentCustomDimension17
            options.contentCustomDimension18 = customDimensions.contentCustomDimension18
            options.contentCustomDimension19 = customDimensions.contentCustomDimension19
            options.contentCustomDimension20 = customDimensions.contentCustomDimension20
        }
        
        if let appName = appName {
            options.appName = appName
        }
        
        if let app = app {
            options.appName = app.appName
            options.appReleaseVersion = app.appReleaseVersion
        }
        
        return options
    }
}

struct Content: Decodable {
    let contentResource: String?
    let contentIsLive: String?
    let contentTitle: String?
    let contentTitle2: String?
    let program: String? //contentTitle2
    let contentDuration: String?
    let contentTransactionCode: String?
    let contentBitrate: Double? //NSNumber
    let sendTotalBytes: Bool?
    let contentStreamingProtocol: String?
    let contentTransportFormat: String?
    let contentThroughput: Int?
    let contentRendition: String?
    let contentCdn: String?
    let contentFps: Double?
    let contentIsLiveNoSeek: Bool?
    let isDVR: Bool?
    let contentPackage: String?
    let contentSaga: String?
    let contentTvShow: String?
    let contentSeason: String?
    let contentEpisodeTitle: String?
    let contentChannel: String?
    let contentId: String?
    let contentImdbId: String?
    let contentGracenoteId: String?
    let contentType: String?
    let contentGenre: String?
    let contentLanguage: String?
    let contentSubtitles: String?
    let contentContractedResolution: String?
    let contentCost: String?
    let contentPrice: String?
    let contentPlaybackType: String?
    let contentDrm: String?
    let contentEncodingVideoCodec: String?
    let contentEncodingAudioCodec: String?
    //let contentEncodingCodecSettings: String?
    let contentEncodingCodecProfile: String?
    let contentEncodingContainerFormat: String?
}

struct Media: Decodable {
    let resource: String?
    let isLive: Bool?
    let isDVR: Bool?
    let title: String?
    let title2: String?
    let program: String?
    let duration: Double?
    let transactionCode: String?
}

struct Ads: Decodable {
    let adBreaksTime: [Int]?
    //let adsAfterStop: Int?
    // let adGivenAds: Int?
    let campaign: String?
    let adCampaign: String?
    let adCreativeId: String?
    let adExpectedBreaks: Int?
    let adGivenBreaks: Int?
    let adProvider: String?
    let adResource: String?
    let adTitle: String?
    let extraParams: ExtraParams?
    let adCustomDimensions: AdCustomDimensions?
    //let adExpectedPattern: [String: AnyHashable]?
    //let adMetadata: [String: AnyHashable]?
}

typealias ContentMetadata = Properties

struct Properties: Decodable {
    let genre: String?
    let type: String?
    let transactionType: String?
    let year: Int?
    let cast: String?
    let director: String?
    let owner: String?
    let parental: String?
    let price: String?
    let rating: String?
    let audioType: String?
    let audioChannels: String?
    let device: String?
    let quality: String?
}

struct AdCustomDimensions: Decodable {
    let adCustomDimension1: String?
    let adCustomDimension2: String?
    let adCustomDimension3: String?
    let adCustomDimension4: String?
    let adCustomDimension5: String?
    let adCustomDimension6: String?
    let adCustomDimension7: String?
    let adCustomDimension8: String?
    let adCustomDimension9: String?
    let adCustomDimension10: String?
}

struct CustomDimensions: Decodable {
    let contentCustomDimension1: String?
    let contentCustomDimension2: String?
    let contentCustomDimension3: String?
    let contentCustomDimension4: String?
    let contentCustomDimension5: String?
    let contentCustomDimension6: String?
    let contentCustomDimension7: String?
    let contentCustomDimension8: String?
    let contentCustomDimension9: String?
    let contentCustomDimension10: String?
    let contentCustomDimension11: String?
    let contentCustomDimension12: String?
    let contentCustomDimension13: String?
    let contentCustomDimension14: String?
    let contentCustomDimension15: String?
    let contentCustomDimension16: String?
    let contentCustomDimension17: String?
    let contentCustomDimension18: String?
    let contentCustomDimension19: String?
    let contentCustomDimension20: String?
}

struct ExtraParams: Decodable {
    let param1: String?
    let param2: String?
    let param3: String?
    let param4: String?
    let param5: String?
    let param6: String?
    let param7: String?
    let param8: String?
    let param9: String?
    let param10: String?
}

struct Parse: Decodable {
    var parseManifest: Bool?
    var parseCdnNode: Bool?
    let parseCdnNodeList: [String]?
    let parseCdnNameHeader: String?
}

struct App: Decodable {
    let appName: String?
    let appReleaseVersion: String?
}
