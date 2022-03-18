//
//  YouboraConfig_BackwardCompatible.swift
//  PlayKitYoubora
//
//  Created by Nilit Danan on 16/03/2022.
//

import YouboraLib

// MARK: BackwardCompatibleData

// Backward Compatible - Deprecated - Will be removed in the future.

@available(*, deprecated, renamed: "Content", message: "Was renamed to Content.")
struct Media: Decodable {
    /**
     Use content, resource
    */
    let resource: String?
    /**
     Use content, isLive object
     */
    let isLive: Bool?
    /**
     Use content, isLive object
     */
    let isDVR: Bool?
    /**
     Use content, title
     */
    let title: String?
    /**
     Use content, program
     */
    let title2: String?
    /**
     Use content, program
     */
    let program: String?
    /**
     Use content, duration
     */
    let duration: Double?
    /**
     Use content, transactionCode
     */
    let transactionCode: String?
}


@available(*, deprecated, message: "Check property message, Most are in the Content object.")
struct Properties: Decodable {
    /**
    Use content, genre.
     */
    let genre: String?
    /**
    Use content, type.
     */
    let type: String?
    /**
    Use content, metadata array.
     */
    let transactionType: String?
    /**
    Use content, metadata array.
     */
    let year: String?
    /**
    Use content, metadata array.
     */
    let cast: String?
    /**
    Use content, metadata array.
     */
    let director: String?
    /**
    Use content, metadata array.
     */
    let owner: String?
    /**
    Use content, metadata array.
     */
    let parental: String?
    /**
    Use content, price.
     */
    let price: String?
    /**
    Use content, metadata array.
     */
    let rating: String?
    /**
    Use content, metadata array.
     */
    let audioType: String?
    /**
    Use content, metadata array.
     */
    let audioChannels: String?
    /**
    Use device object, has more properties.
     */
    let device: String?
    /**
    Use content, metadata array.
     */
    let quality: String?
}

@available(*, deprecated, message: "Use customDimension property in Content.")
struct ContentCustomDimensions: Decodable {
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

@available(*, deprecated, message: "Use customDimension property in Content.")
struct ExtraParams: Codable {
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

@available(*, deprecated, renamed: "Ad", message: "Use ad property instead.")
struct Ads: Decodable {
    let adBreaksTime: [Int]?
    let campaign: String?
    let adCampaign: String?
    let adCreativeId: String?
    let adExpectedBreaks: Int?
    let adGivenBreaks: Int?
    let adProvider: String?
    let adResource: String?
    let adTitle: String?
    let adGivenAds: Int?
    let extraParams: ExtraParams?
    let adCustomDimensions: AdCustomDimensions?
}

@available(*, deprecated)
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

extension YouboraConfig {
    
    func addBackwardCompatibleData(to options: YBOptions) {

        // Adding data from latest to the oldest format.
        addBackwardCompatibleFromContentValues(to: options)
        addBackwardCompatibleFromMediaValues(to: options)
        addBackwardCompatibleFromPropertiesValues(to: options)
        addBackwardCompatibleFromContentCustomDimensions(to: options)
        addBackwardCompatibleFromExtraParams(to: options)
        addBackwardCompatibleFromAds(to: options)
        
        if options.userEmail == nil {
            options.userEmail = userEmail
        }
        
        if options.anonymousUser == nil {
            options.anonymousUser = userAnonymousId
        }
        
        if options.userType == nil {
            options.userType = userType
        }
        
        if options.userObfuscateIp == nil {
            if let obfuscateIP = obfuscateIP {
                options.userObfuscateIp = NSNumber(booleanLiteral: obfuscateIP)
            } else if let userObfuscateIp = userObfuscateIp {
                options.userObfuscateIp = NSNumber(booleanLiteral: userObfuscateIp)
            }
        }
        
        if options.contentCdn == nil {
            options.contentCdn = contentCDN
        }
        
        if enabled == nil, let isEnabled = isEnabled {
            options.enabled = isEnabled
        }
        
        if forceInit == nil, let isForceInit = isForceInit {
            options.forceInit = isForceInit
        }
        
        if options.appName == nil {
            options.appName = appName
        }
    }
    
    func addBackwardCompatibleFromContentValues(to options: YBOptions) {
        guard let content = content else { return }
        
        if options.program == nil {
            options.program = content.contentProgram ?? content.contentTitle2 ?? content.title2
        }
        
        if options.contentResource == nil {
            options.contentResource = content.contentResource
        }
        
        if options.contentIsLive == nil, let isLive = content.contentIsLive {
            options.contentIsLive = NSNumber(booleanLiteral: isLive)
        }
        
        if options.contentIsLiveNoSeek == nil, let isLiveNoSeek = content.contentIsLiveNoSeek {
            options.contentIsLiveNoSeek = NSNumber(value: isLiveNoSeek)
        } else if let isDVR = content.isDVR {
            options.contentIsLiveNoSeek = NSNumber(value: isDVR)
        }
        
        if options.contentTitle == nil {
            options.contentTitle = content.contentTitle
        }
        
        if options.contentDuration == nil, let duration = content.contentDuration {
            options.contentDuration = NSNumber(value: duration)
        }
        
        if options.contentTransactionCode == nil {
            options.contentTransactionCode = content.contentTransactionCode
        }
        
        if options.contentBitrate == nil, let bitrate = content.contentBitrate {
            options.contentBitrate = NSNumber(value: bitrate)
        }
        
        if options.sendTotalBytes == nil, let sendTotalBytes = content.contentSendTotalBytes {
            options.sendTotalBytes = NSNumber(value: sendTotalBytes)
        }
        
        if options.contentStreamingProtocol == nil {
            options.contentStreamingProtocol = content.contentStreamingProtocol
        }
        
        if options.contentTransportFormat == nil {
            options.contentTransportFormat = content.contentTransportFormat
        }
        
        if options.contentThroughput == nil, let throughput = content.contentThroughput {
            options.contentThroughput = NSNumber(value: throughput)
        }
        
        if options.contentRendition == nil {
            options.contentRendition = content.contentRendition
        }
        
        if options.contentCdn == nil {
            options.contentCdn = content.contentCdn
        }
        
        if options.contentFps == nil, let fps = content.contentFps {
            options.contentFps = NSNumber(value: fps)
        }
        
        if options.contentPackage == nil {
            options.contentPackage = content.contentPackage
        }
        
        if options.contentSaga == nil {
            options.contentSaga = content.contentSaga
        }
        
        if options.contentTvShow == nil {
            options.contentTvShow = content.contentTvShow
        }
        
        if options.contentSeason == nil {
            options.contentSeason = content.contentSeason
        }
        
        if options.contentEpisodeTitle == nil {
            options.contentEpisodeTitle = content.contentEpisodeTitle
        }
        
        if options.contentChannel == nil {
            options.contentChannel = content.contentChannel
        }
        
        if options.contentId == nil {
            options.contentId = content.contentId
        }
        
        if options.contentImdbId == nil {
            options.contentImdbId = content.contentImdbId
        }
        
        if options.contentGracenoteId == nil {
            options.contentGracenoteId = content.contentGracenoteId
        }
        
        if options.contentType == nil {
            options.contentType = content.contentType
        }
        
        if options.contentGenre == nil {
            options.contentGenre = content.contentGenre
        }
        
        if options.contentLanguage == nil {
            options.contentLanguage = content.contentLanguage
        }
        
        if options.contentSubtitles == nil {
            options.contentSubtitles = content.contentSubtitles
        }
        
        if options.contentContractedResolution == nil {
            options.contentContractedResolution = content.contentContractedResolution
        }
        
        if options.contentCost == nil {
            options.contentCost = content.contentCost
        }
        
        if options.contentPrice == nil {
            options.contentPrice = content.contentPrice
        }
        
        if options.contentPlaybackType == nil {
            options.contentPlaybackType = content.contentPlaybackType
        }
        
        if options.contentDrm == nil {
            options.contentDrm = content.contentDrm
        }
        
        if options.contentEncodingVideoCodec == nil {
            options.contentEncodingVideoCodec = content.contentEncodingVideoCodec
        }
        
        if options.contentEncodingAudioCodec == nil {
            options.contentEncodingAudioCodec = content.contentEncodingAudioCodec
        }
        
        if options.contentEncodingCodecProfile == nil {
            options.contentEncodingCodecProfile = content.contentEncodingCodecProfile
        }
        
        if options.contentEncodingContainerFormat == nil {
            options.contentEncodingContainerFormat = content.contentEncodingContainerFormat
        }
    }
    
    func addBackwardCompatibleFromMediaValues(to options: YBOptions) {
        guard let media = media else { return }
        
        if options.contentResource == nil {
            options.contentResource = media.resource
        }
        
        if options.contentIsLive == nil {
            if let isLive = media.isLive {
                options.contentIsLive = NSNumber(booleanLiteral: isLive)
            }
        }
        
        if options.contentIsLiveNoSeek == nil {
            if let isDVR = media.isDVR {
                options.contentIsLiveNoSeek = NSNumber(booleanLiteral: !isDVR)
            }
        }
        
        if options.contentTitle == nil {
            options.contentTitle = media.title
        }
        
        if options.program == nil {
            options.program = media.program ?? media.title2
        }
        
        if options.contentDuration == nil {
            if let duration = media.duration {
                options.contentDuration = NSNumber(value: duration)
            }
        }
        
        if options.contentTransactionCode == nil {
            options.contentTransactionCode = media.transactionCode
        }
    }
    
    func addBackwardCompatibleFromPropertiesValues(to options: YBOptions) {
        guard let properties = properties else { return }
            
        if options.contentGenre == nil {
            options.contentGenre = properties.genre
        }
        
        if options.contentType == nil {
            options.contentType = properties.type
        }
        
        var additionalContentMetadata: [String: String] = [:]
        if let transactionType = properties.transactionType, !transactionType.isEmpty {
            additionalContentMetadata["transaction_type"] = transactionType
        }
        if let year = properties.year, !year.isEmpty {
            additionalContentMetadata["year"] = year
        }
        if let cast = properties.cast, !cast.isEmpty {
            additionalContentMetadata["cast"] = cast
        }
        if let director = properties.director, !director.isEmpty {
            additionalContentMetadata["director"] = director
        }
        if let owner = properties.owner, !owner.isEmpty {
            additionalContentMetadata["owner"] = owner
        }
        if let parental = properties.parental, !parental.isEmpty {
            additionalContentMetadata["parental"] = parental
        }
        if let price = properties.price, !price.isEmpty {
            additionalContentMetadata["price"] = price
        }
        if let rating = properties.rating, !rating.isEmpty {
            additionalContentMetadata["rating"] = rating
        }
        if let audioType = properties.audioType, !audioType.isEmpty {
            additionalContentMetadata["audioType"] = audioType
        }
        if let audioChannels = properties.audioChannels, !audioChannels.isEmpty {
            additionalContentMetadata["audioChannels"] = audioChannels
        }
        if let device = properties.device, !device.isEmpty {
            additionalContentMetadata["device"] = device
        }
        if let quality = properties.quality, !quality.isEmpty {
            additionalContentMetadata["quality"] = quality
        }
        
        if options.contentMetadata == nil {
            options.contentMetadata = additionalContentMetadata
        } else {
            // Keeping the value in options.contentMetadata if exists also in appendContentMetadata.
            options.contentMetadata?.merge(additionalContentMetadata) {(current,_) in current}
        }
    }
    
    func addBackwardCompatibleFromContentCustomDimensions(to options: YBOptions) {
        guard let contentCustomDimensions = contentCustomDimensions else { return }
            
        if options.contentCustomDimension1 == nil {
            options.contentCustomDimension1 = contentCustomDimensions.contentCustomDimension1
        }
        
        if options.contentCustomDimension2 == nil {
            options.contentCustomDimension2 = contentCustomDimensions.contentCustomDimension2
        }
        
        if options.contentCustomDimension3 == nil {
            options.contentCustomDimension3 = contentCustomDimensions.contentCustomDimension3
        }
        
        if options.contentCustomDimension4 == nil {
            options.contentCustomDimension4 = contentCustomDimensions.contentCustomDimension4
        }
            
        if options.contentCustomDimension5 == nil {
            options.contentCustomDimension5 = contentCustomDimensions.contentCustomDimension5
        }
        
        if options.contentCustomDimension6 == nil {
            options.contentCustomDimension6 = contentCustomDimensions.contentCustomDimension6
        }
           
        if options.contentCustomDimension7 == nil {
            options.contentCustomDimension7 = contentCustomDimensions.contentCustomDimension7
        }
        
        if options.contentCustomDimension8 == nil {
            options.contentCustomDimension8 = contentCustomDimensions.contentCustomDimension8
        }
        
        if options.contentCustomDimension9 == nil {
            options.contentCustomDimension9 = contentCustomDimensions.contentCustomDimension9
        }
        
        if options.contentCustomDimension10 == nil {
            options.contentCustomDimension10 = contentCustomDimensions.contentCustomDimension10
        }
        
        if options.contentCustomDimension11 == nil {
            options.contentCustomDimension11 = contentCustomDimensions.contentCustomDimension11
        }
        
        if options.contentCustomDimension12 == nil {
            options.contentCustomDimension12 = contentCustomDimensions.contentCustomDimension12
        }
        
        if options.contentCustomDimension13 == nil {
            options.contentCustomDimension13 = contentCustomDimensions.contentCustomDimension13
        }
        
        if options.contentCustomDimension14 == nil {
            options.contentCustomDimension14 = contentCustomDimensions.contentCustomDimension14
        }
        
        if options.contentCustomDimension15 == nil {
            options.contentCustomDimension15 = contentCustomDimensions.contentCustomDimension15
        }
        
        if options.contentCustomDimension16 == nil {
            options.contentCustomDimension16 = contentCustomDimensions.contentCustomDimension16
        }
        
        if options.contentCustomDimension17 == nil {
            options.contentCustomDimension17 = contentCustomDimensions.contentCustomDimension17
        }
        
        if options.contentCustomDimension18 == nil {
            options.contentCustomDimension18 = contentCustomDimensions.contentCustomDimension18
        }
        
        if options.contentCustomDimension19 == nil {
            options.contentCustomDimension19 = contentCustomDimensions.contentCustomDimension19
        }
        
        if options.contentCustomDimension20 == nil {
            options.contentCustomDimension20 = contentCustomDimensions.contentCustomDimension20
        }
    }

    func addBackwardCompatibleFromExtraParams(to options: YBOptions) {
        guard let extraParams = extraParams else { return }
        
        if let additionalExtraParams = extraParams.dictionary {
            if options.contentCustomDimensions == nil {
                options.contentCustomDimensions = additionalExtraParams
            } else {
                // Keeping the value in options.customDimensions if exists also in appendExtraParams.
                options.contentCustomDimensions?.merge(additionalExtraParams) {(current,_) in current}
            }
        }
    }
    
    func addBackwardCompatibleFromAds(to options: YBOptions) {
        guard let ads = ads else { return }
            
        if options.adBreaksTime == nil {
            options.adBreaksTime = ads.adBreaksTime
        }
        
        if options.adCampaign == nil {
            options.adCampaign = ads.adCampaign ?? ads.campaign
        }
        
        if options.adCreativeId == nil {
            options.adCreativeId = ads.adCreativeId
        }
        
        if options.adExpectedBreaks == nil, let adExpectedBreaks = ads.adExpectedBreaks {
            options.adExpectedBreaks = NSNumber(value: adExpectedBreaks)
        }
        
        if options.adGivenBreaks == nil, let adGivenBreaks = ads.adGivenBreaks {
            options.adGivenBreaks = NSNumber(value: adGivenBreaks)
        }
        
        if options.adProvider == nil {
            options.adProvider = ads.adProvider
        }
        
        if options.adResource == nil {
            options.adResource = ads.adResource
        }
        
        if options.adTitle == nil {
            options.adTitle = ads.adTitle
        }
        
        if options.adGivenAds == nil, let adGivenAds = ads.adGivenAds {
            options.adGivenAds = NSNumber(value: adGivenAds)
        }
        
        if let adCustomDimensions = ads.adCustomDimensions {
            if options.adCustomDimension1 == nil {
                options.adCustomDimension1 = adCustomDimensions.adCustomDimension1
            }
            if options.adCustomDimension2 == nil {
                options.adCustomDimension2 = adCustomDimensions.adCustomDimension2
            }
            if options.adCustomDimension3 == nil {
                options.adCustomDimension3 = adCustomDimensions.adCustomDimension3
            }
            if options.adCustomDimension4 == nil {
                options.adCustomDimension4 = adCustomDimensions.adCustomDimension4
            }
            if options.adCustomDimension5 == nil {
                options.adCustomDimension5 = adCustomDimensions.adCustomDimension5
            }
            if options.adCustomDimension6 == nil {
                options.adCustomDimension6 = adCustomDimensions.adCustomDimension6
            }
            if options.adCustomDimension7 == nil {
                options.adCustomDimension7 = adCustomDimensions.adCustomDimension7
            }
            if options.adCustomDimension8 == nil {
                options.adCustomDimension8 = adCustomDimensions.adCustomDimension8
            }
            if options.adCustomDimension9 == nil {
                options.adCustomDimension9 = adCustomDimensions.adCustomDimension9
            }
            if options.adCustomDimension10 == nil {
                options.adCustomDimension10 = adCustomDimensions.adCustomDimension10
            }
        }
        
        if let extraParams = ads.extraParams {
            if options.adCustomDimension1 == nil {
                options.adCustomDimension1 = extraParams.param1
            }
            if options.adCustomDimension2 == nil {
                options.adCustomDimension2 = extraParams.param2
            }
            if options.adCustomDimension3 == nil {
                options.adCustomDimension3 = extraParams.param3
            }
            if options.adCustomDimension4 == nil {
                options.adCustomDimension4 = extraParams.param4
            }
            if options.adCustomDimension5 == nil {
                options.adCustomDimension5 = extraParams.param5
            }
            if options.adCustomDimension6 == nil {
                options.adCustomDimension6 = extraParams.param6
            }
            if options.adCustomDimension7 == nil {
                options.adCustomDimension7 = extraParams.param7
            }
            if options.adCustomDimension8 == nil {
                options.adCustomDimension8 = extraParams.param8
            }
            if options.adCustomDimension9 == nil {
                options.adCustomDimension9 = extraParams.param9
            }
            if options.adCustomDimension10 == nil {
                options.adCustomDimension10 = extraParams.param10
            }
        }
    }
}
