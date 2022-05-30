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
        if let host = host { options.host = host }
        if let authToken = authToken { options.authToken = authToken }
        if let authType = authType { options.authType = authType }
        if let username = username { options.username = username }
        if let offline = offline { options.offline = offline }
        if let autoDetectBackground = autoDetectBackground { options.autoDetectBackground = autoDetectBackground }
        if let forceInit = forceInit { options.forceInit = forceInit }
        if let experiments = experiments {
            options.experimentIds = NSMutableArray(array: experiments)
        }
        if let linkedViewId = linkedViewId { options.linkedViewId = linkedViewId }
        if let waitForMetadata = waitForMetadata { options.waitForMetadata = waitForMetadata }
        if let pendingMetadata = pendingMetadata { options.pendingMetadata = pendingMetadata }
        
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
        
        if let anonymousId = user.anonymousId { options.anonymousUser = anonymousId }
        if let type = user.type { options.userType = type }
        if let email = user.email { options.userEmail = email }
        if let obfuscateIp = user.obfuscateIp { options.userObfuscateIp = NSNumber(booleanLiteral: obfuscateIp) }
    }
    
    func addAdValues(to options: YBOptions) {
        guard let ad = ad else { return }
            
        if let blockerDetected = ad.blockerDetected {
            options.adBlockerDetected = NSNumber(booleanLiteral: blockerDetected)
        }
        if let metadata = ad.metadata { options.adMetadata = metadata }
        if let adsAfterStop = ad.afterStop { options.adsAfterStop = NSNumber(value: adsAfterStop) }
        if let campaign = ad.campaign { options.adCampaign = campaign }
        if let title = ad.title { options.adTitle = title }
        if let resource = ad.resource { options.adResource = resource }
        if let givenBreaks = ad.givenBreaks { options.adGivenBreaks = NSNumber(value: givenBreaks) }
        if let expectedBreaks = ad.expectedBreaks { options.adExpectedBreaks = NSNumber(value: expectedBreaks) }
        if let expectedPattern = ad.expectedPattern { options.adExpectedPattern = expectedPattern.getValuesForOptions() }
        if let breaksTime = ad.breaksTime { options.adBreaksTime = breaksTime }
        if let givenAds = ad.givenAds { options.adGivenAds = NSNumber(value: givenAds)}
        if let creativeId = ad.creativeId { options.adCreativeId = creativeId }
        if let provider = ad.provider { options.adProvider = provider }
        if let customDimension = ad.customDimension {
            if let one = customDimension.one { options.adCustomDimension1 = one }
            if let two = customDimension.two { options.adCustomDimension2 = two }
            if let three = customDimension.three { options.adCustomDimension3 = three }
            if let four = customDimension.four { options.adCustomDimension4 = four }
            if let five = customDimension.five { options.adCustomDimension5 = five }
            if let six = customDimension.six { options.adCustomDimension6 = six }
            if let seven = customDimension.seven { options.adCustomDimension7 = seven }
            if let eight = customDimension.eight { options.adCustomDimension8 = eight }
            if let nine = customDimension.nine { options.adCustomDimension9 = nine }
            if let ten = customDimension.ten { options.adCustomDimension10 = ten }
        }
    }
    
    func addSmartswitchValues(to options:YBOptions) {
        guard let smartswitch = smartswitch else { return }
            
        if let configCode = smartswitch.configCode { options.smartswitchConfigCode = configCode }
        if let groupCode = smartswitch.groupCode { options.smartswitchGroupCode = groupCode }
        if let contractCode = smartswitch.contractCode { options.smartswitchContractCode = contractCode }
    }
    
    func addParseValues(to options:YBOptions) {
        guard let parse = parse else { return }
            
        if let manifest = parse.manifest { options.parseResource = manifest }
        if let cdnNameHeader = parse.cdnNameHeader { options.parseCdnNameHeader = cdnNameHeader }
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
            
        if let ip = network.ip { options.networkIP = ip }
        if let isp = network.isp { options.networkIsp = isp }
        if let connectionType = network.connectionType { options.networkConnectionType = connectionType }
    }
    
    func addDeviceValues(to options:YBOptions) {
        guard let device = device else { return }
            
        if let code = device.code { options.deviceCode = code }
        if let model = device.model { options.deviceModel = model }
        if let brand = device.brand { options.deviceBrand = brand }
        if let type = device.type { options.deviceType = type }
        if let name = device.name { options.deviceName = name }
        if let osName = device.osName { options.deviceOsName = osName }
        if let osVersion = device.osVersion { options.deviceOsVersion = osVersion }
        if let isAnonymous = device.isAnonymous { options.deviceIsAnonymous = isAnonymous }
        if let id = device.id { options.deviceUUID = id }
        if let EDID = device.EDID { options.deviceEDID = EDID }
    }
    
    func addContentValues(to options:YBOptions) {
        guard let content = content else { return }
            
        if let resource = content.resource { options.contentResource = resource }
        if let isLiveData = content.isLive {
            if let isLiveContent = isLiveData.isLiveContent {
                options.contentIsLive = NSNumber(booleanLiteral: isLiveContent)
            } else {
                // Workaround if the value was sent as content.isLive, If we have the object we believe it's true.
                options.contentIsLive = NSNumber(booleanLiteral: true)
            }
            if let noSeek = isLiveData.noSeek { options.contentIsLiveNoSeek = NSNumber(booleanLiteral: noSeek) }
            if let noMonitor = isLiveData.noMonitor { options.contentIsLiveNoMonitor = NSNumber(booleanLiteral: noMonitor) }
        }
        if let title = content.title { options.contentTitle = title }
        if let program = content.program { options.program = program }
        if let duration = content.duration { options.contentDuration = NSNumber(value: duration) }
        if let transactionCode = content.transactionCode { options.contentTransactionCode = transactionCode }
        if let bitrate = content.bitrate { options.contentBitrate = NSNumber(value: bitrate) }
        if let throughput = content.throughput { options.contentThroughput = NSNumber(value: throughput) }
        if let rendition = content.rendition { options.contentRendition = rendition }
        if let cdn = content.cdn { options.contentCdn = cdn }
        if let fps = content.fps { options.contentFps = NSNumber(value: fps) }
        if let cdnNode = content.cdnNode { options.contentCdnNode = cdnNode }
        if let cdnType = content.cdnType { options.contentCdnType = cdnType }
        if let streamingProtocol = content.streamingProtocol { options.contentStreamingProtocol = streamingProtocol }
        if let transportFormat = content.transportFormat { options.contentTransportFormat = transportFormat }
        if let metadata = content.metadata { options.contentMetadata = metadata }
        if let metrics = content.metrics { options.contentMetrics = metrics }
        if let package = content.package { options.contentPackage = package }
        if let saga = content.saga { options.contentSaga = saga }
        if let tvShow = content.tvShow { options.contentTvShow = tvShow }
        if let season = content.season { options.contentSeason = season }
        if let episodeTitle = content.episodeTitle { options.contentEpisodeTitle = episodeTitle }
        if let channel = content.channel { options.contentChannel = channel }
        if let id = content.id { options.contentId = id }
        if let imdbId = content.imdbId { options.contentImdbId = imdbId }
        if let gracenoteId = content.gracenoteId { options.contentGracenoteId = gracenoteId }
        if let type = content.type { options.contentType = type }
        if let genre = content.genre { options.contentGenre = genre }
        if let language = content.language { options.contentLanguage = language }
        if let subtitles = content.subtitles { options.contentSubtitles = subtitles }
        if let contractedResolution = content.contractedResolution { options.contentContractedResolution = contractedResolution }
        if let cost = content.cost { options.contentCost = cost }
        if let price = content.price { options.contentPrice = price }
        if let playbackType = content.playbackType { options.contentPlaybackType = playbackType }
        if let drm = content.drm { options.contentDrm = drm }
        if let encoding = content.encoding {
            if let videoCodec = encoding.videoCodec { options.contentEncodingVideoCodec = videoCodec }
            if let audioCodec = encoding.audioCodec { options.contentEncodingAudioCodec = audioCodec }
//                options.contentEncodingCodecSettings = encoding.codecSettings // This is documented as a String and I didn't find the keys that are expected in the Dictionary.
            if let codecProfile = encoding.codecProfile { options.contentEncodingCodecProfile = codecProfile }
            if let containerFormat = encoding.containerFormat { options.contentEncodingContainerFormat = containerFormat }
        }
        if let customDimension = content.customDimension {
            if let one = customDimension.one { options.contentCustomDimension1 = one }
            if let two = customDimension.two { options.contentCustomDimension2 = two }
            if let three = customDimension.three { options.contentCustomDimension3 = three }
            if let four = customDimension.four { options.contentCustomDimension4 = four }
            if let five = customDimension.five { options.contentCustomDimension5 = five }
            if let six = customDimension.six { options.contentCustomDimension6 = six }
            if let seven = customDimension.seven { options.contentCustomDimension7 = seven }
            if let eight = customDimension.eight { options.contentCustomDimension8 = eight }
            if let nine = customDimension.nine { options.contentCustomDimension9 = nine }
            if let ten = customDimension.ten { options.contentCustomDimension10 = ten }
            if let eleven = customDimension.eleven { options.contentCustomDimension11 = eleven }
            if let twelve = customDimension.twelve { options.contentCustomDimension12 = twelve }
            if let thirteen = customDimension.thirteen { options.contentCustomDimension13 = thirteen }
            if let fourteen = customDimension.fourteen { options.contentCustomDimension14 = fourteen }
            if let fiveteen = customDimension.fiveteen { options.contentCustomDimension15 = fiveteen }
            if let sixteen = customDimension.sixteen { options.contentCustomDimension16 = sixteen }
            if let seventeen = customDimension.seventeen { options.contentCustomDimension17 = seventeen }
            if let eighteen = customDimension.eighteen { options.contentCustomDimension18 = eighteen }
            if let nineteen = customDimension.nineteen { options.contentCustomDimension19 = nineteen }
            if let twenty = customDimension.twenty { options.contentCustomDimension20 = twenty }
        }
        if let customDimensions = content.customDimensions { options.contentCustomDimensions = customDimensions }
        if let totalBytes = content.totalBytes { options.contentTotalBytes = NSNumber(value: totalBytes) }
        if let sendTotalBytes = content.sendTotalBytes { options.sendTotalBytes = NSNumber(booleanLiteral: sendTotalBytes) }
    }
    
    func addAppValues(to options:YBOptions) {
        guard let app = app else { return }
        
        if let name = app.name { options.appName = name }
        if let releaseVersion = app.releaseVersion { options.appReleaseVersion = releaseVersion }
    }
    
    func addSessionValues(to options:YBOptions) {
        guard let session = session else { return }
            
        if let metrics = session.metrics { options.sessionMetrics = metrics }
    }
    
    func addErrorsValues(to options:YBOptions) {
        guard let errors = errors else { return }
            
        if let fatal = errors.fatal { options.fatalErrors = fatal }
        if let nonFatal = errors.nonFatal { options.nonFatalErrors = nonFatal }
        if let ignore = errors.ignore { options.ignoreErrors = ignore }
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
            if let host = fastDataConfig.host { ybFastDataConfig.host = host }
            if let code = fastDataConfig.code { ybFastDataConfig.code = code }
            if let pingTime = fastDataConfig.pingTime as NSNumber? { ybFastDataConfig.pingTime = pingTime }
            if let beatTime = fastDataConfig.beatTime as NSNumber? { ybFastDataConfig.beatTime = beatTime }
            if let expirationTime = fastDataConfig.expirationTime as NSNumber? { ybFastDataConfig.expirationTime = expirationTime }
            if let youboraId = fastDataConfig.youboraId { ybFastDataConfig.youboraId = youboraId }
            return ybFastDataConfig
        }
        return nil
    }
}

