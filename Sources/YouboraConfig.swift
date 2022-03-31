//
//  YouboraConfig.swift
//  Pods
//
//  Created by Nilit Danan on 5/8/18.
//

import YouboraLib

struct YouboraConfig: Decodable {
    let accountCode: String
    
    let enabled: Bool?
    let httpSecure: Bool?
    let host: String?
    let authToken: String?
    let authType: String?
    let username: String?
    let offline: Bool?
//    let isInfinity: Bool? // Depricated
    let autoDetectBackground: Bool?
//    let autoStart: Bool? // Can't be found in YouboraLib
    let forceInit: Bool?
    let experiments: [String]?
    let linkedViewId: String?
    let waitForMetadata: Bool?
    let pendingMetadata: [String]?
    let householdId: String?

    let user: User?
    let ad: Ad?
    let smartswitch: Smartswitch?
    let parse: Parse?
    let network: Network?
    let device: Device?
    let content: Content?
    let app: App?
    let session: Session?
    let errors: Errors?

    // For YBFastDataConfig
    let fastDataConfig: FastDataConfig?
    
    // Kaltura additional data
    fileprivate let kalturaInfo: KalturaInfo?

    
    // MARK: - Deprecated
    // Backward Compatible - Deprecated - Will be removed in the future.
    let userEmail: String?
    let userAnonymousId: String?
    let userType: String?
    let obfuscateIP: Bool?
    let userObfuscateIp: Bool?
    let contentCDN: String?
    let houseHoldId: String?
//    let isAutoStart: Bool? // No code usage found.
    let isEnabled: Bool?
    let isForceInit: Bool?
    let appName: String?
    let media: Media?
    let properties: Properties?
    let contentCustomDimensions: ContentCustomDimensions?
    let extraParams: ExtraParams?
    let ads: Ads?
    // MARK: -
}

struct User: Decodable {
    let anonymousId: String?
    let type: String?
    let email: String?
    let obfuscateIp: Bool?
}

struct Ad: Decodable {
    let blockerDetected: Bool?
    let metadata: [String: String]?
    let afterStop: Int?
    let campaign: String?
    let title: String?
    let resource: String?
    let givenBreaks: Int?
    let expectedBreaks: Int?
    let expectedPattern: ExpectedPattern?
    let breaksTime: [Int]?
    let givenAds: Int?
    let creativeId: String?
    let provider: String?
    let customDimension: CustomDimension?
}

struct CustomDimension: Decodable {
    let one: String?
    let two: String?
    let three: String?
    let four: String?
    let five: String?
    let six: String?
    let seven: String?
    let eight: String?
    let nine: String?
    let ten: String?
    let eleven: String?
    let twelve: String?
    let thirteen: String?
    let fourteen: String?
    let fiveteen: String?
    let sixteen: String?
    let seventeen: String?
    let eighteen: String?
    let nineteen: String?
    let twenty: String?
    
    enum CodingKeys: String, CodingKey {
        case one = "1",
             two = "2",
             three = "3",
             four = "4",
             five = "5",
             six = "6",
             seven = "7",
             eight = "8",
             nine = "9",
             ten = "10",
             eleven = "11",
             twelve = "12",
             thirteen = "13",
             fourteen = "14",
             fiveteen = "15",
             sixteen = "16",
             seventeen = "17",
             eighteen = "18",
             nineteen = "19",
             twenty = "20"
    }
}

struct ExpectedPattern: Decodable {
    let pre: [Int]?
    let mid: [Int]?
    let post: [Int]?
    
    func getValuesForOptions() -> Dictionary<String, Array<NSNumber>> {
        var dictionary: Dictionary<String, Array<NSNumber>> = [:]
        
        if let pre = pre, !pre.isEmpty {
            var array: Array<NSNumber> = []
            for value in pre {
                array.append(NSNumber(value: value))
            }
            
            dictionary[YBOptionKeys.adPositionPre] = array
        }
        
        if let mid = mid, !mid.isEmpty {
            var array: Array<NSNumber> = []
            for value in mid {
                array.append(NSNumber(value: value))
            }
            dictionary[YBOptionKeys.adPositionMid] = array
        }
        
        if let post = post, !post.isEmpty {
            var array: Array<NSNumber> = []
            for value in post {
                array.append(NSNumber(value: value))
            }
            dictionary[YBOptionKeys.adPositionPost] = array
        }
        
        return dictionary
    }
}

struct Smartswitch: Decodable {
    let configCode: String?
    let groupCode: String?
    let contractCode: String?
}

struct Parse: Decodable {
    let manifest: Bool?
    let cdnNameHeader: String?
//    let cdnNode: Bool? // This is being ignored. Can't be on this level! It creates a conflict in order for it to be automatically parsed. Youbora needs to fix this.
    let cdnNode: CDNNode?
    let cdnTTL: Double?
    let cdnSwitchHeader: Bool?
    
    // MARK: - Deprecated
    // Backward Compatible - Deprecated - Will be removed in the future.
    let parseManifest: Bool?
    let parseCdnNode: Bool?
    let parseCdnSwitchHeader: Bool?
    let parseCdnNodeList: [String]?
    let parseCdnNameHeader: String?
    let parseCdnTTL: Int?
    // MARK: -
}

struct CDNNode: Decodable {
    let requestDebugHeaders: Bool? // Replaces "parse.cdnNode"
    let list: [String]? // Available ones are: (Taken from Youbora's site) 'Akamai', 'Amazon', 'Cloudfront', 'Level3', 'Fastly', 'Highwinds', 'Telefonica', 'Edgecast', 'NosOtt', 'Balancer'
}

struct Network: Decodable {
    let ip: String?
    let isp: String?
    let connectionType: String?
    
    // MARK: - Deprecated
    // Backward Compatible - Deprecated - Will be removed in the future.
    let networkIP: String?
    let networkIsp: String?
    let networkConnectionType: String?
    let userObfuscateIp: String?
    // MARK: -
}

struct Device: Decodable {
    let code: String? // List of device codes http://mapi.youbora.com:8081/devices
    let model: String?
    let brand: String?
    let type: String?
    let name: String?
    let osName: String?
    let osVersion: String?
    let isAnonymous: Bool?
    let id: String?
    let EDID: String?
    
    // MARK: - Deprecated
    // Backward Compatible - Deprecated - Will be removed in the future.
    let deviceBrand: String?
    let deviceCode: String?
    let deviceId: String?
    let deviceModel: String?
    let deviceOsName: String?
    let deviceOsVersion: String?
    let deviceType: String?
    let deviceIsAnonymous: Bool?
    // MARK: -
}

struct Content: Decodable {
    let resource: String?
//    let isLive: Bool? // This is being ignored. Can't be on this level! It creates a conflict in order for it to be automatically parsed. Youbora needs to fix this.
    let isLive: IsLive?
    let title: String?
    let program: String? //contentTitle2
    let duration: Double?
    let transactionCode: String?
    let bitrate: UInt?
    let throughput: UInt?
    let rendition: String?
    let cdn: String? // List of CDNs: http://mapi.youbora.com:8081/cdns
    let cdnNode: String?
    let cdnType: String? // https://documentation.npaw.com/npaw-integration/docs/setting-options-and-metadata#cdn-node-types
    let fps: Double?
    let streamingProtocol: String? // Valid values by Youbora: "HDS"/"HLS"/"MSS"/"DASH"/"RTMP"/"RTP"/"RTSP"
    let transportFormat: String? // Valid values by Youbora: "HLS-TS"/"HLS-FMP4"/"HLS-CMF"
    let metadata: [String: String]?
    let metrics: [String: String]?
    let package: String?
    let saga: String?
    let tvShow: String?
    let season: String?
    let episodeTitle: String?
    let channel: String?
    let id: String?
    let imdbId: String?
    let gracenoteId: String?
    let type: String?
    let genre: String?
    let language: String?
    let subtitles: String?
    let contractedResolution: String?
    let cost: String?
    let price: String?
    let playbackType: String?
    let drm: String?
    let encoding: Encoding?
    let customDimension: CustomDimension?
    let customDimensions: [String: String]?
    let totalBytes: UInt?
    let sendTotalBytes: Bool?
    
    // MARK: - Deprecated
    // Backward Compatible - Deprecated - Will be removed in the future.
    let isDVR: Bool?
    let title2: String?
    let contentProgram: String? //contentTitle2
    let contentResource: String?
    let contentIsLive: Bool?
    let contentTitle: String?
    let contentTitle2: String?
    let contentDuration: Double?
    let contentTransactionCode: String?
    let contentBitrate: Double? //NSNumber
    let contentSendTotalBytes: Bool?
    let contentStreamingProtocol: String?
    let contentTransportFormat: String?
    let contentThroughput: Int?
    let contentRendition: String?
    let contentCdn: String?
    let contentFps: Double?
    let contentIsLiveNoSeek: Bool?
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
    let contentEncodingCodecProfile: String?
    let contentEncodingContainerFormat: String?
    // MARK: -
}

struct IsLive: Decodable {
    let isLiveContent: Bool? // Replaces "content.isLive"
    let noSeek: Bool?
    let noMonitor: Bool?
}

struct Encoding: Decodable {
    let videoCodec: String?
    let audioCodec: String?
    let codecSettings: String? // Youbora site defines it as a String, but the property is configured as a dictionary, need to understand what to do with it, currently ignored.
    let codecProfile: String?
    let containerFormat: String?
}

struct App: Decodable {
    let name: String?
    let releaseVersion: String?
    
    // MARK: - Deprecated
    // Backward Compatible - Deprecated - Will be removed in the future.
    let appName: String?
    let appReleaseVersion: String?
    // MARK: -
}

struct Session: Decodable {
    let metrics: [String: Any]?
    
    enum CodingKeys: String, CodingKey {
        case metrics
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.metrics = try values.decode([String: Any].self, forKey: .metrics)
    }
}

struct Errors: Decodable {
    let fatal: [String]?
    let nonFatal: [String]?
    let ignore: [String]?
    
    // MARK: - Deprecated
    // Backward Compatible - Deprecated - Will be removed in the future.
    let errorsIgnore: [String]?
    let errorsFatal: [String]?
    let errorsNonFatal: [String]?
    // MARK: -
}

struct FastDataConfig: Decodable {
    let host: String?
    let code: String?
    let pingTime: Double?
    let beatTime: Double?
    let expirationTime: Double?
    let youboraId: String?
}

private struct KalturaInfo: Codable {
    let sessionId: String?
    let entryId: String?
    let uiConfId: String?
}

// MARK: -

extension YouboraConfig {
    
    func options() -> YBOptions {
        let options = YBOptions()
        options.accountCode = accountCode
        
        options.enabled = enabled ?? true
        if let httpSecure = httpSecure { options.httpSecure = httpSecure }
        options.host = host
        options.authToken = authToken
        options.authType = authType
        options.username = username
        if let offline = offline { options.offline = offline }
        if let autoDetectBackground = autoDetectBackground { options.autoDetectBackground = autoDetectBackground }
        if let forceInit = forceInit { options.forceInit = forceInit }
        if let experiments = experiments {
            options.experimentIds = NSMutableArray(array: experiments)
        }
        options.linkedViewId = linkedViewId
        if let waitForMetadata = waitForMetadata { options.waitForMetadata = waitForMetadata }
        options.pendingMetadata = pendingMetadata
        
        addUserValues(to: options)
        addAdValues(to: options)
        addSmartswitchValues(to: options)
        addParseValues(to: options)
        addNetworkValues(to: options)
        addDeviceValues(to: options)
        addContentValues(to: options)
        addAppValues(to: options)
        addSessionValues(to: options)
        addErrorsValues(to: options)
        
        addBackwardCompatibleData(to: options)
        
        addKalturaInfoData(to: options)
        
        return options
    }
    
    func addUserValues(to options: YBOptions) {
        guard let user = user else { return }
        
        options.anonymousUser = user.anonymousId
        options.userType = user.type
        options.userEmail = user.email
        if let obfuscateIp = user.obfuscateIp { options.userObfuscateIp = NSNumber(booleanLiteral: obfuscateIp) }
    }
    
    func addAdValues(to options: YBOptions) {
        guard let ad = ad else { return }
            
        if let blockerDetected = ad.blockerDetected {
            options.adBlockerDetected = NSNumber(booleanLiteral: blockerDetected)
        }
        options.adMetadata = ad.metadata
        if let adsAfterStop = ad.afterStop { options.adsAfterStop = NSNumber(value: adsAfterStop) }
        options.adCampaign = ad.campaign
        options.adTitle = ad.title
        options.adResource = ad.resource
        if let givenBreaks = ad.givenBreaks { options.adGivenBreaks = NSNumber(value: givenBreaks) }
        if let expectedBreaks = ad.expectedBreaks { options.adExpectedBreaks = NSNumber(value: expectedBreaks) }
        options.adExpectedPattern = ad.expectedPattern?.getValuesForOptions()
        options.adBreaksTime = ad.breaksTime
        if let givenAds = ad.givenAds { options.adGivenAds = NSNumber(value: givenAds)}
        options.adCreativeId = ad.creativeId
        options.adProvider = ad.provider
        if let customDimension = ad.customDimension {
            options.adCustomDimension1 = customDimension.one
            options.adCustomDimension2 = customDimension.two
            options.adCustomDimension3 = customDimension.three
            options.adCustomDimension4 = customDimension.four
            options.adCustomDimension5 = customDimension.five
            options.adCustomDimension6 = customDimension.six
            options.adCustomDimension7 = customDimension.seven
            options.adCustomDimension8 = customDimension.eight
            options.adCustomDimension9 = customDimension.nine
            options.adCustomDimension10 = customDimension.ten
        }
    }
    
    func addSmartswitchValues(to options:YBOptions) {
        guard let smartswitch = smartswitch else { return }
            
        options.smartswitchConfigCode = smartswitch.configCode
        options.smartswitchGroupCode = smartswitch.groupCode
        options.smartswitchContractCode = smartswitch.contractCode
    }
    
    func addParseValues(to options:YBOptions) {
        guard let parse = parse else { return }
            
        if let manifest = parse.manifest { options.parseResource = manifest }
        options.parseCdnNameHeader = parse.cdnNameHeader
        if let cdnNode = parse.cdnNode {
            if let requestDebugHeaders = cdnNode.requestDebugHeaders {
                options.parseCdnNode = requestDebugHeaders
            } else {
                // Workaround if the value was sent as parse.cdnNode, If we have the object we believe it's true.
                options.parseCdnNode = true
            }
            if let list = cdnNode.list { options.parseCdnNodeList = NSMutableArray(array: list) }
        }
        if let cdnTTL = parse.cdnTTL { options.cdnTTL = cdnTTL }
        if let cdnSwitchHeader = parse.cdnSwitchHeader { options.cdnSwitchHeader = cdnSwitchHeader }
    }
    
    func addNetworkValues(to options:YBOptions) {
        guard let network = network else { return }
            
        options.networkIP = network.ip
        options.networkIsp = network.isp
        options.networkConnectionType = network.connectionType
    }
    
    func addDeviceValues(to options:YBOptions) {
        guard let device = device else { return }
            
        options.deviceCode = device.code
        options.deviceModel = device.model
        options.deviceBrand = device.brand
        options.deviceType = device.type
        options.deviceName = device.name
        options.deviceOsName = device.osName
        options.deviceOsVersion = device.osVersion
        if let isAnonymous = device.isAnonymous { options.deviceIsAnonymous = isAnonymous }
        options.deviceUUID = device.id
        options.deviceEDID = device.EDID
    }
    
    func addContentValues(to options:YBOptions) {
        guard let content = content else { return }
            
        options.contentResource = content.resource
        if let isLiveData = content.isLive {
            if let isLiveContent = isLiveData.isLiveContent {
                options.contentIsLive = NSNumber(value: isLiveContent)
            } else {
                // Workaround if the value was sent as content.isLive, If we have the object we believe it's true.
                options.contentIsLive = NSNumber(value: true)
            }
            if let noSeek = isLiveData.noSeek { options.contentIsLiveNoSeek = NSNumber(value: noSeek) }
            if let noMonitor = isLiveData.noMonitor { options.contentIsLiveNoMonitor = NSNumber(value: noMonitor) }
        }
        options.contentTitle = content.title
        options.program = content.program
        if let duration = content.duration { options.contentDuration = NSNumber(value: duration) }
        options.contentTransactionCode = content.transactionCode
        if let bitrate = content.bitrate { options.contentBitrate = NSNumber(value: bitrate) }
        if let throughput = content.throughput { options.contentThroughput = NSNumber(value: throughput) }
        options.contentRendition = content.rendition
        options.contentCdn = content.cdn
        if let fps = content.fps { options.contentFps = NSNumber(value: fps) }
        options.contentCdnNode = content.cdnNode
        options.contentCdnType = content.cdnType
        options.contentStreamingProtocol = content.streamingProtocol
        options.contentTransportFormat = content.transportFormat
        options.contentMetadata = content.metadata
        options.contentMetrics = content.metrics
        options.contentPackage = content.package
        options.contentSaga = content.saga
        options.contentTvShow = content.tvShow
        options.contentSeason = content.season
        options.contentEpisodeTitle = content.episodeTitle
        options.contentChannel = content.channel
        options.contentId = content.id
        options.contentImdbId = content.imdbId
        options.contentGracenoteId = content.gracenoteId
        options.contentType = content.type
        options.contentGenre = content.genre
        options.contentLanguage = content.language
        options.contentSubtitles = content.subtitles
        options.contentContractedResolution = content.contractedResolution
        options.contentCost = content.cost
        options.contentPrice = content.price
        options.contentPlaybackType = content.playbackType
        options.contentDrm = content.drm
        if let encoding = content.encoding {
            options.contentEncodingVideoCodec = encoding.videoCodec
            options.contentEncodingAudioCodec = encoding.audioCodec
//                options.contentEncodingCodecSettings = encoding.codecSettings // This is documented as a String and I didn't find the keys that are expected in the Dictionary.
            options.contentEncodingCodecProfile = encoding.codecProfile
            options.contentEncodingContainerFormat = encoding.containerFormat
        }
        if let customDimension = content.customDimension {
            options.contentCustomDimension1 = customDimension.one
            options.contentCustomDimension2 = customDimension.two
            options.contentCustomDimension3 = customDimension.three
            options.contentCustomDimension4 = customDimension.four
            options.contentCustomDimension5 = customDimension.five
            options.contentCustomDimension6 = customDimension.six
            options.contentCustomDimension7 = customDimension.seven
            options.contentCustomDimension8 = customDimension.eight
            options.contentCustomDimension9 = customDimension.nine
            options.contentCustomDimension10 = customDimension.ten
            options.contentCustomDimension11 = customDimension.eleven
            options.contentCustomDimension12 = customDimension.twelve
            options.contentCustomDimension13 = customDimension.thirteen
            options.contentCustomDimension14 = customDimension.fourteen
            options.contentCustomDimension15 = customDimension.fiveteen
            options.contentCustomDimension16 = customDimension.sixteen
            options.contentCustomDimension17 = customDimension.seventeen
            options.contentCustomDimension18 = customDimension.eighteen
            options.contentCustomDimension19 = customDimension.nineteen
            options.contentCustomDimension20 = customDimension.twenty
        }
        options.contentCustomDimensions = content.customDimensions
        if let totalBytes = content.totalBytes { options.contentTotalBytes = NSNumber(value: totalBytes) }
        if let sendTotalBytes = content.sendTotalBytes { options.sendTotalBytes = NSNumber(value: sendTotalBytes) }
    }
    
    func addAppValues(to options:YBOptions) {
        guard let app = app else { return }
        
        options.appName = app.name
        options.appReleaseVersion = app.releaseVersion
    }
    
    func addSessionValues(to options:YBOptions) {
        guard let session = session else { return }
            
        options.sessionMetrics = session.metrics
    }
    
    func addErrorsValues(to options:YBOptions) {
        guard let errors = errors else { return }
            
        options.fatalErrors = errors.fatal
        options.nonFatalErrors = errors.nonFatal
        options.ignoreErrors = errors.ignore
    }
    
    private func addKalturaInfoData(to options: YBOptions) {
        // Add KalturaInfo to the Metadata
        if let kalturaInfo = kalturaInfo {
            if let kalturaInfoData = kalturaInfo.dictionary {
                if options.contentMetadata == nil {
                    options.contentMetadata = ["kalturaInfo": kalturaInfoData]
                } else {
                    options.contentMetadata?["kalturaInfo"] = kalturaInfoData
                }
            }
        }
    }
}

extension YouboraConfig {

    func getYBFastDataConfig() -> YBFastDataConfig? {
        if let fastDataConfig = fastDataConfig {
            let ybFastDataConfig = YBFastDataConfig()
            ybFastDataConfig.host = fastDataConfig.host
            ybFastDataConfig.code = fastDataConfig.code
            ybFastDataConfig.pingTime = fastDataConfig.pingTime as NSNumber?
            ybFastDataConfig.beatTime = fastDataConfig.beatTime as NSNumber?
            ybFastDataConfig.expirationTime = fastDataConfig.expirationTime as NSNumber?
            ybFastDataConfig.youboraId = fastDataConfig.youboraId
            return ybFastDataConfig
        }
        return nil
    }
}

