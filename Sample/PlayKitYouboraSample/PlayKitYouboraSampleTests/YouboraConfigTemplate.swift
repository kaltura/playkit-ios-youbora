//
//  YouboraConfigTemplate.swift
//  PlayKitYouboraSampleTests
//
//  Created by Sergey Chausov on 28.04.2021.
//

import Foundation

class YouboraConfigTemplate {
    
    typealias Template = YouboraConfigTemplate
    
    static let accountCode = "kalturatest"
    static let enabled = true
    static let httpSecure = true
    static let host = "a-fds.youborafds01.com"
    static let authToken = "myTokenString"
    static let authType = "Bearer"
    static let username = "User Name"
    static let offline = false
    static let autoDetectBackground = true
    static let forceInit = true
    static let experiments = ["experiment"]
    static let linkedViewId = "viewID"
    static let waitForMetadata = false
    static let pendingMetadata = ["title", "username"]
    static let householdId = "qwerty HH"
    // MARK: - Backward Compatible
    static let userEmail = "BC_aaa1@gmail.com"
    static let userAnonymousId = "BC_AnonymousUser123"
    static let userType = "BC_paid"
    static let obfuscateIp = true
    static let userObfuscateIp = true
    static let contentCDN = "BC_contentCDN"
    static let houseHoldId = "BC_qwerty HH"
    static let isEnabled = true
    static let isForceInit = true
    static let appName = "BC_My App name"
    // End - Backward Compatible
    
    class User {
        static let anonymousId = "AnonymousUser123"
        static let type = "Normal"
        static let email = "user_email"
        static let obfuscateIp = true
    }
    
    class Ad {
        static let blockerDetected = false
        static let metadata = [
            "custom_field": "Custom value",
            "custom_field_2": "Custom value 2"
        ]
        static let afterStop = 0
        static let campaign = "campaign name"
        static let title = "ad name"
        static let resource = "http://resource.url.com"
        static let givenBreaks = 5
        static let expectedBreaks = 5
        static let breaksTime = [0, 25, 45, 60]
        static let givenAds = 2
        static let creativeId = "12345"
        static let provider = "provider name"
        
        class ExpectedPattern {
            static let pre = [1]
            static let mid = [1,1]
            static let post = [2]
        }
        
        class CustomDimension {
            static let cd1 = "Ad Custom Dimension 1"
            static let cd2 = "Ad Custom Dimension 2"
            static let cd3 = "Ad Custom Dimension 3"
            static let cd4 = "Ad Custom Dimension 4"
            static let cd5 = "Ad Custom Dimension 5"
            static let cd6 = "Ad Custom Dimension 6"
            static let cd7 = "Ad Custom Dimension 7"
            static let cd8 = "Ad Custom Dimension 8"
            static let cd9 = "Ad Custom Dimension 9"
            static let cd10 = "Ad Custom Dimension 10"
        }
    }
    
    class Smartswitch {
        static let configCode = "smartswitch config code"
        static let groupCode = "smartswitch group Code"
        static let contractCode = "smartswitch contract code"
    }
    
    class Parse {
        static let manifest = false
        static let cdnNameHeader = "x-cdn"
        static let cdnTTL = 60.0
        static let cdnSwitchHeader = true
        
        class CDNNode {
            static let requestDebugHeaders = true
            static let list = ["Akamai", "Amazon", "Cloudfront", "Level3", "Fastly", "Highwinds", "Telefonica", "Edgecast", "NosOtt", "Balancer"]
        }
        
        // MARK: - Backward Compatible
        static let parseManifest = true
        static let parseCdnNode = true
        static let parseCdnSwitchHeader = true
        static let parseCdnNodeList = ["Cloudfront", "Level3", "Fastly"]
        static let parseCdnNameHeader = "x-cdn-forward-test"
        static let parseCdnTTL = 55
        // End - Backward Compatible
    }
    
    class Network {
        static let ip = "1.1.1.1"
        static let isp = "ISPTest"
        static let connectionType = "connectionType"
        
        // MARK: - Backward Compatible
        static let networkIP = "127.0.0.1"
        static let networkConnectionType = "cable/dsl"
        static let networkIsp = "orange"
        // End - Backward Compatible
    }
    
    class Device {
        static let code = "iPhoneX"
        static let model = "X"
        static let brand = "Apple"
        static let type = "smartphone"
        static let name = "iPhone"
        static let osName = "iPhone"
        static let osVersion = "15.3"
        static let isAnonymous = false
        static let id = "myUniqueDeviceId"
        static let EDID = "123456"
        
        // MARK: - Backward Compatible
        static let deviceBrand = "BC_deviceBrand"
        static let deviceCode = "BC_deviceCode"
        static let deviceId = "BC_deviceId"
        static let deviceModel = "BC_deviceModel"
        static let deviceOsName = "BC_deviceOsName"
        static let deviceOsVersion = "BC_deviceOsVersion"
        static let deviceType = "BC_deviceType"
        static let deviceIsAnonymous = false
        // End - Backward Compatible
    }

    class Content {
        static let resource = "http://yourhost.com/yourmedia.m3u8"
        static let title = "titleTest"
        static let program = "programName"
        static let duration = 860
        static let transactionCode = "transactionTest"
        static let bitrate = 123456
        static let throughput = 123456
        static let rendition = "myCustomRendition"
        static let cdn = "AKAMAI"
        static let cdnNode = "cdnNode"
        static let cdnType = "cdnType"
        static let fps = 60
        static let streamingProtocol = "HLS" // Youbora has logic to check the value and if it's not one of the following it won't be set ("HDS"/"HLS"/"MSS"/"DASH"/"RTMP"/"RTP"/"RTSP")
        static let transportFormat = "HLS-TS" // Youbora has logic to check the value and if it's not one of the following it won't be set ("HLS-TS"/"HLS-FMP4"/"HLS-CMF")
        static let metadata = [
            "genre": "genreTest",
            "language": "languageTest",
            "year": "yearTest",
       ]
        static let metrics = [
            "metrics1": "metrics1Value"
        ]
        static let package = "package name"
        static let saga = "saga name"
        static let tvShow = "tvShow name"
        static let season = "season number"
        static let episodeTitle = "title name"
        static let channel = "channel name"
        static let id = "id"
        static let imdbId = "imdb id"
        static let gracenoteId = "gracenote id"
        static let type = "type name"
        static let genre = "genre name"
        static let language = "language name"
        static let subtitles = "subtitles name"
        static let contractedResolution = "contracted resolution"
        static let cost = "cost number"
        static let price = "price number"
        static let playbackType = "playback type"
        static let drm = "drm"
        static let customDimensions = [
            "customDimension": "customDimension"
        ]
        static let totalBytes = 123456
        static let sendTotalBytes = true
        
        class IsLive {
            static let isLiveContent = true
            static let noSeek = false
            static let noMonitor = false
        }
        
        class Encoding {
            static let videoCodec = "video codec name"
            static let audioCodec = "audio codec name"
            static let codecSettings = "codec settings" // Youbora site defines it as a String, but the property is configured as a dictionary, need to understand what to do with it, currently ignored.
            static let codecProfile = "codec profile"
            static let containerFormat = "container format"
        }
        
        class CustomDimension {
            static let cd1 = "Custom Dimension 1"
            static let cd2 = "Custom Dimension 2"
            static let cd3 = "Custom Dimension 3"
            static let cd4 = "Custom Dimension 4"
            static let cd5 = "Custom Dimension 5"
            static let cd6 = "Custom Dimension 6"
            static let cd7 = "Custom Dimension 7"
            static let cd8 = "Custom Dimension 8"
            static let cd9 = "Custom Dimension 9"
            static let cd10 = "Custom Dimension 10"
            static let cd11 = "Custom Dimension 11"
            static let cd12 = "Custom Dimension 12"
            static let cd13 = "Custom Dimension 13"
            static let cd14 = "Custom Dimension 14"
            static let cd15 = "Custom Dimension 15"
            static let cd16 = "Custom Dimension 16"
            static let cd17 = "Custom Dimension 17"
            static let cd18 = "Custom Dimension 18"
            static let cd19 = "Custom Dimension 19"
            static let cd20 = "Custom Dimension 20"
        }
        
        // MARK: - Backward Compatible
        static let isDVR = true
        static let title2 = "BC_content title 2"
        static let contentProgram = "BC_Program template" //contentTitle2
        static let contentResource = "BC_Resource template"
        static let contentIsLive = true
        static let contentTitle = "BC_Title template"
        static let contentTitle2 = "BC_Title2 template"
        static let contentDuration: Double = 123.5
        static let contentTransactionCode = "BC_TransactionCode template"
        static let contentBitrate: Double = 123231.32
        static let contentSendTotalBytes: Bool = true
        static let contentStreamingProtocol = "DASH"
        static let contentTransportFormat = "HLS-CMF"
        static let contentThroughput: Int = 2
        static let contentRendition = "BC_Rendition template"
        static let contentCdn = "BC_KALTURA"
        static let contentFps: Double = 60.0
        static let contentIsLiveNoSeek: Bool = true
        static let contentPackage = "BC_Package template"
        static let contentSaga = "BC_Saga template"
        static let contentTvShow = "BC_TvShow template"
        static let contentSeason = "BC_19"
        static let contentEpisodeTitle = "BC_EpisodeTitle template"
        static let contentChannel = "BC_Channel template"
        static let contentId = "BC_ASD323DDSFA321"
        static let contentImdbId = "BC_1234567897654"
        static let contentGracenoteId = "BC_kdkdk488447yyfhfhf7373"
        static let contentType = "BC_Type template"
        static let contentGenre = "BC_Drama"
        static let contentLanguage = "BC_EN"
        static let contentSubtitles = "BC_DE"
        static let contentContractedResolution = "BC_1080p"
        static let contentCost = "BC_FREE"
        static let contentPrice = "BC_0 USD"
        static let contentPlaybackType = "BC_PlaybackType template"
        static let contentDrm = "BC_FPS"
        static let contentEncodingVideoCodec = "BC_mpeg"
        static let contentEncodingAudioCodec = "BC_dd"
        static let contentEncodingCodecProfile = "BC_EncodingCodecProfile template"
        static let contentEncodingContainerFormat = "BC_EncodingContainerFormat template"
        // End - Backward Compatible
    }
    

    
    class App {
        static let name = "myCustomApp"
        static let releaseVersion = "0.1-beta"
        
        // MARK: - Backward Compatible
        static let appName = "BC_App_appName"
        static let appReleaseVersion = "BC_App_appReleaseVersion"
        // End - Backward Compatible
    }
    
    class Session {
        static let metrics: [String : Any] = [
            "metricskey": ["test": 66],
            "metricskey2": "test",
            "metricskey3": 2
        ]
    }
    
    class Errors {
        static let fatal = ["errorcode1", "errorcode2"]
        static let nonFatal = ["errorcode3", "errorcode4"]
        static let ignore = ["errorcode5", "errorcode6"]
        
        // MARK: - Backward Compatible
        static let errorsIgnore = ["exception1", "exception2"]
        static let errorsFatal = ["exception3", "exception4"]
        static let errorsNonFatal = ["exception5", "exception6"]
        // End - Backward Compatible
    }
    
    
    // MARK: - Backward Compatible
    
    class Properties {
        static let genre = "BC genre"
        static let type = "BC type"
        static let transactionType = "BC transactionType"
        static let year = "BC year"
        static let cast = "BC cast"
        static let director = "BC director"
        static let owner = "BC owner"
        static let parental = "BC parental"
        static let price = "BC price"
        static let rating = "BC rating"
        static let audioType = "BC audioType"
        static let audioChannels = "BC audioChannels"
        static let device = "BC device"
        static let quality = "BC quality"
    }
    
    class ContentCustomDimension {
        static let contentCustomDimension1 = "BC_contentCustomDimension1"
        static let contentCustomDimension2 = "BC_contentCustomDimension2"
        static let contentCustomDimension3 = "BC_contentCustomDimension3"
        static let contentCustomDimension4 = "BC_contentCustomDimension4"
        static let contentCustomDimension5 = "BC_contentCustomDimension5"
        static let contentCustomDimension6 = "BC_contentCustomDimension6"
        static let contentCustomDimension7 = "BC_contentCustomDimension7"
        static let contentCustomDimension8 = "BC_contentCustomDimension8"
        static let contentCustomDimension9 = "BC_contentCustomDimension9"
        static let contentCustomDimension10 = "BC_contentCustomDimension10"
        static let contentCustomDimension11 = "BC_contentCustomDimension11"
        static let contentCustomDimension12 = "BC_contentCustomDimension12"
        static let contentCustomDimension13 = "BC_contentCustomDimension13"
        static let contentCustomDimension14 = "BC_contentCustomDimension14"
        static let contentCustomDimension15 = "BC_contentCustomDimension15"
        static let contentCustomDimension16 = "BC_contentCustomDimension16"
        static let contentCustomDimension17 = "BC_contentCustomDimension17"
        static let contentCustomDimension18 = "BC_contentCustomDimension18"
        static let contentCustomDimension19 = "BC_contentCustomDimension19"
        static let contentCustomDimension20 = "BC_contentCustomDimension20"
    }
    
    class ExtraParams {
        static let param1 = "BC_MyParam1"
        static let param2 = "BC_MyParam2"
        static let param3 = "BC_MyParam3"
        static let param4 = "BC_MyParam4"
        static let param5 = "BC_MyParam5"
        static let param6 = "BC_MyParam6"
        static let param7 = "BC_MyParam7"
        static let param8 = "BC_MyParam8"
        static let param9 = "BC_MyParam9"
        static let param10 = "BC_MyParam10"
    }
    
    class Ads {
        static let adBreaksTime = [10, 20, 30]
        static let adCampaign = "BC_Campaign Name 1"
        static let campaign = "BC_Campaign Name 2"
        static let adCreativeId = "BC_123456"
        static let adExpectedBreaks = 123
        static let adGivenBreaks = 234
        static let adProvider = "BC_Provider name"
        static let adResource = "BC_Some resources"
        static let adTitle = "BC_Ad title"
        static let adGivenAds = 3
        
        static let adCustomDimension1 = "BC_My_adCustomDimension1"
        static let adCustomDimension2 = "BC_My_adCustomDimension2"
        static let adCustomDimension3 = "BC_My_adCustomDimension3"
        static let adCustomDimension4 = "BC_My_adCustomDimension4"
        static let adCustomDimension5 = "BC_My_adCustomDimension5"
        static let adCustomDimension6 = "BC_My_adCustomDimension6"
        static let adCustomDimension7 = "BC_My_adCustomDimension7"
        static let adCustomDimension8 = "BC_My_adCustomDimension8"
        static let adCustomDimension9 = "BC_My_adCustomDimension9"
        static let adCustomDimension10 = "BC_My_adCustomDimension10"
    }
    
    class Media {
        static let resource = "BC_Media_resource"
        static let isLive = true
        static let isDVR = true
        static let title = "BC_Media_title"
        static let title2 = "BC_Media_title2"
        static let program = "BC_Media_program"
        static let duration = 222
        static let transactionCode = "BC_Media_transactionCode"
    }
}

extension YouboraConfigTemplate {
    
    static let ybConfigParams: [String: Any] = [
        "accountCode": Template.accountCode,
        "enabled": Template.enabled,
        "httpSecure": Template.httpSecure,
        "host": Template.host,
        "authToken": Template.authToken,
        "authType": Template.authType,
        "username": Template.username,
        "offline": Template.offline,
        "autoDetectBackground": Template.autoDetectBackground,
        "forceInit": Template.forceInit,
        "experiments": Template.experiments,
        "linkedViewId": Template.linkedViewId,
        "waitForMetadata": Template.waitForMetadata,
        "pendingMetadata": Template.pendingMetadata, // The name of the parameters in the request we are waiting for
        "householdId": Template.householdId,
        "user": [
            "anonymousId": Template.User.anonymousId,
            "type": Template.User.type,
            "email": Template.User.email,
            "obfuscateIp": Template.User.obfuscateIp
        ],
        "ad": [
            "blockerDetected": Template.Ad.blockerDetected,
            "metadata": Template.Ad.metadata,
            "afterStop": Template.Ad.afterStop,
            "campaign": Template.Ad.campaign,
            "title": Template.Ad.title,
            "resource": Template.Ad.resource,
            "givenBreaks": Template.Ad.givenBreaks,
            "expectedBreaks": Template.Ad.expectedBreaks,
            "expectedPattern": [
                "pre": Template.Ad.ExpectedPattern.pre,
                "mid": Template.Ad.ExpectedPattern.mid,
                "post": Template.Ad.ExpectedPattern.post
            ],
            "breaksTime": Template.Ad.breaksTime,
            "givenAds": Template.Ad.givenAds,
            "creativeId": Template.Ad.creativeId,
            "provider": Template.Ad.provider,
            "customDimension": [
                "1": Template.Ad.CustomDimension.cd1,
                "2": Template.Ad.CustomDimension.cd2,
                "3": Template.Ad.CustomDimension.cd3,
                "4": Template.Ad.CustomDimension.cd4,
                "5": Template.Ad.CustomDimension.cd5,
                "6": Template.Ad.CustomDimension.cd6,
                "7": Template.Ad.CustomDimension.cd7,
                "8": Template.Ad.CustomDimension.cd8,
                "9": Template.Ad.CustomDimension.cd9,
                "10": Template.Ad.CustomDimension.cd10
            ]
        ],
        "smartswitch": [
            "configCode": Template.Smartswitch.configCode,
            "groupCode": Template.Smartswitch.groupCode,
            "contractCode": Template.Smartswitch.contractCode
        ],
        "parse": [
            "manifest": Template.Parse.manifest,
            "cdnNameHeader": Template.Parse.cdnNameHeader,
//                "cdnNode": true, // Ignored, use requestDebugHeaders within cdnNode
            "cdnNode": [
                "requestDebugHeaders": Template.Parse.CDNNode.requestDebugHeaders, // Replaces cdnNode that was ignored outside.
                "list": Template.Parse.CDNNode.list,
            ],
            "cdnTTL": Template.Parse.cdnTTL, // Interval of time to search for a new cdn
            "cdnSwitchHeader": Template.Parse.cdnSwitchHeader
        ],
        "network": [
            "ip": Template.Network.ip,
            "isp": Template.Network.isp,
            "connectionType": Template.Network.connectionType
        ],
        "device": [
            "code": Template.Device.code,
            "model" : Template.Device.model,
            "brand": Template.Device.brand,
            "type": Template.Device.type,
            "name": Template.Device.name,
            "osName": Template.Device.osName,
            "osVersion": Template.Device.osVersion,
            "isAnonymous": Template.Device.isAnonymous,
            "id": Template.Device.id,
            "EDID": Template.Device.EDID
        ],
        "content": [
            "resource": Template.Content.resource,
//                "isLive": true, // Ignored, use isLiveContent within isLive
            "isLive": [
                "isLiveContent": Template.Content.IsLive.isLiveContent, // Replaces isLive that was ignored outside.
                "noSeek": Template.Content.IsLive.noSeek,
                "noMonitor": Template.Content.IsLive.noMonitor,
            ],
            "title": Template.Content.title,
            "program": Template.Content.program,
            "duration": Template.Content.duration,
            "transactionCode": Template.Content.transactionCode,
            "bitrate": Template.Content.bitrate,
            "throughput": Template.Content.throughput,
            "rendition": Template.Content.rendition,
            "cdn": Template.Content.cdn,
            "cdnNode": Template.Content.cdnNode,
            "cdnType": Template.Content.cdnType,
            "fps": Template.Content.fps,
            "streamingProtocol": Template.Content.streamingProtocol,
            "transportFormat": Template.Content.transportFormat,
            "metadata": Template.Content.metadata,
            "metrics": Template.Content.metrics,
            "package": Template.Content.package,
            "saga": Template.Content.saga,
            "tvShow": Template.Content.tvShow,
            "season": Template.Content.season,
            "episodeTitle": Template.Content.episodeTitle,
            "channel": Template.Content.channel,
            "id": Template.Content.id,
            "imdbId": Template.Content.imdbId,
            "gracenoteId": Template.Content.gracenoteId,
            "type": Template.Content.type,
            "genre": Template.Content.genre,
            "language": Template.Content.language,
            "subtitles": Template.Content.subtitles,
            "contractedResolution": Template.Content.contractedResolution,
            "cost": Template.Content.cost,
            "price": Template.Content.price,
            "playbackType": Template.Content.playbackType,
            "drm": Template.Content.drm,
            "encoding": [
                "videoCodec": Template.Content.Encoding.videoCodec,
                "audioCodec": Template.Content.Encoding.audioCodec,
//                "codecSettings": "codec settings", // Ignored until understood
                "codecProfile": Template.Content.Encoding.codecProfile,
                "containerFormat": Template.Content.Encoding.containerFormat
            ],
            "customDimension": [
                "1": Template.Content.CustomDimension.cd1,
                "2": Template.Content.CustomDimension.cd2,
                "3": Template.Content.CustomDimension.cd3,
                "4": Template.Content.CustomDimension.cd4,
                "5": Template.Content.CustomDimension.cd5,
                "6": Template.Content.CustomDimension.cd6,
                "7": Template.Content.CustomDimension.cd7,
                "8": Template.Content.CustomDimension.cd8,
                "9": Template.Content.CustomDimension.cd9,
                "10": Template.Content.CustomDimension.cd10,
                "11": Template.Content.CustomDimension.cd11,
                "12": Template.Content.CustomDimension.cd12,
                "13": Template.Content.CustomDimension.cd13,
                "14": Template.Content.CustomDimension.cd14,
                "15": Template.Content.CustomDimension.cd15,
                "16": Template.Content.CustomDimension.cd16,
                "17": Template.Content.CustomDimension.cd17,
                "18": Template.Content.CustomDimension.cd18,
                "19": Template.Content.CustomDimension.cd19,
                "20": Template.Content.CustomDimension.cd20
            ],
            "customDimensions": Template.Content.customDimensions,
            "totalBytes": Template.Content.totalBytes,
            "sendTotalBytes": Template.Content.sendTotalBytes
        ],
        "app": [
            "name": Template.App.name,
            "releaseVersion": Template.App.releaseVersion
        ],
        "session": [
            "metrics": Template.Session.metrics
        ],
        "errors": [
            "fatal": Template.Errors.fatal,
            "nonFatal": Template.Errors.nonFatal,
            "ignore": Template.Errors.ignore
        ]
    ]
    
    static let ybBackwardCompatibleConfigParams: [String: Any] = [
        "accountCode": Template.accountCode,
        "username": Template.username,
        "userEmail": Template.userEmail,
        "userType": Template.userType, // optional any string - free / paid etc.
        "userAnonymousId": Template.userAnonymousId,
        "userObfuscateIp": Template.userObfuscateIp,
        "houseHoldId": Template.houseHoldId, // optional which device is used to play
        "httpSecure": Template.httpSecure, // youbora events will be sent via https
        "autoDetectBackground": Template.autoDetectBackground,
        "isEnabled": Template.isEnabled,
        "isForceInit": Template.isForceInit,
        "parse": [
            "parseManifest": Template.Parse.parseManifest,
            "parseCdnNode": Template.Parse.parseCdnNode,
            "parseCdnSwitchHeader": Template.Parse.parseCdnSwitchHeader,
            "parseCdnNodeList": Template.Parse.parseCdnNodeList,
            "parseCdnNameHeader": Template.Parse.parseCdnNameHeader,
            "parseCdnTTL": Template.Parse.parseCdnTTL
        ],
        "app": [
            "appName": Template.App.appName,
            "appReleaseVersion": Template.App.appReleaseVersion
        ],
        "extraParams": [
            "param1": Template.ExtraParams.param1,
            "param2": Template.ExtraParams.param2,
            "param3": Template.ExtraParams.param3,
            "param4": Template.ExtraParams.param4,
            "param5": Template.ExtraParams.param5,
            "param6": Template.ExtraParams.param6,
            "param7": Template.ExtraParams.param7,
            "param8": Template.ExtraParams.param8,
            "param9": Template.ExtraParams.param9,
            "param10": Template.ExtraParams.param10
        ],
        "contentCustomDimensions": [
            "contentCustomDimension1": Template.ContentCustomDimension.contentCustomDimension1,
            "contentCustomDimension2": Template.ContentCustomDimension.contentCustomDimension2,
            "contentCustomDimension3": Template.ContentCustomDimension.contentCustomDimension3,
            "contentCustomDimension4": Template.ContentCustomDimension.contentCustomDimension4,
            "contentCustomDimension5": Template.ContentCustomDimension.contentCustomDimension5,
            "contentCustomDimension6": Template.ContentCustomDimension.contentCustomDimension6,
            "contentCustomDimension7": Template.ContentCustomDimension.contentCustomDimension7,
            "contentCustomDimension8": Template.ContentCustomDimension.contentCustomDimension8,
            "contentCustomDimension9": Template.ContentCustomDimension.contentCustomDimension9,
            "contentCustomDimension10": Template.ContentCustomDimension.contentCustomDimension10
        ],
        "ads": [
            "adBreaksTime": Template.Ads.adBreaksTime,
            "adCampaign": Template.Ads.adCampaign,
            "campaign": Template.Ads.campaign,
            "adCreativeId": Template.Ads.adCreativeId,
            "adExpectedBreaks": Template.Ads.adExpectedBreaks,
            "adGivenBreaks": Template.Ads.adGivenBreaks,
            "adProvider": Template.Ads.adProvider,
            "adResource": Template.Ads.adResource,
            "adTitle": Template.Ads.adTitle,
            "adGivenAds": Template.Ads.adGivenAds,
            "adCustomDimensions": [
                "adCustomDimension1": Template.Ads.adCustomDimension1,
                "adCustomDimension2": Template.Ads.adCustomDimension2,
                "adCustomDimension3": Template.Ads.adCustomDimension3,
                "adCustomDimension4": Template.Ads.adCustomDimension4,
                "adCustomDimension5": Template.Ads.adCustomDimension5,
                "adCustomDimension6": Template.Ads.adCustomDimension6,
                "adCustomDimension7": Template.Ads.adCustomDimension7,
                "adCustomDimension8": Template.Ads.adCustomDimension8,
                "adCustomDimension9": Template.Ads.adCustomDimension9,
                "adCustomDimension10": Template.Ads.adCustomDimension10
            ]
        ],
        "media": [
            "resource": Template.Media.resource,
            "isLive": Template.Media.isLive,
            "isDVR": Template.Media.isDVR,
            "title": Template.Media.title,
            "title2": Template.Media.title2,
            "program": Template.Media.program,
            "duration": Template.Media.duration,
            "transactionCode": Template.Media.transactionCode
        ],
        "content": [
            "contentProgram": Template.Content.contentProgram, //contentTitle2
            "contentResource": Template.Content.contentResource,
            "contentIsLive": Template.Content.contentIsLive,
            "contentTitle": Template.Content.contentTitle,
            "contentTitle2": Template.Content.contentTitle2,
            "contentDuration": Template.Content.contentDuration,
            "contentTransactionCode": Template.Content.contentTransactionCode,
            "contentBitrate": Template.Content.contentBitrate,
            "contentSendTotalBytes": Template.Content.contentSendTotalBytes,
            "contentStreamingProtocol": Template.Content.contentStreamingProtocol,
            "contentTransportFormat": Template.Content.contentTransportFormat,
            "contentThroughput": Template.Content.contentThroughput,
            "contentRendition": Template.Content.contentRendition,
            "contentCdn": Template.Content.contentCdn,
            "contentFps": Template.Content.contentFps,
            "contentIsLiveNoSeek": Template.Content.contentIsLiveNoSeek,
            "contentPackage": Template.Content.contentPackage,
            "contentSaga": Template.Content.contentSaga,
            "contentTvShow": Template.Content.contentTvShow,
            "contentSeason": Template.Content.contentSeason,
            "contentEpisodeTitle": Template.Content.contentEpisodeTitle,
            "contentChannel": Template.Content.contentChannel,
            "contentId": Template.Content.contentId,
            "contentImdbId": Template.Content.contentImdbId,
            "contentGracenoteId": Template.Content.contentGracenoteId,
            "contentType": Template.Content.contentType,
            "contentGenre": Template.Content.contentGenre,
            "contentLanguage": Template.Content.contentLanguage,
            "contentSubtitles": Template.Content.contentSubtitles,
            "contentContractedResolution": Template.Content.contentContractedResolution,
            "contentCost": Template.Content.contentCost,
            "contentPrice": Template.Content.contentPrice,
            "contentPlaybackType": Template.Content.contentPlaybackType,
            "contentDrm": Template.Content.contentDrm,
            "contentEncodingVideoCodec": Template.Content.contentEncodingVideoCodec,
            "contentEncodingAudioCodec": Template.Content.contentEncodingAudioCodec,
            "contentEncodingCodecProfile": Template.Content.contentEncodingCodecProfile,
            "contentEncodingContainerFormat": Template.Content.contentEncodingContainerFormat,
            "isDVR": Template.Content.isDVR
        ],
        "device": [
            "deviceBrand": Template.Device.deviceBrand,
            "deviceCode": Template.Device.deviceCode,
            "deviceId": Template.Device.deviceId,
            "deviceModel": Template.Device.deviceModel,
            "deviceOsName": Template.Device.deviceOsName,
            "deviceOsVersion": Template.Device.deviceOsVersion,
            "deviceType": Template.Device.deviceType,
            "deviceIsAnonymous": Template.Device.deviceIsAnonymous
        ],
        "network": [
            "networkIP": Template.Network.networkIP,
            "networkIsp": Template.Network.networkIsp,
            "networkConnectionType": Template.Network.networkConnectionType
        ],
        "errors": [
            "errorsIgnore": Template.Errors.errorsIgnore,
            "errorsFatal": Template.Errors.errorsFatal,
            "errorsNonFatal": Template.Errors.errorsNonFatal
        ],
        "properties": [
            "year": Template.Properties.year,
            "cast": Template.Properties.cast,
            "director": Template.Properties.director,
            "owner": Template.Properties.owner,
            "parental": Template.Properties.parental,
            "rating": Template.Properties.rating,
            "audioChannels": Template.Properties.audioChannels,
            "device": Template.Properties.device
        ]
    ]
}
