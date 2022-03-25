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
    }
    
    class Network {
        static let ip = "1.1.1.1"
        static let isp = "ISPTest"
        static let connectionType = "connectionType"
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
    }
    
    class App {
        static let name = "myCustomApp"
        static let releaseVersion = "0.1-beta"
    }
    
    class Session {
        static let metrics: [String : Any] = [
            "metricskey": ["test": 66],
            "metricskey2": "test",
            "metricskey3": 2,
            "metricskey4": 4.6,
            "metricskey5": true
        ]
    }
    
    class Errors {
        static let fatal = ["errorcode1", "errorcode2"]
        static let nonFatal = ["errorcode3", "errorcode4"]
        static let ignore = ["errorcode5", "errorcode6"]
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
}
