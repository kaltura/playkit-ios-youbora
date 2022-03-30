//
//  YouboraConfigTemplate_BC.swift
//  PlayKitYouboraSampleTests
//
//  Created by Nilit Danan on 25/03/2022.
//


// A test case for Backward Compatible sent values.
extension YouboraConfigTemplate {
    class BCValues {
        static let accountCode = "kalturatest"
        static let httpSecure = true
        static let username = "User Name"
        static let autoDetectBackground = true
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
        
        class Parse {
            static let parseManifest = true
            static let parseCdnNode = true
            static let parseCdnSwitchHeader = true
            static let parseCdnNodeList = ["Cloudfront", "Level3", "Fastly"]
            static let parseCdnNameHeader = "x-cdn-forward-test"
            static let parseCdnTTL = 55
        }
        
        class Network {
            static let networkIP = "127.0.0.1"
            static let networkConnectionType = "cable/dsl"
            static let networkIsp = "orange"
        }
        
        class Device {
            static let deviceBrand = "BC_deviceBrand"
            static let deviceCode = "BC_deviceCode"
            static let deviceId = "BC_deviceId"
            static let deviceModel = "BC_deviceModel"
            static let deviceOsName = "BC_deviceOsName"
            static let deviceOsVersion = "BC_deviceOsVersion"
            static let deviceType = "BC_deviceType"
            static let deviceIsAnonymous = false
        }
        
        class Content {
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
        }
        
        class App {
            static let appName = "BC_App_appName"
            static let appReleaseVersion = "BC_App_appReleaseVersion"
        }
        
        class Errors {
            static let errorsIgnore = ["exception1", "exception2"]
            static let errorsFatal = ["exception3", "exception4"]
            static let errorsNonFatal = ["exception5", "exception6"]
        }
        
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
    
    static let ybBackwardCompatibleConfigParams: [String: Any] = [
        "accountCode": Template.BCValues.accountCode,
        "username": Template.BCValues.username,
        "userEmail": Template.BCValues.userEmail,
        "userType": Template.BCValues.userType, // optional any string - free / paid etc.
        "userAnonymousId": Template.BCValues.userAnonymousId,
        "userObfuscateIp": Template.BCValues.userObfuscateIp,
        "houseHoldId": Template.BCValues.houseHoldId, // optional which device is used to play
        "httpSecure": Template.BCValues.httpSecure, // youbora events will be sent via https
        "autoDetectBackground": Template.BCValues.autoDetectBackground,
        "isEnabled": Template.BCValues.isEnabled,
        "isForceInit": Template.BCValues.isForceInit,
        "parse": [
            "parseManifest": Template.BCValues.Parse.parseManifest,
            "parseCdnNode": Template.BCValues.Parse.parseCdnNode,
            "parseCdnSwitchHeader": Template.BCValues.Parse.parseCdnSwitchHeader,
            "parseCdnNodeList": Template.BCValues.Parse.parseCdnNodeList,
            "parseCdnNameHeader": Template.BCValues.Parse.parseCdnNameHeader,
            "parseCdnTTL": Template.BCValues.Parse.parseCdnTTL
        ],
        "app": [
            "appName": Template.BCValues.App.appName,
            "appReleaseVersion": Template.BCValues.App.appReleaseVersion
        ],
        "extraParams": [
            "param1": Template.BCValues.ExtraParams.param1,
            "param2": Template.BCValues.ExtraParams.param2,
            "param3": Template.BCValues.ExtraParams.param3,
            "param4": Template.BCValues.ExtraParams.param4,
            "param5": Template.BCValues.ExtraParams.param5,
            "param6": Template.BCValues.ExtraParams.param6,
            "param7": Template.BCValues.ExtraParams.param7,
            "param8": Template.BCValues.ExtraParams.param8,
            "param9": Template.BCValues.ExtraParams.param9,
            "param10": Template.BCValues.ExtraParams.param10
        ],
        "contentCustomDimensions": [
            "contentCustomDimension1": Template.BCValues.ContentCustomDimension.contentCustomDimension1,
            "contentCustomDimension2": Template.BCValues.ContentCustomDimension.contentCustomDimension2,
            "contentCustomDimension3": Template.BCValues.ContentCustomDimension.contentCustomDimension3,
            "contentCustomDimension4": Template.BCValues.ContentCustomDimension.contentCustomDimension4,
            "contentCustomDimension5": Template.BCValues.ContentCustomDimension.contentCustomDimension5,
            "contentCustomDimension6": Template.BCValues.ContentCustomDimension.contentCustomDimension6,
            "contentCustomDimension7": Template.BCValues.ContentCustomDimension.contentCustomDimension7,
            "contentCustomDimension8": Template.BCValues.ContentCustomDimension.contentCustomDimension8,
            "contentCustomDimension9": Template.BCValues.ContentCustomDimension.contentCustomDimension9,
            "contentCustomDimension10": Template.BCValues.ContentCustomDimension.contentCustomDimension10
        ],
        "ads": [
            "adBreaksTime": Template.BCValues.Ads.adBreaksTime,
            "adCampaign": Template.BCValues.Ads.adCampaign,
            "campaign": Template.BCValues.Ads.campaign,
            "adCreativeId": Template.BCValues.Ads.adCreativeId,
            "adExpectedBreaks": Template.BCValues.Ads.adExpectedBreaks,
            "adGivenBreaks": Template.BCValues.Ads.adGivenBreaks,
            "adProvider": Template.BCValues.Ads.adProvider,
            "adResource": Template.BCValues.Ads.adResource,
            "adTitle": Template.BCValues.Ads.adTitle,
            "adGivenAds": Template.BCValues.Ads.adGivenAds,
            "adCustomDimensions": [
                "adCustomDimension1": Template.BCValues.Ads.adCustomDimension1,
                "adCustomDimension2": Template.BCValues.Ads.adCustomDimension2,
                "adCustomDimension3": Template.BCValues.Ads.adCustomDimension3,
                "adCustomDimension4": Template.BCValues.Ads.adCustomDimension4,
                "adCustomDimension5": Template.BCValues.Ads.adCustomDimension5,
                "adCustomDimension6": Template.BCValues.Ads.adCustomDimension6,
                "adCustomDimension7": Template.BCValues.Ads.adCustomDimension7,
                "adCustomDimension8": Template.BCValues.Ads.adCustomDimension8,
                "adCustomDimension9": Template.BCValues.Ads.adCustomDimension9,
                "adCustomDimension10": Template.BCValues.Ads.adCustomDimension10
            ]
        ],
        "media": [
            "resource": Template.BCValues.Media.resource,
            "isLive": Template.BCValues.Media.isLive,
            "isDVR": Template.BCValues.Media.isDVR,
            "title": Template.BCValues.Media.title,
            "title2": Template.BCValues.Media.title2,
            "program": Template.BCValues.Media.program,
            "duration": Template.BCValues.Media.duration,
            "transactionCode": Template.BCValues.Media.transactionCode
        ],
        "content": [
            "contentProgram": Template.BCValues.Content.contentProgram, //contentTitle2
            "contentResource": Template.BCValues.Content.contentResource,
            "contentIsLive": Template.BCValues.Content.contentIsLive,
            "contentTitle": Template.BCValues.Content.contentTitle,
            "contentTitle2": Template.BCValues.Content.contentTitle2,
            "contentDuration": Template.BCValues.Content.contentDuration,
            "contentTransactionCode": Template.BCValues.Content.contentTransactionCode,
            "contentBitrate": Template.BCValues.Content.contentBitrate,
            "contentSendTotalBytes": Template.BCValues.Content.contentSendTotalBytes,
            "contentStreamingProtocol": Template.BCValues.Content.contentStreamingProtocol,
            "contentTransportFormat": Template.BCValues.Content.contentTransportFormat,
            "contentThroughput": Template.BCValues.Content.contentThroughput,
            "contentRendition": Template.BCValues.Content.contentRendition,
            "contentCdn": Template.BCValues.Content.contentCdn,
            "contentFps": Template.BCValues.Content.contentFps,
            "contentIsLiveNoSeek": Template.BCValues.Content.contentIsLiveNoSeek,
            "contentPackage": Template.BCValues.Content.contentPackage,
            "contentSaga": Template.BCValues.Content.contentSaga,
            "contentTvShow": Template.BCValues.Content.contentTvShow,
            "contentSeason": Template.BCValues.Content.contentSeason,
            "contentEpisodeTitle": Template.BCValues.Content.contentEpisodeTitle,
            "contentChannel": Template.BCValues.Content.contentChannel,
            "contentId": Template.BCValues.Content.contentId,
            "contentImdbId": Template.BCValues.Content.contentImdbId,
            "contentGracenoteId": Template.BCValues.Content.contentGracenoteId,
            "contentType": Template.BCValues.Content.contentType,
            "contentGenre": Template.BCValues.Content.contentGenre,
            "contentLanguage": Template.BCValues.Content.contentLanguage,
            "contentSubtitles": Template.BCValues.Content.contentSubtitles,
            "contentContractedResolution": Template.BCValues.Content.contentContractedResolution,
            "contentCost": Template.BCValues.Content.contentCost,
            "contentPrice": Template.BCValues.Content.contentPrice,
            "contentPlaybackType": Template.BCValues.Content.contentPlaybackType,
            "contentDrm": Template.BCValues.Content.contentDrm,
            "contentEncodingVideoCodec": Template.BCValues.Content.contentEncodingVideoCodec,
            "contentEncodingAudioCodec": Template.BCValues.Content.contentEncodingAudioCodec,
            "contentEncodingCodecProfile": Template.BCValues.Content.contentEncodingCodecProfile,
            "contentEncodingContainerFormat": Template.BCValues.Content.contentEncodingContainerFormat,
            "isDVR": Template.BCValues.Content.isDVR
        ],
        "device": [
            "deviceBrand": Template.BCValues.Device.deviceBrand,
            "deviceCode": Template.BCValues.Device.deviceCode,
            "deviceId": Template.BCValues.Device.deviceId,
            "deviceModel": Template.BCValues.Device.deviceModel,
            "deviceOsName": Template.BCValues.Device.deviceOsName,
            "deviceOsVersion": Template.BCValues.Device.deviceOsVersion,
            "deviceType": Template.BCValues.Device.deviceType,
            "deviceIsAnonymous": Template.BCValues.Device.deviceIsAnonymous
        ],
        "network": [
            "networkIP": Template.BCValues.Network.networkIP,
            "networkIsp": Template.BCValues.Network.networkIsp,
            "networkConnectionType": Template.BCValues.Network.networkConnectionType
        ],
        "errors": [
            "errorsIgnore": Template.BCValues.Errors.errorsIgnore,
            "errorsFatal": Template.BCValues.Errors.errorsFatal,
            "errorsNonFatal": Template.BCValues.Errors.errorsNonFatal
        ],
        "properties": [
            "year": Template.BCValues.Properties.year,
            "cast": Template.BCValues.Properties.cast,
            "director": Template.BCValues.Properties.director,
            "owner": Template.BCValues.Properties.owner,
            "parental": Template.BCValues.Properties.parental,
            "rating": Template.BCValues.Properties.rating,
            "audioChannels": Template.BCValues.Properties.audioChannels,
            "device": Template.BCValues.Properties.device
        ]
    ]
}
