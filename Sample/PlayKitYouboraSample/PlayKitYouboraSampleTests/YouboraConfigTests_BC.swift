//
//  YouboraConfigTests_BC.swift
//  PlayKitYouboraSampleTests
//
//  Created by Nilit Danan on 25/03/2022.
//

import XCTest
import YouboraLib

// MARK: - Test Backward Compatible config

extension YouboraConfigTests {
    
    func testBCGeneralOptions() throws {
        guard let options = self.ybBCOptions else {
            XCTFail(ybOptionsNilMessage)
            return
        }
        
        // Testing High level data - ybBackwardCompatibleConfigParams
        XCTAssertTrue(options.accountCode == ybCT.BCValues.accountCode)
        XCTAssertTrue(options.enabled == ybCT.BCValues.isEnabled)
        XCTAssertTrue(options.httpSecure == ybCT.BCValues.httpSecure)
        XCTAssertNil(options.host)
        XCTAssertNil(options.authToken)
        XCTAssertNil(options.authType)
        XCTAssertTrue(options.username == ybCT.BCValues.username)
        XCTAssertTrue(options.offline == false) // Youbora Default value.
        XCTAssertTrue(options.autoDetectBackground == ybCT.BCValues.autoDetectBackground)
        XCTAssertTrue(options.forceInit == ybCT.BCValues.isForceInit)
        XCTAssertTrue(options.experimentIds?.count == 0) // Youbora Default creates an empty Array.
        XCTAssertNil(options.linkedViewId)
        XCTAssertTrue(options.waitForMetadata == false) // Youbora Default value.
        XCTAssertNil(options.pendingMetadata)
    }
    
    func testBCUserOptions() throws {
        guard let options = self.ybBCOptions else {
            XCTFail(ybOptionsNilMessage)
            return
        }
        
        // Testing properties in User - ybBackwardCompatibleConfigParams
        XCTAssertTrue(options.anonymousUser == ybCT.BCValues.userAnonymousId)
        XCTAssertTrue(options.userType == ybCT.BCValues.userType)
        XCTAssertTrue(options.userEmail == ybCT.BCValues.userEmail)
        XCTAssertTrue(options.userObfuscateIp == NSNumber(booleanLiteral: ybCT.BCValues.userObfuscateIp))
    }
 
    func testBCAdOptions() throws {
        guard let options = self.ybBCOptions else {
            XCTFail(ybOptionsNilMessage)
            return
        }
        
        // Testing properties in Ad - ybBackwardCompatibleConfigParams
        XCTAssertNil(options.adBlockerDetected)
        XCTAssertTrue(options.adMetadata?.count == 0) // Youbora Default creates an empty Array.
        XCTAssertTrue(options.adsAfterStop == 0) // Youbora Default value.
        XCTAssertTrue(options.adCampaign == ybCT.BCValues.Ads.adCampaign)
        XCTAssertTrue(options.adTitle == ybCT.BCValues.Ads.adTitle)
        XCTAssertTrue(options.adResource == ybCT.BCValues.Ads.adResource)
        XCTAssertTrue(options.adGivenBreaks == NSNumber(value: ybCT.BCValues.Ads.adGivenBreaks))
        XCTAssertTrue(options.adExpectedBreaks == NSNumber(value: ybCT.BCValues.Ads.adExpectedBreaks))
        
        // ExpectedPattern
        XCTAssertNil(options.adExpectedPattern?[YBOptionKeys.adPositionPre])
        XCTAssertNil(options.adExpectedPattern?[YBOptionKeys.adPositionMid])
        XCTAssertNil(options.adExpectedPattern?[YBOptionKeys.adPositionPost])
        
        let adBreaksTime = options.adBreaksTime as? [Int]
        let templateAdBreaksTime = ybCT.BCValues.Ads.adBreaksTime
        XCTAssertTrue(adBreaksTime?.count == templateAdBreaksTime.count)
        for adBreakTime in templateAdBreaksTime {
            if !(adBreaksTime?.contains(adBreakTime) ?? false) {
                XCTFail()
            }
        }
        
        XCTAssertTrue(options.adGivenAds == NSNumber(value: ybCT.BCValues.Ads.adGivenAds))
        XCTAssertTrue(options.adCreativeId == ybCT.BCValues.Ads.adCreativeId)
        XCTAssertTrue(options.adProvider == ybCT.BCValues.Ads.adProvider)
        
        // CustomDimension
        XCTAssertTrue(options.adCustomDimension1 == ybCT.BCValues.Ads.adCustomDimension1)
        XCTAssertTrue(options.adCustomDimension2 == ybCT.BCValues.Ads.adCustomDimension2)
        XCTAssertTrue(options.adCustomDimension3 == ybCT.BCValues.Ads.adCustomDimension3)
        XCTAssertTrue(options.adCustomDimension4 == ybCT.BCValues.Ads.adCustomDimension4)
        XCTAssertTrue(options.adCustomDimension5 == ybCT.BCValues.Ads.adCustomDimension5)
        XCTAssertTrue(options.adCustomDimension6 == ybCT.BCValues.Ads.adCustomDimension6)
        XCTAssertTrue(options.adCustomDimension7 == ybCT.BCValues.Ads.adCustomDimension7)
        XCTAssertTrue(options.adCustomDimension8 == ybCT.BCValues.Ads.adCustomDimension8)
        XCTAssertTrue(options.adCustomDimension9 == ybCT.BCValues.Ads.adCustomDimension9)
        XCTAssertTrue(options.adCustomDimension10 == ybCT.BCValues.Ads.adCustomDimension10)
    }
    
    func testBCParseOptions() throws {
        guard let options = self.ybBCOptions else {
            XCTFail(ybOptionsNilMessage)
            return
        }
        
        // Testing properties in Parse - ybBackwardCompatibleConfigParams
        XCTAssertTrue(options.parseResource == ybCT.BCValues.Parse.parseManifest)
        XCTAssertTrue(options.parseCdnNameHeader == ybCT.BCValues.Parse.parseCdnNameHeader)
        
        // CDNNode
        XCTAssertTrue(options.parseCdnNode == ybCT.BCValues.Parse.parseCdnNode)
        
        let cdnNodeList = options.parseCdnNodeList
        let templateCdnNodeList = ybCT.BCValues.Parse.parseCdnNodeList
        XCTAssertTrue(cdnNodeList?.count == templateCdnNodeList.count)
        for cdnNode in templateCdnNodeList {
            if !(cdnNodeList?.contains(cdnNode) ?? false) {
                XCTFail()
            }
        }
        
        XCTAssertTrue(options.cdnTTL == Double(ybCT.BCValues.Parse.parseCdnTTL))
        XCTAssertTrue(options.cdnSwitchHeader == ybCT.BCValues.Parse.parseCdnSwitchHeader)
    }
    
    func testBCNetworkOptions() throws {
        guard let options = self.ybBCOptions else {
            XCTFail(ybOptionsNilMessage)
            return
        }
        
        // Testing properties in Network - ybBackwardCompatibleConfigParams
        XCTAssertTrue(options.networkIP == ybCT.BCValues.Network.networkIP)
        XCTAssertTrue(options.networkIsp == ybCT.BCValues.Network.networkIsp)
        XCTAssertTrue(options.networkConnectionType == ybCT.BCValues.Network.networkConnectionType)
    }
    
    func testBCDeviceOptions() throws {
        guard let options = self.ybBCOptions else {
            XCTFail(ybOptionsNilMessage)
            return
        }
        
        // Testing properties in Device - ybBackwardCompatibleConfigParams
        XCTAssertTrue(options.deviceCode == ybCT.BCValues.Device.deviceCode)
        XCTAssertTrue(options.deviceModel == ybCT.BCValues.Device.deviceModel)
        XCTAssertTrue(options.deviceBrand == ybCT.BCValues.Device.deviceBrand)
        XCTAssertTrue(options.deviceType == ybCT.BCValues.Device.deviceType)
        XCTAssertNil(options.deviceName)
        XCTAssertTrue(options.deviceOsName == ybCT.BCValues.Device.deviceOsName)
        XCTAssertTrue(options.deviceOsVersion == ybCT.BCValues.Device.deviceOsVersion)
        XCTAssertTrue(options.deviceIsAnonymous == ybCT.BCValues.Device.deviceIsAnonymous)
        XCTAssertTrue(options.deviceUUID == ybCT.BCValues.Device.deviceId)
        XCTAssertNil(options.deviceEDID)
    }
    
    func testBCContentOptions() throws {
        guard let options = self.ybBCOptions else {
            XCTFail(ybOptionsNilMessage)
            return
        }
        
        // Testing properties in Content - ybBackwardCompatibleConfigParams
        XCTAssertTrue(options.contentResource == ybCT.BCValues.Content.contentResource)

        // isLive
        XCTAssertTrue(options.contentIsLive == NSNumber(booleanLiteral: ybCT.BCValues.Content.contentIsLive))
        XCTAssertTrue(options.contentIsLiveNoSeek == NSNumber(booleanLiteral: ybCT.BCValues.Content.contentIsLiveNoSeek))
        XCTAssertNil(options.contentIsLiveNoMonitor)

        XCTAssertTrue(options.contentTitle == ybCT.BCValues.Content.contentTitle)
        XCTAssertTrue(options.program == ybCT.BCValues.Content.contentProgram)
        XCTAssertTrue(options.contentDuration == NSNumber(value: ybCT.BCValues.Content.contentDuration))
        XCTAssertTrue(options.contentTransactionCode == ybCT.BCValues.Content.contentTransactionCode)
        XCTAssertTrue(options.contentBitrate == NSNumber(value: ybCT.BCValues.Content.contentBitrate))
        XCTAssertTrue(options.contentThroughput == NSNumber(value: ybCT.BCValues.Content.contentThroughput))
        XCTAssertTrue(options.contentRendition == ybCT.BCValues.Content.contentRendition)
        XCTAssertTrue(options.contentCdn == ybCT.BCValues.Content.contentCdn)
        XCTAssertNil(options.contentCdnNode)
        XCTAssertNil(options.contentCdnType)
        XCTAssertTrue(options.contentFps == NSNumber(value: ybCT.BCValues.Content.contentFps))
        XCTAssertTrue(options.contentStreamingProtocol == ybCT.BCValues.Content.contentStreamingProtocol)
        XCTAssertTrue(options.contentTransportFormat == ybCT.BCValues.Content.contentTransportFormat)
        
        // Some values from the Properties should be inside
        if let contentMetadata = options.contentMetadata as? [String: String] {
            XCTAssertNil(contentMetadata["transaction_type"])
            XCTAssertTrue(contentMetadata["year"] == ybCT.BCValues.Properties.year)
            XCTAssertTrue(contentMetadata["cast"] == ybCT.BCValues.Properties.cast)
            XCTAssertTrue(contentMetadata["director"] == ybCT.BCValues.Properties.director)
            XCTAssertTrue(contentMetadata["owner"] == ybCT.BCValues.Properties.owner)
            XCTAssertTrue(contentMetadata["parental"] == ybCT.BCValues.Properties.parental)
            XCTAssertTrue(contentMetadata["rating"] == ybCT.BCValues.Properties.rating)
            XCTAssertNil(contentMetadata["audioType"])
            XCTAssertTrue(contentMetadata["audioChannels"] == ybCT.BCValues.Properties.audioChannels)
            XCTAssertTrue(contentMetadata["device"] == ybCT.BCValues.Properties.device)
            XCTAssertNil(contentMetadata["quality"])
        } else {
            XCTFail()
        }
        
        XCTAssertNil(options.contentMetrics)
        
        XCTAssertTrue(options.contentPackage == ybCT.BCValues.Content.contentPackage)
        XCTAssertTrue(options.contentSaga == ybCT.BCValues.Content.contentSaga)
        XCTAssertTrue(options.contentTvShow == ybCT.BCValues.Content.contentTvShow)
        XCTAssertTrue(options.contentSeason == ybCT.BCValues.Content.contentSeason)
        XCTAssertTrue(options.contentEpisodeTitle == ybCT.BCValues.Content.contentEpisodeTitle)
        XCTAssertTrue(options.contentChannel == ybCT.BCValues.Content.contentChannel)
        XCTAssertTrue(options.contentId == ybCT.BCValues.Content.contentId)
        XCTAssertTrue(options.contentImdbId == ybCT.BCValues.Content.contentImdbId)
        XCTAssertTrue(options.contentGracenoteId == ybCT.BCValues.Content.contentGracenoteId)
        XCTAssertTrue(options.contentType == ybCT.BCValues.Content.contentType)
        XCTAssertTrue(options.contentGenre == ybCT.BCValues.Content.contentGenre)
        XCTAssertTrue(options.contentLanguage == ybCT.BCValues.Content.contentLanguage)
        XCTAssertTrue(options.contentSubtitles == ybCT.BCValues.Content.contentSubtitles)
        XCTAssertTrue(options.contentContractedResolution == ybCT.BCValues.Content.contentContractedResolution)
        XCTAssertTrue(options.contentCost == ybCT.BCValues.Content.contentCost)
        XCTAssertTrue(options.contentPrice == ybCT.BCValues.Content.contentPrice)
        XCTAssertTrue(options.contentPlaybackType == ybCT.BCValues.Content.contentPlaybackType)
        XCTAssertTrue(options.contentDrm == ybCT.BCValues.Content.contentDrm)

        // Encoding
        XCTAssertTrue(options.contentEncodingVideoCodec == ybCT.BCValues.Content.contentEncodingVideoCodec)
        XCTAssertTrue(options.contentEncodingAudioCodec == ybCT.BCValues.Content.contentEncodingAudioCodec)
//        XCTAssertTrue(options.contentEncodingCodecSettings == ybCT.BCValues.Content.Encoding.codecSettings)
        XCTAssertTrue(options.contentEncodingCodecProfile == ybCT.BCValues.Content.contentEncodingCodecProfile)
        XCTAssertTrue(options.contentEncodingContainerFormat == ybCT.BCValues.Content.contentEncodingContainerFormat)
        
        // CustomDimension
        XCTAssertTrue(options.contentCustomDimension1 == ybCT.BCValues.ContentCustomDimension.contentCustomDimension1)
        XCTAssertTrue(options.contentCustomDimension2 == ybCT.BCValues.ContentCustomDimension.contentCustomDimension2)
        XCTAssertTrue(options.contentCustomDimension3 == ybCT.BCValues.ContentCustomDimension.contentCustomDimension3)
        XCTAssertTrue(options.contentCustomDimension4 == ybCT.BCValues.ContentCustomDimension.contentCustomDimension4)
        XCTAssertTrue(options.contentCustomDimension5 == ybCT.BCValues.ContentCustomDimension.contentCustomDimension5)
        XCTAssertTrue(options.contentCustomDimension6 == ybCT.BCValues.ContentCustomDimension.contentCustomDimension6)
        XCTAssertTrue(options.contentCustomDimension7 == ybCT.BCValues.ContentCustomDimension.contentCustomDimension7)
        XCTAssertTrue(options.contentCustomDimension8 == ybCT.BCValues.ContentCustomDimension.contentCustomDimension8)
        XCTAssertTrue(options.contentCustomDimension9 == ybCT.BCValues.ContentCustomDimension.contentCustomDimension9)
        XCTAssertTrue(options.contentCustomDimension10 == ybCT.BCValues.ContentCustomDimension.contentCustomDimension10)
        XCTAssertNil(options.contentCustomDimension11)
        XCTAssertNil(options.contentCustomDimension12)
        XCTAssertNil(options.contentCustomDimension13)
        XCTAssertNil(options.contentCustomDimension14)
        XCTAssertNil(options.contentCustomDimension15)
        XCTAssertNil(options.contentCustomDimension16)
        XCTAssertNil(options.contentCustomDimension17)
        XCTAssertNil(options.contentCustomDimension18)
        XCTAssertNil(options.contentCustomDimension19)
        XCTAssertNil(options.contentCustomDimension20)
        
        // The ExtraParams should be inside
        if let contentCustomDimensions = options.contentCustomDimensions as? [String: String] {
            XCTAssertTrue(contentCustomDimensions["param1"] == ybCT.BCValues.ExtraParams.param1)
            XCTAssertTrue(contentCustomDimensions["param2"] == ybCT.BCValues.ExtraParams.param2)
            XCTAssertTrue(contentCustomDimensions["param3"] == ybCT.BCValues.ExtraParams.param3)
            XCTAssertTrue(contentCustomDimensions["param4"] == ybCT.BCValues.ExtraParams.param4)
            XCTAssertTrue(contentCustomDimensions["param5"] == ybCT.BCValues.ExtraParams.param5)
            XCTAssertTrue(contentCustomDimensions["param6"] == ybCT.BCValues.ExtraParams.param6)
            XCTAssertTrue(contentCustomDimensions["param7"] == ybCT.BCValues.ExtraParams.param7)
            XCTAssertTrue(contentCustomDimensions["param8"] == ybCT.BCValues.ExtraParams.param8)
            XCTAssertTrue(contentCustomDimensions["param9"] == ybCT.BCValues.ExtraParams.param9)
            XCTAssertTrue(contentCustomDimensions["param10"] == ybCT.BCValues.ExtraParams.param10)
        } else {
            XCTFail()
        }
        
        XCTAssertNil(options.contentTotalBytes)
        XCTAssertTrue(options.sendTotalBytes == NSNumber(booleanLiteral: ybCT.BCValues.Content.contentSendTotalBytes))
    }
    
    func testBCAppOptions() throws {
        guard let options = self.ybBCOptions else {
            XCTFail(ybOptionsNilMessage)
            return
        }
        
        // Testing properties in App - ybBackwardCompatibleConfigParams
        XCTAssertTrue(options.appName == ybCT.BCValues.App.appName)
        XCTAssertTrue(options.appReleaseVersion == ybCT.BCValues.App.appReleaseVersion)
    }
    
    func testBCErrorsOptions() throws {
        guard let options = self.ybBCOptions else {
            XCTFail(ybOptionsNilMessage)
            return
        }
        
        // Testing properties in Errors - ybBackwardCompatibleConfigParams
        XCTAssertTrue(options.fatalErrors == ybCT.BCValues.Errors.errorsFatal)
        XCTAssertTrue(options.nonFatalErrors == ybCT.BCValues.Errors.errorsNonFatal)
        XCTAssertTrue(options.ignoreErrors == ybCT.BCValues.Errors.errorsIgnore)
    }
}
