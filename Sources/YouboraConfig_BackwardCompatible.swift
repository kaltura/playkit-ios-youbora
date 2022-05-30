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
        addBackwardCompatibleFromContent(to: options)
        addBackwardCompatibleFromParse(to: options)
        addBackwardCompatibleFromNetwork(to: options)
        addBackwardCompatibleFromDevice(to: options)
        addBackwardCompatibleFromApp(to: options)
        addBackwardCompatibleFromErrors(to: options)
        addBackwardCompatibleFromMedia(to: options)
        addBackwardCompatibleFromProperties(to: options)
        addBackwardCompatibleFromContentCustomDimensions(to: options)
        addBackwardCompatibleFromExtraParams(to: options)
        addBackwardCompatibleFromAds(to: options)
        
        if options.userEmail == nil, let userEmail = userEmail {
            options.userEmail = userEmail
        }
        
        if options.anonymousUser == nil, let userAnonymousId = userAnonymousId {
            options.anonymousUser = userAnonymousId
        }
        
        if options.userType == nil, let userType = userType {
            options.userType = userType
        }
        
        if options.userObfuscateIp == nil {
            if let obfuscateIP = obfuscateIP {
                options.userObfuscateIp = NSNumber(booleanLiteral: obfuscateIP)
            } else if let userObfuscateIp = userObfuscateIp {
                options.userObfuscateIp = NSNumber(booleanLiteral: userObfuscateIp)
            }
        }
        
        if options.contentCdn == nil, let contentCDN = contentCDN {
            options.contentCdn = contentCDN
        }
        
        if enabled == nil, let isEnabled = isEnabled {
            options.enabled = isEnabled
        }
        
        if forceInit == nil, let isForceInit = isForceInit {
            options.forceInit = isForceInit
        }
        
        if options.appName == nil, let appName = appName {
            options.appName = appName
        }
    }
    
    func addBackwardCompatibleFromContent(to options: YBOptions) {
        guard let content = content else { return }
        
        if options.program == nil, let program = content.contentProgram ?? content.contentTitle2 ?? content.title2 {
            options.program = program
        }
        
        if options.contentResource == nil, let contentResource = content.contentResource {
            options.contentResource = contentResource
        }
        
        if options.contentIsLive == nil, let isLive = content.contentIsLive {
            options.contentIsLive = NSNumber(booleanLiteral: isLive)
        }
        
        if options.contentIsLiveNoSeek == nil, let isLiveNoSeek = content.contentIsLiveNoSeek {
            options.contentIsLiveNoSeek = NSNumber(booleanLiteral: isLiveNoSeek)
        } else if let isDVR = content.isDVR {
            options.contentIsLiveNoSeek = NSNumber(booleanLiteral: isDVR)
        }
        
        if options.contentTitle == nil, let contentTitle = content.contentTitle {
            options.contentTitle = contentTitle
        }
        
        if options.contentDuration == nil, let duration = content.contentDuration {
            options.contentDuration = NSNumber(value: duration)
        }
        
        if options.contentTransactionCode == nil, let contentTransactionCode = content.contentTransactionCode {
            options.contentTransactionCode = contentTransactionCode
        }
        
        if options.contentBitrate == nil, let bitrate = content.contentBitrate {
            options.contentBitrate = NSNumber(value: bitrate)
        }
        
        if options.sendTotalBytes == nil, let sendTotalBytes = content.contentSendTotalBytes {
            options.sendTotalBytes = NSNumber(booleanLiteral: sendTotalBytes)
        }
        
        if options.contentStreamingProtocol == nil, let contentStreamingProtocol = content.contentStreamingProtocol {
            options.contentStreamingProtocol = contentStreamingProtocol
        }
        
        if options.contentTransportFormat == nil, let contentTransportFormat = content.contentTransportFormat {
            options.contentTransportFormat = contentTransportFormat
        }
        
        if options.contentThroughput == nil, let throughput = content.contentThroughput {
            options.contentThroughput = NSNumber(value: throughput)
        }
        
        if options.contentRendition == nil, let contentRendition = content.contentRendition {
            options.contentRendition = contentRendition
        }
        
        if options.contentCdn == nil, let contentCdn = content.contentCdn {
            options.contentCdn = contentCdn
        }
        
        if options.contentFps == nil, let fps = content.contentFps {
            options.contentFps = NSNumber(value: fps)
        }
        
        if options.contentPackage == nil, let contentPackage = content.contentPackage {
            options.contentPackage = contentPackage
        }
        
        if options.contentSaga == nil, let contentSaga = content.contentSaga {
            options.contentSaga = contentSaga
        }
        
        if options.contentTvShow == nil, let contentTvShow = content.contentTvShow {
            options.contentTvShow = contentTvShow
        }
        
        if options.contentSeason == nil, let contentSeason = content.contentSeason {
            options.contentSeason = contentSeason
        }
        
        if options.contentEpisodeTitle == nil, let contentEpisodeTitle = content.contentEpisodeTitle {
            options.contentEpisodeTitle = contentEpisodeTitle
        }
        
        if options.contentChannel == nil, let contentChannel = content.contentChannel {
            options.contentChannel = contentChannel
        }
        
        if options.contentId == nil, let contentId = content.contentId {
            options.contentId = contentId
        }
        
        if options.contentImdbId == nil, let contentImdbId = content.contentImdbId {
            options.contentImdbId = contentImdbId
        }
        
        if options.contentGracenoteId == nil, let contentGracenoteId = content.contentGracenoteId {
            options.contentGracenoteId = contentGracenoteId
        }
        
        if options.contentType == nil, let contentType = content.contentType {
            options.contentType = contentType
        }
        
        if options.contentGenre == nil, let contentGenre = content.contentGenre {
            options.contentGenre = contentGenre
        }
        
        if options.contentLanguage == nil, let contentLanguage = content.contentLanguage {
            options.contentLanguage = contentLanguage
        }
        
        if options.contentSubtitles == nil, let contentSubtitles = content.contentSubtitles {
            options.contentSubtitles = contentSubtitles
        }
        
        if options.contentContractedResolution == nil, let contentContractedResolution = content.contentContractedResolution {
            options.contentContractedResolution = contentContractedResolution
        }
        
        if options.contentCost == nil, let contentCost = content.contentCost {
            options.contentCost = contentCost
        }
        
        if options.contentPrice == nil, let contentPrice = content.contentPrice {
            options.contentPrice = contentPrice
        }
        
        if options.contentPlaybackType == nil, let contentPlaybackType = content.contentPlaybackType {
            options.contentPlaybackType = contentPlaybackType
        }
        
        if options.contentDrm == nil, let contentDrm = content.contentDrm {
            options.contentDrm = contentDrm
        }
        
        if options.contentEncodingVideoCodec == nil, let contentEncodingVideoCodec = content.contentEncodingVideoCodec {
            options.contentEncodingVideoCodec = contentEncodingVideoCodec
        }
        
        if options.contentEncodingAudioCodec == nil, let contentEncodingAudioCodec = content.contentEncodingAudioCodec {
            options.contentEncodingAudioCodec = contentEncodingAudioCodec
        }
        
        if options.contentEncodingCodecProfile == nil, let contentEncodingCodecProfile = content.contentEncodingCodecProfile {
            options.contentEncodingCodecProfile = contentEncodingCodecProfile
        }
        
        if options.contentEncodingContainerFormat == nil, let contentEncodingContainerFormat = content.contentEncodingContainerFormat {
            options.contentEncodingContainerFormat = contentEncodingContainerFormat
        }
    }
    
    func addBackwardCompatibleFromParse(to options: YBOptions) {
        guard let parse = parse else { return }
        
        // false is the default value
        if options.parseResource == false, let parseManifest = parse.parseManifest {
            options.parseResource = parseManifest
        }
        // false is the default value
        if options.parseCdnNode == false, let parseCdnNode = parse.parseCdnNode {
            options.parseCdnNode = parseCdnNode
        }
        // false is the default value
        if options.cdnSwitchHeader == false, let parseCdnSwitchHeader = parse.parseCdnSwitchHeader {
            options.cdnSwitchHeader = parseCdnSwitchHeader
        }
        
        // options.parseCdnNodeList is never nil cause it has the default values from Youbora.
        if parse.cdnNode?.list == nil, let parseCdnNodeList = parse.parseCdnNodeList {
            options.parseCdnNodeList = NSMutableArray(array: parseCdnNodeList)
        }
        // "x-cdn-forward" is the default value from Youbora
        if options.parseCdnNameHeader == "x-cdn-forward", let parseCdnNameHeader = parse.parseCdnNameHeader {
            options.parseCdnNameHeader = parseCdnNameHeader
        }
        
        // 60 is the default value
        if options.cdnTTL == 60, let cdnTTL = parse.parseCdnTTL {
            options.cdnTTL = Double(cdnTTL)
        }
    }
    
    func addBackwardCompatibleFromNetwork(to options: YBOptions) {
        guard let network = network else { return }
        
        if options.networkIP == nil, let networkIP = network.networkIP {
            options.networkIP = networkIP
        }
        
        if options.networkIsp == nil, let networkIsp = network.networkIsp {
            options.networkIsp = networkIsp
        }
        
        if options.networkConnectionType == nil, let networkConnectionType = network.networkConnectionType {
            options.networkConnectionType = networkConnectionType
        }
        
        if options.userObfuscateIp == nil,
            let userObfuscateIp = network.userObfuscateIp, let obfuscateIp = Bool(userObfuscateIp) {
            options.userObfuscateIp = NSNumber(booleanLiteral: obfuscateIp)
        }
    }
    
    func addBackwardCompatibleFromDevice(to options: YBOptions) {
        guard let device = device else { return }
        
        if options.deviceBrand == nil, let deviceBrand = device.deviceBrand {
            options.deviceBrand = deviceBrand
        }
        
        if options.deviceCode == nil, let deviceCode = device.deviceCode {
            options.deviceCode = deviceCode
        }
        
        if options.deviceUUID == nil, let deviceId = device.deviceId {
            options.deviceUUID = deviceId
        }
        
        if options.deviceModel == nil, let deviceModel = device.deviceModel {
            options.deviceModel = deviceModel
        }
        
        if options.deviceOsName == nil, let deviceOsName = device.deviceOsName {
            options.deviceOsName = deviceOsName
        }
        
        if options.deviceOsVersion == nil, let deviceOsVersion = device.deviceOsVersion {
            options.deviceOsVersion = deviceOsVersion
        }
        
        if options.deviceType == nil, let deviceType = device.deviceType {
            options.deviceType = deviceType
        }
        
        // false is the default value.
        if options.deviceIsAnonymous == false, let deviceIsAnonymous = device.deviceIsAnonymous {
            options.deviceIsAnonymous = deviceIsAnonymous
        }
    }
    
    func addBackwardCompatibleFromApp(to options: YBOptions) {
        guard let app = app else { return }
        
        if options.appName == nil, let appName = app.appName {
            options.appName = appName
        }
        
        if options.appReleaseVersion == nil, let appReleaseVersion = app.appReleaseVersion {
            options.appReleaseVersion = appReleaseVersion
        }
    }
    
    func addBackwardCompatibleFromErrors(to options: YBOptions) {
        guard let errors = errors else { return }
        
        if options.ignoreErrors == nil, let errorsIgnore = errors.errorsIgnore {
            options.ignoreErrors = errorsIgnore
        }
        
        if options.fatalErrors == nil, let errorsFatal = errors.errorsFatal {
            options.fatalErrors = errorsFatal
        }
        
        if options.nonFatalErrors == nil, let errorsNonFatal = errors.errorsNonFatal {
            options.nonFatalErrors = errorsNonFatal
        }
    }
    
    func addBackwardCompatibleFromMedia(to options: YBOptions) {
        guard let media = media else { return }
        
        if options.contentResource == nil, let resource = media.resource {
            options.contentResource = resource
        }
        
        if options.contentIsLive == nil, let isLive = media.isLive {
            options.contentIsLive = NSNumber(booleanLiteral: isLive)
        }
        
        if options.contentIsLiveNoSeek == nil, let isDVR = media.isDVR {
            options.contentIsLiveNoSeek = NSNumber(booleanLiteral: !isDVR)
        }
        
        if options.contentTitle == nil, let title = media.title {
            options.contentTitle = title
        }
        
        if options.program == nil, let program = media.program ?? media.title2 {
            options.program = program
        }
        
        if options.contentDuration == nil, let duration = media.duration {
            options.contentDuration = NSNumber(value: duration)
        }
        
        if options.contentTransactionCode == nil, let transactionCode = media.transactionCode {
            options.contentTransactionCode = transactionCode
        }
    }
    
    func addBackwardCompatibleFromProperties(to options: YBOptions) {
        guard let properties = properties else { return }
            
        if options.contentGenre == nil, let genre = properties.genre {
            options.contentGenre = genre
        }
        
        if options.contentType == nil, let type = properties.type {
            options.contentType = type
        }
        
        if options.contentPrice == nil, let price = properties.price {
            options.contentPrice = price
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
            
        if options.contentCustomDimension1 == nil, let contentCustomDimension1 = contentCustomDimensions.contentCustomDimension1 {
            options.contentCustomDimension1 = contentCustomDimension1
        }
        
        if options.contentCustomDimension2 == nil, let contentCustomDimension2 = contentCustomDimensions.contentCustomDimension2 {
            options.contentCustomDimension2 = contentCustomDimension2
        }
        
        if options.contentCustomDimension3 == nil, let contentCustomDimension3 = contentCustomDimensions.contentCustomDimension3 {
            options.contentCustomDimension3 = contentCustomDimension3
        }
        
        if options.contentCustomDimension4 == nil, let contentCustomDimension4 = contentCustomDimensions.contentCustomDimension4 {
            options.contentCustomDimension4 = contentCustomDimension4
        }
            
        if options.contentCustomDimension5 == nil, let contentCustomDimension5 = contentCustomDimensions.contentCustomDimension5 {
            options.contentCustomDimension5 = contentCustomDimension5
        }
        
        if options.contentCustomDimension6 == nil, let contentCustomDimension6 = contentCustomDimensions.contentCustomDimension6 {
            options.contentCustomDimension6 = contentCustomDimension6
        }
           
        if options.contentCustomDimension7 == nil, let contentCustomDimension7 = contentCustomDimensions.contentCustomDimension7 {
            options.contentCustomDimension7 = contentCustomDimension7
        }
        
        if options.contentCustomDimension8 == nil, let contentCustomDimension8 = contentCustomDimensions.contentCustomDimension8 {
            options.contentCustomDimension8 = contentCustomDimension8
        }
        
        if options.contentCustomDimension9 == nil, let contentCustomDimension9 = contentCustomDimensions.contentCustomDimension9 {
            options.contentCustomDimension9 = contentCustomDimension9
        }
        
        if options.contentCustomDimension10 == nil, let contentCustomDimension10 = contentCustomDimensions.contentCustomDimension10 {
            options.contentCustomDimension10 = contentCustomDimension10
        }
        
        if options.contentCustomDimension11 == nil, let contentCustomDimension11 = contentCustomDimensions.contentCustomDimension11 {
            options.contentCustomDimension11 = contentCustomDimension11
        }
        
        if options.contentCustomDimension12 == nil, let contentCustomDimension12 = contentCustomDimensions.contentCustomDimension12 {
            options.contentCustomDimension12 = contentCustomDimension12
        }
        
        if options.contentCustomDimension13 == nil, let contentCustomDimension13 = contentCustomDimensions.contentCustomDimension13 {
            options.contentCustomDimension13 = contentCustomDimension13
        }
        
        if options.contentCustomDimension14 == nil, let contentCustomDimension14 = contentCustomDimensions.contentCustomDimension14 {
            options.contentCustomDimension14 = contentCustomDimension14
        }
        
        if options.contentCustomDimension15 == nil, let contentCustomDimension15 = contentCustomDimensions.contentCustomDimension15 {
            options.contentCustomDimension15 = contentCustomDimension15
        }
        
        if options.contentCustomDimension16 == nil, let contentCustomDimension16 = contentCustomDimensions.contentCustomDimension16 {
            options.contentCustomDimension16 = contentCustomDimension16
        }
        
        if options.contentCustomDimension17 == nil, let contentCustomDimension17 = contentCustomDimensions.contentCustomDimension17 {
            options.contentCustomDimension17 = contentCustomDimension17
        }
        
        if options.contentCustomDimension18 == nil, let contentCustomDimension18 = contentCustomDimensions.contentCustomDimension18 {
            options.contentCustomDimension18 = contentCustomDimension18
        }
        
        if options.contentCustomDimension19 == nil, let contentCustomDimension19 = contentCustomDimensions.contentCustomDimension19 {
            options.contentCustomDimension19 = contentCustomDimension19
        }
        
        if options.contentCustomDimension20 == nil, let contentCustomDimension20 = contentCustomDimensions.contentCustomDimension20 {
            options.contentCustomDimension20 = contentCustomDimension20
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
            
        if options.adBreaksTime == nil, let adBreaksTime = ads.adBreaksTime {
            options.adBreaksTime = adBreaksTime
        }
        
        if options.adCampaign == nil, let campaign = ads.adCampaign ?? ads.campaign {
            options.adCampaign = campaign
        }
        
        if options.adCreativeId == nil, let adCreativeId = ads.adCreativeId {
            options.adCreativeId = adCreativeId
        }
        
        if options.adExpectedBreaks == nil, let adExpectedBreaks = ads.adExpectedBreaks {
            options.adExpectedBreaks = NSNumber(value: adExpectedBreaks)
        }
        
        if options.adGivenBreaks == nil, let adGivenBreaks = ads.adGivenBreaks {
            options.adGivenBreaks = NSNumber(value: adGivenBreaks)
        }
        
        if options.adProvider == nil, let adProvider = ads.adProvider {
            options.adProvider = adProvider
        }
        
        if options.adResource == nil, let adResource = ads.adResource {
            options.adResource = adResource
        }
        
        if options.adTitle == nil, let adTitle = ads.adTitle {
            options.adTitle = adTitle
        }
        
        if options.adGivenAds == nil, let adGivenAds = ads.adGivenAds {
            options.adGivenAds = NSNumber(value: adGivenAds)
        }
        
        if let adCustomDimensions = ads.adCustomDimensions {
            if options.adCustomDimension1 == nil, let adCustomDimension1 = adCustomDimensions.adCustomDimension1 {
                options.adCustomDimension1 = adCustomDimension1
            }
            if options.adCustomDimension2 == nil, let adCustomDimension2 = adCustomDimensions.adCustomDimension2 {
                options.adCustomDimension2 = adCustomDimension2
            }
            if options.adCustomDimension3 == nil, let adCustomDimension3 = adCustomDimensions.adCustomDimension3 {
                options.adCustomDimension3 = adCustomDimension3
            }
            if options.adCustomDimension4 == nil, let adCustomDimension4 = adCustomDimensions.adCustomDimension4 {
                options.adCustomDimension4 = adCustomDimension4
            }
            if options.adCustomDimension5 == nil, let adCustomDimension5 = adCustomDimensions.adCustomDimension5 {
                options.adCustomDimension5 = adCustomDimension5
            }
            if options.adCustomDimension6 == nil, let adCustomDimension6 = adCustomDimensions.adCustomDimension6 {
                options.adCustomDimension6 = adCustomDimension6
            }
            if options.adCustomDimension7 == nil, let adCustomDimension7 = adCustomDimensions.adCustomDimension7 {
                options.adCustomDimension7 = adCustomDimension7
            }
            if options.adCustomDimension8 == nil, let adCustomDimension8 = adCustomDimensions.adCustomDimension8 {
                options.adCustomDimension8 = adCustomDimension8
            }
            if options.adCustomDimension9 == nil, let adCustomDimension9 = adCustomDimensions.adCustomDimension9 {
                options.adCustomDimension9 = adCustomDimension9
            }
            if options.adCustomDimension10 == nil, let adCustomDimension10 = adCustomDimensions.adCustomDimension10 {
                options.adCustomDimension10 = adCustomDimension10
            }
        }
        
        if let extraParams = ads.extraParams {
            if options.adCustomDimension1 == nil, let param1 = extraParams.param1 {
                options.adCustomDimension1 = param1
            }
            if options.adCustomDimension2 == nil, let param2 = extraParams.param2 {
                options.adCustomDimension2 = param2
            }
            if options.adCustomDimension3 == nil, let param3 = extraParams.param3 {
                options.adCustomDimension3 = param3
            }
            if options.adCustomDimension4 == nil, let param4 = extraParams.param4 {
                options.adCustomDimension4 = param4
            }
            if options.adCustomDimension5 == nil, let param5 = extraParams.param5 {
                options.adCustomDimension5 = param5
            }
            if options.adCustomDimension6 == nil, let param6 = extraParams.param6 {
                options.adCustomDimension6 = param6
            }
            if options.adCustomDimension7 == nil, let param7 = extraParams.param7 {
                options.adCustomDimension7 = param7
            }
            if options.adCustomDimension8 == nil, let param8 = extraParams.param8 {
                options.adCustomDimension8 = param8
            }
            if options.adCustomDimension9 == nil, let param9 = extraParams.param9 {
                options.adCustomDimension9 = param9
            }
            if options.adCustomDimension10 == nil, let param10 = extraParams.param10 {
                options.adCustomDimension10 = param10
            }
        }
    }
}
