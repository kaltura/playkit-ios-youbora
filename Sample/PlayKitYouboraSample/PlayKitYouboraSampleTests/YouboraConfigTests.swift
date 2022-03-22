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
    typealias ybCT = YouboraConfigTemplate
    
    override func setUp() {
        
        var config = AnalyticsConfig(params: ybCT.ybConfigParams)
        
        if !JSONSerialization.isValidJSONObject(config.params) {
            XCTAssertThrowsError("Config params is not a valid JSON Object")
            return
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: config.params, options: .prettyPrinted)
            let decodedYouboraConfig = try JSONDecoder().decode(YouboraConfig.self, from: data)
            let ybConfig = decodedYouboraConfig
            self.ybOptions = ybConfig.options()

        } catch let error as NSError {
            XCTAssertThrowsError("Couldn't parse data into YouboraConfig error: \(error)")
        }
        
        // Backward Compatible Config
        config = AnalyticsConfig(params: ybCT.ybBackwardCompatibleConfigParams)
        
        if !JSONSerialization.isValidJSONObject(config.params) {
            XCTAssertThrowsError("BC Config params is not a valid JSON Object")
            return
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: config.params, options: .prettyPrinted)
            let decodedYouboraConfig = try JSONDecoder().decode(YouboraConfig.self, from: data)
            let ybBCConfig = decodedYouboraConfig
            self.ybBCOptions = ybBCConfig.options()

        } catch let error as NSError {
            XCTAssertThrowsError("Couldn't parse BC data into YouboraConfig error: \(error)")
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGeneralOptions() throws {
        guard let options = self.ybOptions else {
            XCTFail()
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
    
    func testBCGeneralOptions() throws {
        guard let options = self.ybBCOptions else {
            XCTFail()
            return
        }
        
        // Testing High level data - ybBackwardCompatibleConfigParams
        XCTAssertTrue(options.accountCode == ybCT.accountCode)
        XCTAssertTrue(options.enabled == ybCT.isEnabled)
        XCTAssertTrue(options.httpSecure == ybCT.httpSecure)
        XCTAssertNil(options.host)
        XCTAssertNil(options.authToken)
        XCTAssertNil(options.authType)
        XCTAssertTrue(options.username == ybCT.username)
        XCTAssertNil(options.offline)
        XCTAssertTrue(options.autoDetectBackground == ybCT.autoDetectBackground)
        XCTAssertTrue(options.forceInit == ybCT.isForceInit)
        XCTAssertNil(options.experimentIds)
        XCTAssertNil(options.linkedViewId)
        XCTAssertNil(options.waitForMetadata)
        XCTAssertNil(options.pendingMetadata)
    }
    
    func testUserOptions() throws {
        guard let options = self.ybOptions else {
            XCTFail()
            return
        }
        
        // Testing properties in User
        XCTAssertTrue(options.anonymousUser == ybCT.User.anonymousId)
        XCTAssertTrue(options.userType == ybCT.User.type)
        XCTAssertTrue(options.userEmail == ybCT.User.email)
        XCTAssertTrue(options.userObfuscateIp == NSNumber(booleanLiteral: ybCT.User.obfuscateIp))
    }
    
    func testBCUserOptions() throws {
        guard let options = self.ybBCOptions else {
            XCTFail()
            return
        }
        
        // Testing properties in User - ybBackwardCompatibleConfigParams
        XCTAssertTrue(options.anonymousUser == ybCT.userAnonymousId)
        XCTAssertTrue(options.userType == ybCT.userType)
        XCTAssertTrue(options.userEmail == ybCT.userEmail)
        XCTAssertTrue(options.userObfuscateIp == NSNumber(booleanLiteral: ybCT.userObfuscateIp))
    }
    
    func testAdOptions() throws {
        guard let options = self.ybOptions else {
            XCTFail()
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
    
    func testBCAdOptions() throws {
        guard let options = self.ybBCOptions else {
            XCTFail()
            return
        }
        
        // Testing properties in Ad - ybBackwardCompatibleConfigParams
        XCTAssertNil(options.adBlockerDetected)
        XCTAssertNil(options.adMetadata)
        XCTAssertNil(options.adsAfterStop)
        XCTAssertTrue(options.adCampaign == ybCT.Ads.adCampaign)
        XCTAssertTrue(options.adTitle == ybCT.Ads.adTitle)
        XCTAssertTrue(options.adResource == ybCT.Ads.adResource)
        XCTAssertTrue(options.adGivenBreaks == NSNumber(value: ybCT.Ads.adGivenBreaks))
        XCTAssertTrue(options.adExpectedBreaks == NSNumber(value: ybCT.Ads.adExpectedBreaks))
        
        // ExpectedPattern
        XCTAssertNil(options.adExpectedPattern?[YBOptionKeys.adPositionPre])
        XCTAssertNil(options.adExpectedPattern?[YBOptionKeys.adPositionMid])
        XCTAssertNil(options.adExpectedPattern?[YBOptionKeys.adPositionPost])
        
        let adBreaksTime = options.adBreaksTime as? [Int]
        let templateAdBreaksTime = ybCT.Ads.adBreaksTime
        XCTAssertTrue(adBreaksTime?.count == templateAdBreaksTime.count)
        for adBreakTime in templateAdBreaksTime {
            if !(adBreaksTime?.contains(adBreakTime) ?? false) {
                XCTFail()
            }
        }
        
        XCTAssertTrue(options.adGivenAds == NSNumber(value: ybCT.Ads.adGivenAds))
        XCTAssertTrue(options.adCreativeId == ybCT.Ads.adCreativeId)
        XCTAssertTrue(options.adProvider == ybCT.Ads.adProvider)
        
        // CustomDimension
        XCTAssertTrue(options.adCustomDimension1 == ybCT.Ads.adCustomDimension1)
        XCTAssertTrue(options.adCustomDimension2 == ybCT.Ads.adCustomDimension2)
        XCTAssertTrue(options.adCustomDimension3 == ybCT.Ads.adCustomDimension3)
        XCTAssertTrue(options.adCustomDimension4 == ybCT.Ads.adCustomDimension4)
        XCTAssertTrue(options.adCustomDimension5 == ybCT.Ads.adCustomDimension5)
        XCTAssertTrue(options.adCustomDimension6 == ybCT.Ads.adCustomDimension6)
        XCTAssertTrue(options.adCustomDimension7 == ybCT.Ads.adCustomDimension7)
        XCTAssertTrue(options.adCustomDimension8 == ybCT.Ads.adCustomDimension8)
        XCTAssertTrue(options.adCustomDimension9 == ybCT.Ads.adCustomDimension9)
        XCTAssertTrue(options.adCustomDimension10 == ybCT.Ads.adCustomDimension10)
    }
    
    func testSmartSwitchOptions() {
        guard let options = self.ybOptions else {
            XCTFail()
            return
        }
        
        // Testing properties in SmartSwitch
        XCTAssertTrue(options.smartswitchConfigCode == ybCT.Smartswitch.configCode)
        XCTAssertTrue(options.smartswitchGroupCode == ybCT.Smartswitch.groupCode)
        XCTAssertTrue(options.smartswitchContractCode == ybCT.Smartswitch.contractCode)
    }
    
    func testParseOptions() throws {
        guard let options = self.ybBCOptions else {
            XCTFail()
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
    
    func testBCParseOptions() throws {
        guard let options = self.ybBCOptions else {
            XCTFail()
            return
        }
        
        // Testing properties in Parse - ybBackwardCompatibleConfigParams
        XCTAssertTrue(options.parseResource == ybCT.Parse.parseManifest)
        XCTAssertTrue(options.parseCdnNameHeader == ybCT.Parse.parseCdnNameHeader)
        
        // CDNNode
        XCTAssertTrue(options.parseCdnNode == ybCT.Parse.parseCdnNode)
        
        let cdnNodeList = options.parseCdnNodeList
        let templateCdnNodeList = ybCT.Parse.parseCdnNodeList
        XCTAssertTrue(cdnNodeList?.count == templateCdnNodeList.count)
        for cdnNode in templateCdnNodeList {
            if !(cdnNodeList?.contains(cdnNode) ?? false) {
                XCTFail()
            }
        }
        
        XCTAssertTrue(options.cdnTTL == Double(ybCT.Parse.parseCdnTTL))
        XCTAssertTrue(options.cdnSwitchHeader == ybCT.Parse.parseCdnSwitchHeader)
    }
    
    func testNetworkOptions() throws {
        guard let options = self.ybOptions else {
            XCTFail()
            return
        }
        
        // Testing properties in Network
        XCTAssertTrue(options.networkIP == ybCT.Network.ip)
        XCTAssertTrue(options.networkIsp == ybCT.Network.isp)
        XCTAssertTrue(options.networkConnectionType == ybCT.Network.connectionType)
    }
    
    func testBCNetworkOptions() throws {
        guard let options = self.ybBCOptions else {
            XCTFail()
            return
        }
        
        // Testing properties in Network - ybBackwardCompatibleConfigParams
        XCTAssertTrue(options.networkIP == ybCT.Network.networkIP)
        XCTAssertTrue(options.networkIsp == ybCT.Network.networkIsp)
        XCTAssertTrue(options.networkConnectionType == ybCT.Network.networkConnectionType)
    }
    
    func testDeviceOptions() throws {
        guard let options = self.ybOptions else {
            XCTFail()
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
    
    func testBCDeviceOptions() throws {
        guard let options = self.ybBCOptions else {
            XCTFail()
            return
        }
        
        // Testing properties in Device - ybBackwardCompatibleConfigParams
        XCTAssertTrue(options.deviceCode == ybCT.Device.deviceCode)
        XCTAssertTrue(options.deviceModel == ybCT.Device.deviceModel)
        XCTAssertTrue(options.deviceBrand == ybCT.Device.deviceBrand)
        XCTAssertTrue(options.deviceType == ybCT.Device.deviceType)
        XCTAssertNil(options.deviceName)
        XCTAssertTrue(options.deviceOsName == ybCT.Device.deviceOsName)
        XCTAssertTrue(options.deviceOsVersion == ybCT.Device.deviceOsVersion)
        XCTAssertTrue(options.deviceIsAnonymous == ybCT.Device.deviceIsAnonymous)
        XCTAssertTrue(options.deviceUUID == ybCT.Device.deviceId)
        XCTAssertNil(options.deviceEDID)
    }
    
    
    
    
    
    
    
    
//    func testAppOptions() throws {
//        guard let options = self.ybOptions else {
//            XCTFail()
//            return
//        }
//
//        // Testing options related to App
//        XCTAssertNotNil(options.appName)
//        XCTAssertNotNil(options.appReleaseVersion)
//
//        XCTAssertTrue(options.appName == ybCT.appName)
//        XCTAssertTrue(options.appReleaseVersion == ybCT.appReleaseVersion)
//    }
//
//
//
//
//
//
//
//    func testCustomDimensions() throws {
//        guard let config = self.ybConfig else {
//            XCTExpectFailure("YouboraConfig is missing")
//            return
//        }
//        let options: YBOptions = config.options()
//
//        // Testing Custom Dimensions aka Extra parameters
//        XCTAssertNotNil(options.contentCustomDimension1)
//        XCTAssertNotNil(options.contentCustomDimension2)
//        XCTAssertNotNil(options.contentCustomDimension3)
//        XCTAssertNotNil(options.contentCustomDimension4)
//        XCTAssertNotNil(options.contentCustomDimension5)
//        XCTAssertNotNil(options.contentCustomDimension6)
//        XCTAssertNotNil(options.contentCustomDimension7)
//        XCTAssertNotNil(options.contentCustomDimension8)
//        XCTAssertNotNil(options.contentCustomDimension9)
//        XCTAssertNotNil(options.contentCustomDimension10)
//        XCTAssertNotNil(options.contentCustomDimension11)
//        XCTAssertNotNil(options.contentCustomDimension12)
//        XCTAssertNotNil(options.contentCustomDimension13)
//        XCTAssertNotNil(options.contentCustomDimension14)
//        XCTAssertNotNil(options.contentCustomDimension15)
//        XCTAssertNotNil(options.contentCustomDimension16)
//        XCTAssertNotNil(options.contentCustomDimension17)
//        XCTAssertNotNil(options.contentCustomDimension18)
//        XCTAssertNotNil(options.contentCustomDimension19)
//        XCTAssertNotNil(options.contentCustomDimension20)
//
//        // extraParams
//        XCTAssertTrue(options.contentCustomDimension1 == ybCT.extraParam1)
//        XCTAssertTrue(options.contentCustomDimension2 == ybCT.extraParam2)
//        XCTAssertTrue(options.contentCustomDimension3 == ybCT.extraParam3)
//        XCTAssertTrue(options.contentCustomDimension4 == ybCT.extraParam4)
//        XCTAssertTrue(options.contentCustomDimension5 == ybCT.extraParam5)
//        XCTAssertTrue(options.contentCustomDimension6 == ybCT.extraParam6)
//        XCTAssertTrue(options.contentCustomDimension7 == ybCT.extraParam7)
//        XCTAssertTrue(options.contentCustomDimension8 == ybCT.extraParam8)
//        XCTAssertTrue(options.contentCustomDimension9 == ybCT.extraParam9)
//        XCTAssertTrue(options.contentCustomDimension10 == ybCT.extraParam10)
//        XCTAssertTrue(options.contentCustomDimension11 == ybCT.extraParam11)
//        XCTAssertTrue(options.contentCustomDimension12 == ybCT.extraParam12)
//        XCTAssertTrue(options.contentCustomDimension13 == ybCT.extraParam13)
//        XCTAssertTrue(options.contentCustomDimension14 == ybCT.extraParam14)
//        XCTAssertTrue(options.contentCustomDimension15 == ybCT.extraParam15)
//        XCTAssertTrue(options.contentCustomDimension16 == ybCT.extraParam16)
//        XCTAssertTrue(options.contentCustomDimension17 == ybCT.extraParam17)
//        XCTAssertTrue(options.contentCustomDimension18 == ybCT.extraParam18)
//        XCTAssertTrue(options.contentCustomDimension19 == ybCT.extraParam19)
//        XCTAssertTrue(options.contentCustomDimension20 == ybCT.extraParam20)
//    }
//
//    func testContentOptions() throws {
//        guard let config = self.ybConfig else {
//            XCTExpectFailure("YouboraConfig is missing")
//            return
//        }
//        let options: YBOptions = config.options()
//
//        // Testing Content options
//        XCTAssertNotNil(options.program)
//        XCTAssertNotNil(options.contentResource)
//        XCTAssertNotNil(options.contentIsLive)
//        XCTAssertNotNil(options.contentTitle)
//        XCTAssertNotNil(options.contentDuration)
//        XCTAssertNotNil(options.contentTransactionCode)
//        XCTAssertNotNil(options.contentBitrate)
//        XCTAssertNotNil(options.sendTotalBytes)
//        XCTAssertNotNil(options.contentStreamingProtocol)
//        XCTAssertNotNil(options.contentTransportFormat)
//        XCTAssertNotNil(options.contentThroughput)
//        XCTAssertNotNil(options.contentRendition)
//        XCTAssertNotNil(options.contentCdn)
//        XCTAssertNotNil(options.contentFps)
//        XCTAssertNotNil(options.contentIsLiveNoSeek)
//        XCTAssertNotNil(options.contentPackage)
//        XCTAssertNotNil(options.contentSaga)
//        XCTAssertNotNil(options.contentTvShow)
//        XCTAssertNotNil(options.contentSeason)
//        XCTAssertNotNil(options.contentEpisodeTitle)
//        XCTAssertNotNil(options.contentChannel)
//        XCTAssertNotNil(options.contentId)
//        XCTAssertNotNil(options.contentImdbId)
//        XCTAssertNotNil(options.contentGracenoteId)
//        XCTAssertNotNil(options.contentType)
//        XCTAssertNotNil(options.contentGenre)
//        XCTAssertNotNil(options.contentLanguage)
//        XCTAssertNotNil(options.contentSubtitles)
//        XCTAssertNotNil(options.contentContractedResolution)
//        XCTAssertNotNil(options.contentCost)
//        XCTAssertNotNil(options.contentPrice)
//        XCTAssertNotNil(options.contentPlaybackType)
//        XCTAssertNotNil(options.contentDrm)
//        XCTAssertNotNil(options.contentEncodingVideoCodec)
//        XCTAssertNotNil(options.contentEncodingAudioCodec)
//        XCTAssertNotNil(options.contentEncodingCodecProfile)
//        XCTAssertNotNil(options.contentEncodingContainerFormat)
//
//        //
//        XCTAssertTrue(options.program == ybCT.contentProgram)
//        XCTAssertTrue(options.contentResource == ybCT.contentResource)
//        XCTAssertTrue(options.contentIsLive as? Bool == ybCT.contentIsLive)
//        XCTAssertTrue(options.contentTitle == ybCT.contentTitle)
//        XCTAssertTrue(options.contentDuration as? Double == ybCT.contentDuration)
//        XCTAssertTrue(options.contentTransactionCode == ybCT.contentTransactionCode)
//        XCTAssertTrue(options.contentBitrate as? Double == ybCT.contentBitrate)
//        XCTAssertTrue(options.sendTotalBytes as? Bool == ybCT.contentSendTotalBytes)
//        XCTAssertTrue(options.contentStreamingProtocol == ybCT.contentStreamingProtocol)
//        XCTAssertTrue(options.contentTransportFormat == ybCT.contentTransportFormat)
//        XCTAssertTrue(options.contentThroughput as? Int == ybCT.contentThroughput)
//        XCTAssertTrue(options.contentRendition == ybCT.contentRendition)
//        XCTAssertTrue(options.contentCdn == ybCT.contentCdn)
//        XCTAssertTrue(options.contentFps as? Double == ybCT.contentFps)
//        XCTAssertTrue(options.contentIsLiveNoSeek as? Bool != ybCT.isDVR)
//        XCTAssertTrue(options.contentPackage == ybCT.contentPackage)
//        XCTAssertTrue(options.contentSaga == ybCT.contentSaga)
//        XCTAssertTrue(options.contentTvShow == ybCT.contentTvShow)
//        XCTAssertTrue(options.contentSeason == ybCT.contentSeason)
//        XCTAssertTrue(options.contentEpisodeTitle == ybCT.contentEpisodeTitle)
//        XCTAssertTrue(options.contentChannel == ybCT.contentChannel)
//        XCTAssertTrue(options.contentId == ybCT.contentId)
//        XCTAssertTrue(options.contentImdbId == ybCT.contentImdbId)
//        XCTAssertTrue(options.contentGracenoteId == ybCT.contentGracenoteId)
//        XCTAssertTrue(options.contentType == ybCT.contentType)
//        XCTAssertTrue(options.contentGenre == ybCT.contentGenre)
//        XCTAssertTrue(options.contentLanguage == ybCT.contentLanguage)
//        XCTAssertTrue(options.contentSubtitles == ybCT.contentSubtitles)
//        XCTAssertTrue(options.contentContractedResolution == ybCT.contentContractedResolution)
//        XCTAssertTrue(options.contentCost == ybCT.contentCost)
//        XCTAssertTrue(options.contentPrice == ybCT.contentPrice)
//        XCTAssertTrue(options.contentPlaybackType == ybCT.contentPlaybackType)
//        XCTAssertTrue(options.contentDrm == ybCT.contentDrm)
//        XCTAssertTrue(options.contentEncodingVideoCodec == ybCT.contentEncodingVideoCodec)
//        XCTAssertTrue(options.contentEncodingAudioCodec == ybCT.contentEncodingAudioCodec)
//        XCTAssertTrue(options.contentEncodingCodecProfile == ybCT.contentEncodingCodecProfile)
//        XCTAssertTrue(options.contentEncodingContainerFormat == ybCT.contentEncodingContainerFormat)
//    }
//
//
//
//    func testErrorsOptions() throws {
//        guard let config = self.ybConfig else {
//            XCTExpectFailure("YouboraConfig is missing")
//            return
//        }
//        let options: YBOptions = config.options()
//
//        // Testing Errors
//        XCTAssertNotNil(options.ignoreErrors)
//        XCTAssertNotNil(options.fatalErrors)
//        XCTAssertNotNil(options.nonFatalErrors)
//
//        XCTAssertTrue(options.ignoreErrors?.first == ybCT.errorsIgnore.first)
//        XCTAssertTrue(options.ignoreErrors?.last == ybCT.errorsIgnore.last)
//        XCTAssertTrue(options.fatalErrors?.first == ybCT.errorsFatal.first)
//        XCTAssertTrue(options.fatalErrors?.last == ybCT.errorsFatal.last)
//        XCTAssertTrue(options.nonFatalErrors?.first == ybCT.errorsNonFatal.first)
//        XCTAssertTrue(options.nonFatalErrors?.last == ybCT.errorsNonFatal.last)
//    }
//
//
//
//
//
//    func testContentMetadataOptions() throws {
//        guard let config = self.ybConfig else {
//            XCTExpectFailure("YouboraConfig is missing")
//            return
//        }
//        let options: YBOptions = config.options()
//
//        // Testing Content
//        XCTAssertNotNil(options.contentMetadata)
//
//        XCTAssertNotNil(options.contentMetadata?["genre"])
//        XCTAssertNotNil(options.contentMetadata?["type"])
//        XCTAssertNotNil(options.contentMetadata?["transaction_type"])
//        XCTAssertNotNil(options.contentMetadata?["year"])
//        XCTAssertNotNil(options.contentMetadata?["cast"])
//        XCTAssertNotNil(options.contentMetadata?["director"])
//        XCTAssertNotNil(options.contentMetadata?["owner"])
//        XCTAssertNotNil(options.contentMetadata?["parental"])
//        XCTAssertNotNil(options.contentMetadata?["price"])
//        XCTAssertNotNil(options.contentMetadata?["rating"])
//        XCTAssertNotNil(options.contentMetadata?["audioType"])
//        XCTAssertNotNil(options.contentMetadata?["audioChannels"])
//        XCTAssertNotNil(options.contentMetadata?["device"])
//        XCTAssertNotNil(options.contentMetadata?["quality"])
//    }
    
}
