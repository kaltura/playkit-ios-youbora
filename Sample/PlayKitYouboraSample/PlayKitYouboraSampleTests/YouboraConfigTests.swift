//
//  YouboraConfigTests.swift
//  PlayKitYouboraSampleTests
//
//  Created by Sergey Chausov on 27.04.2021.
//

import XCTest
import PlayKit
@testable import PlayKitYoubora
import YouboraLib

class YouboraConfigTests: XCTestCase {
    
    var ybOptions: YBOptions?
    var ybBCOptions: YBOptions?
    var ybKUXOptions: YBOptions?
    typealias ybCT = YouboraConfigTemplate
    
    let ybOptionsNilMessage = "The Youbora Config YBOptions is nil."
    
    override func setUp() {
        
        self.ybOptions = getYBOptions(for: ybCT.ybConfigParams)
        
        // Backward Compatible Config
        self.ybBCOptions = getYBOptions(for: ybCT.ybBackwardCompatibleConfigParams)
        
        // KUX config
        self.ybKUXOptions = getYBOptions(for: ybCT.ybKUXConfigParams)
    }
    
    func getYBOptions(for configParams: [String : Any]) -> YBOptions? {
        let config = AnalyticsConfig(params: configParams)
        
        if !JSONSerialization.isValidJSONObject(config.params) {
            XCTAssertThrowsError("Config params is not a valid JSON Object")
            return nil
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: config.params, options: .prettyPrinted)
            let decodedYouboraConfig = try JSONDecoder().decode(YouboraConfig.self, from: data)
            return decodedYouboraConfig.options()

        } catch let error as NSError {
            XCTAssertThrowsError("Couldn't parse data into YouboraConfig error: \(error)")
        }
        
        return nil
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGeneralOptions() throws {
        guard let options = self.ybOptions else {
            XCTFail(ybOptionsNilMessage)
            return
        }
        
        // Testing High level data
        XCTAssertTrue(options.accountCode == ybCT.accountCode)
        XCTAssertTrue(options.enabled == ybCT.enabled)
        XCTAssertTrue(options.httpSecure == ybCT.httpSecure)
        XCTAssertTrue(options.host == ybCT.host)
        XCTAssertTrue(options.authToken == ybCT.authToken)
        XCTAssertTrue(options.authType == ybCT.authType)
        XCTAssertTrue(options.username == ybCT.username)
        XCTAssertTrue(options.offline == ybCT.offline)
        XCTAssertTrue(options.autoDetectBackground == ybCT.autoDetectBackground)
        XCTAssertTrue(options.forceInit == ybCT.forceInit)
        
        let experimentIds = options.experimentIds
        let templateExperiments = ybCT.experiments
        XCTAssertTrue(experimentIds?.count == templateExperiments.count)
        for experimentId in templateExperiments {
            if !(experimentIds?.contains(experimentId) ?? false) {
                XCTFail()
            }
        }
        
        XCTAssertTrue(options.linkedViewId == ybCT.linkedViewId)
        XCTAssertTrue(options.waitForMetadata == ybCT.waitForMetadata)
        
        let pendingMetadata = options.pendingMetadata
        let templatePendingMetadata = ybCT.pendingMetadata
        XCTAssertTrue(pendingMetadata?.count == templatePendingMetadata.count)
        for metadata in templatePendingMetadata {
            if !(pendingMetadata?.contains(metadata) ?? false) {
                XCTFail()
            }
        }
        
        // Note: householdId can't be checked because we need the PKYouboraPlayerAdapter, which we currently don't create.
        // We are currently only checking the options function which creates the YBOptions with the data from the config.
    }
    
    func testUserOptions() throws {
        guard let options = self.ybOptions else {
            XCTFail(ybOptionsNilMessage)
            return
        }
        
        // Testing properties in User
        XCTAssertTrue(options.anonymousUser == ybCT.User.anonymousId)
        XCTAssertTrue(options.userType == ybCT.User.type)
        XCTAssertTrue(options.userEmail == ybCT.User.email)
        XCTAssertTrue(options.userObfuscateIp == NSNumber(booleanLiteral: ybCT.User.obfuscateIp))
    }
    
    func testAdOptions() throws {
        guard let options = self.ybOptions else {
            XCTFail(ybOptionsNilMessage)
            return
        }
        
        // Testing properties in Ad
        XCTAssertTrue(options.adBlockerDetected == NSNumber(booleanLiteral: ybCT.Ad.blockerDetected))
        
        let templateAdMetadata = ybCT.Ad.metadata
        for metadata in templateAdMetadata.keys {
            if let adMetadata = options.adMetadata as? [String: String] {
                XCTAssertTrue(adMetadata[metadata] == templateAdMetadata[metadata])
            } else {
                XCTFail()
            }
        }
        
        XCTAssertTrue(options.adsAfterStop == NSNumber(value: ybCT.Ad.afterStop))
        XCTAssertTrue(options.adCampaign == ybCT.Ad.campaign)
        XCTAssertTrue(options.adTitle == ybCT.Ad.title)
        XCTAssertTrue(options.adResource == ybCT.Ad.resource)
        XCTAssertTrue(options.adGivenBreaks == NSNumber(value: ybCT.Ad.givenBreaks))
        XCTAssertTrue(options.adExpectedBreaks == NSNumber(value: ybCT.Ad.expectedBreaks))
        
        // ExpectedPattern
        let preExpectedPattern = options.adExpectedPattern?[YBOptionKeys.adPositionPre]
        let templatePreExpectedPattern = ybCT.Ad.ExpectedPattern.pre
        XCTAssertTrue(preExpectedPattern?.count == templatePreExpectedPattern.count)
        for preEP in templatePreExpectedPattern {
            if !(preExpectedPattern?.contains(NSNumber(value: preEP)) ?? false) {
                XCTFail()
            }
        }
        let midExpectedPattern = options.adExpectedPattern?[YBOptionKeys.adPositionMid]
        let templateMidExpectedPattern = ybCT.Ad.ExpectedPattern.mid
        XCTAssertTrue(midExpectedPattern?.count == templateMidExpectedPattern.count)
        for midEP in templateMidExpectedPattern {
            if !(midExpectedPattern?.contains(NSNumber(value: midEP)) ?? false) {
                XCTFail()
            }
        }
        let postExpectedPattern = options.adExpectedPattern?[YBOptionKeys.adPositionPost]
        let templatePostExpectedPattern = ybCT.Ad.ExpectedPattern.post
        XCTAssertTrue(postExpectedPattern?.count == templatePostExpectedPattern.count)
        for postEP in templatePostExpectedPattern {
            if !(postExpectedPattern?.contains(NSNumber(value: postEP)) ?? false) {
                XCTFail()
            }
        }
        
        let adBreaksTime = options.adBreaksTime as? [Int]
        let templateAdBreaksTime = ybCT.Ad.breaksTime
        XCTAssertTrue(adBreaksTime?.count == templateAdBreaksTime.count)
        for adBreakTime in templateAdBreaksTime {
            if !(adBreaksTime?.contains(adBreakTime) ?? false) {
                XCTFail()
            }
        }
        
        XCTAssertTrue(options.adGivenAds == NSNumber(value: ybCT.Ad.givenAds))
        XCTAssertTrue(options.adCreativeId == ybCT.Ad.creativeId)
        XCTAssertTrue(options.adProvider == ybCT.Ad.provider)
        
        // CustomDimension
        XCTAssertTrue(options.adCustomDimension1 == ybCT.Ad.CustomDimension.cd1)
        XCTAssertTrue(options.adCustomDimension2 == ybCT.Ad.CustomDimension.cd2)
        XCTAssertTrue(options.adCustomDimension3 == ybCT.Ad.CustomDimension.cd3)
        XCTAssertTrue(options.adCustomDimension4 == ybCT.Ad.CustomDimension.cd4)
        XCTAssertTrue(options.adCustomDimension5 == ybCT.Ad.CustomDimension.cd5)
        XCTAssertTrue(options.adCustomDimension6 == ybCT.Ad.CustomDimension.cd6)
        XCTAssertTrue(options.adCustomDimension7 == ybCT.Ad.CustomDimension.cd7)
        XCTAssertTrue(options.adCustomDimension8 == ybCT.Ad.CustomDimension.cd8)
        XCTAssertTrue(options.adCustomDimension9 == ybCT.Ad.CustomDimension.cd9)
        XCTAssertTrue(options.adCustomDimension10 == ybCT.Ad.CustomDimension.cd10)
    }
    
    func testSmartSwitchOptions() {
        guard let options = self.ybOptions else {
            XCTFail(ybOptionsNilMessage)
            return
        }
        
        // Testing properties in SmartSwitch
        XCTAssertTrue(options.smartswitchConfigCode == ybCT.Smartswitch.configCode)
        XCTAssertTrue(options.smartswitchGroupCode == ybCT.Smartswitch.groupCode)
        XCTAssertTrue(options.smartswitchContractCode == ybCT.Smartswitch.contractCode)
    }
    
    func testParseOptions() throws {
        guard let options = self.ybOptions else {
            XCTFail(ybOptionsNilMessage)
            return
        }
        
        // Testing properties in Parse
        XCTAssertTrue(options.parseResource == ybCT.Parse.manifest)
        XCTAssertTrue(options.parseCdnNameHeader == ybCT.Parse.cdnNameHeader)
        
        // CDNNode
        XCTAssertTrue(options.parseCdnNode == ybCT.Parse.CDNNode.requestDebugHeaders)
        
        let cdnNodeList = options.parseCdnNodeList
        let templateCdnNodeList = ybCT.Parse.CDNNode.list
        XCTAssertTrue(cdnNodeList?.count == templateCdnNodeList.count)
        for cdnNode in templateCdnNodeList {
            if !(cdnNodeList?.contains(cdnNode) ?? false) {
                XCTFail()
            }
        }
        
        XCTAssertTrue(options.cdnTTL == ybCT.Parse.cdnTTL)
        XCTAssertTrue(options.cdnSwitchHeader == ybCT.Parse.cdnSwitchHeader)
    }
    
    func testNetworkOptions() throws {
        guard let options = self.ybOptions else {
            XCTFail(ybOptionsNilMessage)
            return
        }
        
        // Testing properties in Network
        XCTAssertTrue(options.networkIP == ybCT.Network.ip)
        XCTAssertTrue(options.networkIsp == ybCT.Network.isp)
        XCTAssertTrue(options.networkConnectionType == ybCT.Network.connectionType)
    }
    
    func testDeviceOptions() throws {
        guard let options = self.ybOptions else {
            XCTFail(ybOptionsNilMessage)
            return
        }
        
        // Testing properties in Device
        XCTAssertTrue(options.deviceCode == ybCT.Device.code)
        XCTAssertTrue(options.deviceModel == ybCT.Device.model)
        XCTAssertTrue(options.deviceBrand == ybCT.Device.brand)
        XCTAssertTrue(options.deviceType == ybCT.Device.type)
        XCTAssertTrue(options.deviceName == ybCT.Device.name)
        XCTAssertTrue(options.deviceOsName == ybCT.Device.osName)
        XCTAssertTrue(options.deviceOsVersion == ybCT.Device.osVersion)
        XCTAssertTrue(options.deviceIsAnonymous == ybCT.Device.isAnonymous)
        XCTAssertTrue(options.deviceUUID == ybCT.Device.id)
        let deviceEDID = options.deviceEDID as? String
        XCTAssertTrue(deviceEDID == ybCT.Device.EDID)
    }
    
    func testContentOptions() throws {
        guard let options = self.ybOptions else {
            XCTFail(ybOptionsNilMessage)
            return
        }
        
        // Testing properties in Content
        XCTAssertTrue(options.contentResource == ybCT.Content.resource)

        // isLive
        XCTAssertTrue(options.contentIsLive == NSNumber(booleanLiteral: ybCT.Content.IsLive.isLiveContent))
        XCTAssertTrue(options.contentIsLiveNoSeek == NSNumber(booleanLiteral: ybCT.Content.IsLive.noSeek))
        XCTAssertTrue(options.contentIsLiveNoMonitor == NSNumber(booleanLiteral: ybCT.Content.IsLive.noMonitor))

        XCTAssertTrue(options.contentTitle == ybCT.Content.title)
        XCTAssertTrue(options.program == ybCT.Content.program)
        XCTAssertTrue(options.contentDuration == NSNumber(value: ybCT.Content.duration))
        XCTAssertTrue(options.contentTransactionCode == ybCT.Content.transactionCode)
        XCTAssertTrue(options.contentBitrate == NSNumber(value: ybCT.Content.bitrate))
        XCTAssertTrue(options.contentThroughput == NSNumber(value: ybCT.Content.throughput))
        XCTAssertTrue(options.contentRendition == ybCT.Content.rendition)
        XCTAssertTrue(options.contentCdn == ybCT.Content.cdn)
        XCTAssertTrue(options.contentCdnNode == ybCT.Content.cdnNode)
        XCTAssertTrue(options.contentCdnType == ybCT.Content.cdnType)
        XCTAssertTrue(options.contentFps == NSNumber(value: ybCT.Content.fps))
        XCTAssertTrue(options.contentStreamingProtocol == ybCT.Content.streamingProtocol)
        XCTAssertTrue(options.contentTransportFormat == ybCT.Content.transportFormat)
        
        let templateContentMetadata = ybCT.Content.metadata
        for metadata in templateContentMetadata.keys {
            if let contentMetadata = options.contentMetadata as? [String: String] {
                XCTAssertTrue(contentMetadata[metadata] == templateContentMetadata[metadata])
            } else {
                XCTFail()
            }
        }
        
        let templateContentMetrics = ybCT.Content.metrics
        for metrics in templateContentMetrics.keys {
            if let contentMetrics = options.contentMetrics as? [String: String] {
                XCTAssertTrue(contentMetrics[metrics] == templateContentMetrics[metrics])
            } else {
                XCTFail()
            }
        }
        
        XCTAssertTrue(options.contentPackage == ybCT.Content.package)
        XCTAssertTrue(options.contentSaga == ybCT.Content.saga)
        XCTAssertTrue(options.contentTvShow == ybCT.Content.tvShow)
        XCTAssertTrue(options.contentSeason == ybCT.Content.season)
        XCTAssertTrue(options.contentEpisodeTitle == ybCT.Content.episodeTitle)
        XCTAssertTrue(options.contentChannel == ybCT.Content.channel)
        XCTAssertTrue(options.contentId == ybCT.Content.id)
        XCTAssertTrue(options.contentImdbId == ybCT.Content.imdbId)
        XCTAssertTrue(options.contentGracenoteId == ybCT.Content.gracenoteId)
        XCTAssertTrue(options.contentType == ybCT.Content.type)
        XCTAssertTrue(options.contentGenre == ybCT.Content.genre)
        XCTAssertTrue(options.contentLanguage == ybCT.Content.language)
        XCTAssertTrue(options.contentSubtitles == ybCT.Content.subtitles)
        XCTAssertTrue(options.contentContractedResolution == ybCT.Content.contractedResolution)
        XCTAssertTrue(options.contentCost == ybCT.Content.cost)
        XCTAssertTrue(options.contentPrice == ybCT.Content.price)
        XCTAssertTrue(options.contentPlaybackType == ybCT.Content.playbackType)
        XCTAssertTrue(options.contentDrm == ybCT.Content.drm)

        // Encoding
        XCTAssertTrue(options.contentEncodingVideoCodec == ybCT.Content.Encoding.videoCodec)
        XCTAssertTrue(options.contentEncodingAudioCodec == ybCT.Content.Encoding.audioCodec)
//        XCTAssertTrue(options.contentEncodingCodecSettings == ybCT.Content.Encoding.codecSettings)
        XCTAssertTrue(options.contentEncodingCodecProfile == ybCT.Content.Encoding.codecProfile)
        XCTAssertTrue(options.contentEncodingContainerFormat == ybCT.Content.Encoding.containerFormat)
        
        // CustomDimension
        XCTAssertTrue(options.contentCustomDimension1 == ybCT.Content.CustomDimension.cd1)
        XCTAssertTrue(options.contentCustomDimension2 == ybCT.Content.CustomDimension.cd2)
        XCTAssertTrue(options.contentCustomDimension3 == ybCT.Content.CustomDimension.cd3)
        XCTAssertTrue(options.contentCustomDimension4 == ybCT.Content.CustomDimension.cd4)
        XCTAssertTrue(options.contentCustomDimension5 == ybCT.Content.CustomDimension.cd5)
        XCTAssertTrue(options.contentCustomDimension6 == ybCT.Content.CustomDimension.cd6)
        XCTAssertTrue(options.contentCustomDimension7 == ybCT.Content.CustomDimension.cd7)
        XCTAssertTrue(options.contentCustomDimension8 == ybCT.Content.CustomDimension.cd8)
        XCTAssertTrue(options.contentCustomDimension9 == ybCT.Content.CustomDimension.cd9)
        XCTAssertTrue(options.contentCustomDimension10 == ybCT.Content.CustomDimension.cd10)
        XCTAssertTrue(options.contentCustomDimension11 == ybCT.Content.CustomDimension.cd11)
        XCTAssertTrue(options.contentCustomDimension12 == ybCT.Content.CustomDimension.cd12)
        XCTAssertTrue(options.contentCustomDimension13 == ybCT.Content.CustomDimension.cd13)
        XCTAssertTrue(options.contentCustomDimension14 == ybCT.Content.CustomDimension.cd14)
        XCTAssertTrue(options.contentCustomDimension15 == ybCT.Content.CustomDimension.cd15)
        XCTAssertTrue(options.contentCustomDimension16 == ybCT.Content.CustomDimension.cd16)
        XCTAssertTrue(options.contentCustomDimension17 == ybCT.Content.CustomDimension.cd17)
        XCTAssertTrue(options.contentCustomDimension18 == ybCT.Content.CustomDimension.cd18)
        XCTAssertTrue(options.contentCustomDimension19 == ybCT.Content.CustomDimension.cd19)
        XCTAssertTrue(options.contentCustomDimension20 == ybCT.Content.CustomDimension.cd20)
        
        let templateCustomDimensions = ybCT.Content.customDimensions
        for dimension in templateCustomDimensions.keys {
            if let contentCustomDimensions = options.contentCustomDimensions as? [String: String] {
                XCTAssertTrue(contentCustomDimensions[dimension] == templateCustomDimensions[dimension])
            } else {
                XCTFail()
            }
        }
        
        XCTAssertTrue(options.contentTotalBytes == NSNumber(value: ybCT.Content.totalBytes))
        XCTAssertTrue(options.sendTotalBytes == NSNumber(booleanLiteral: ybCT.Content.sendTotalBytes))
    }
    
    func testAppOptions() throws {
        guard let options = self.ybOptions else {
            XCTFail(ybOptionsNilMessage)
            return
        }
        
        // Testing properties in App
        XCTAssertTrue(options.appName == ybCT.App.name)
        XCTAssertTrue(options.appReleaseVersion == ybCT.App.releaseVersion)
    }
    
    func testSessionOptions() throws {
        guard let options = self.ybOptions else {
            XCTFail(ybOptionsNilMessage)
            return
        }
        
        // Testing properties in Session
        let templateSessionMetrics = ybCT.Session.metrics
        XCTAssertTrue(options.sessionMetrics?.count == templateSessionMetrics.count)
        for metrics in templateSessionMetrics.keys {
            if let sessionMetrics = options.sessionMetrics as? [String: Any] {
                let aSessionMetrics = sessionMetrics[metrics]
                switch aSessionMetrics {
                case is Bool:
                    XCTAssertTrue(aSessionMetrics as? Bool == templateSessionMetrics[metrics] as? Bool)
                case is Int:
                    XCTAssertTrue(aSessionMetrics as? Int == templateSessionMetrics[metrics] as? Int)
                case is Double:
                    XCTAssertTrue(aSessionMetrics as? Double == templateSessionMetrics[metrics] as? Double)
                case is String:
                    XCTAssertTrue(aSessionMetrics as? String == templateSessionMetrics[metrics] as? String)
                case is Dictionary<String, Any>:
                    let dictionaryValue = aSessionMetrics as? Dictionary<String, Any>
                    let templateDictionaryValue = templateSessionMetrics[metrics] as? Dictionary<String, Any>
                    XCTAssertTrue(dictionaryValue?.keys.count == templateDictionaryValue?.keys.count)
                default:
                    XCTFail()
                }
            } else {
                XCTFail()
            }
        }
    }
    
    func testErrorsOptions() throws {
        guard let options = self.ybOptions else {
            XCTFail(ybOptionsNilMessage)
            return
        }
        
        // Testing properties in Errors
        XCTAssertTrue(options.fatalErrors == ybCT.Errors.fatal)
        XCTAssertTrue(options.nonFatalErrors == ybCT.Errors.nonFatal)
        XCTAssertTrue(options.ignoreErrors == ybCT.Errors.ignore)
    }
}
