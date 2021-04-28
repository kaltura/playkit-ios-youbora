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
    
    var ybConfig: YouboraConfig?
    
    typealias ybc = YouboraConfigTemplate
    
    override func setUp() {
            
        let config = AnalyticsConfig(params: ybc.ybConfigParams)
        
        if !JSONSerialization.isValidJSONObject(config.params) {
            XCTAssertThrowsError("Config params is not a valid JSON Object")
            return
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: config.params, options: .prettyPrinted)
            let decodedYouboraConfig = try JSONDecoder().decode(YouboraConfig.self, from: data)
            self.ybConfig = decodedYouboraConfig
            
        } catch let error as NSError {
            XCTAssertThrowsError("Couldn't parse data into YouboraConfig error: \(error)")
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGeneralOptions() throws {
        
        guard let config = self.ybConfig else {
            return
        }
        
        let options: YBOptions = config.options()
        
        XCTAssertTrue(options.accountCode == ybc.accountCode)
        XCTAssertTrue(options.username == ybc.username)
        XCTAssertTrue(options.anonymousUser == ybc.anonymousUser)
        XCTAssertTrue(options.userType == ybc.userType)
        XCTAssertTrue(options.userObfuscateIp as? Bool == ybc.obfuscateIP)
        XCTAssertTrue(options.httpSecure == ybc.httpSecure)
        XCTAssertTrue(options.contentCdn == ybc.contentCDN)
        XCTAssertTrue(options.autoDetectBackground == ybc.autoDetectBackground)
        XCTAssertTrue(options.offline == ybc.offline)
    }
    
    func testAppConfig() throws {
        guard let config = self.ybConfig else {
            return
        }
        
        let options: YBOptions = config.options()
        
        // App
        XCTAssertTrue(options.appName == ybc.appName)
        XCTAssertTrue(options.appReleaseVersion == ybc.appReleaseVersion)
    }
    
    func testUserConfig() throws {
        guard let config = self.ybConfig else {
            return
        }
        
        let options: YBOptions = config.options()
        
        // User
        XCTAssertTrue(options.username == ybc.username)
        XCTAssertTrue(options.userEmail == ybc.userEmail)
        XCTAssertTrue(options.userType == ybc.userType)
        //XCTAssertTrue(options.houseHoldId == ybc.houseHoldId)
    }
    
    func testAdsOptions() throws {
        guard let config = self.ybConfig else {
            return
        }
        
        let options: YBOptions = config.options()
        
        // Ads
        XCTAssertTrue(options.adTitle == ybc.adTitle)
        XCTAssertTrue(options.adCampaign == ybc.adCampaign)
        XCTAssertTrue(options.adProvider == ybc.adProvider)
        XCTAssertTrue(options.adResource == ybc.adResource)
        XCTAssertTrue(options.adCreativeId == ybc.adCreativeId)
        
        // Ad Custom dimentions
        XCTAssertTrue(options.adCustomDimension1 == ybc.adCustomDimension1)
        XCTAssertTrue(options.adCustomDimension2 == ybc.adCustomDimension2)
        XCTAssertTrue(options.adCustomDimension3 == ybc.adCustomDimension3)
        XCTAssertTrue(options.adCustomDimension4 == ybc.adCustomDimension4)
        XCTAssertTrue(options.adCustomDimension5 == ybc.adCustomDimension5)
        XCTAssertTrue(options.adCustomDimension6 == ybc.adCustomDimension6)
        XCTAssertTrue(options.adCustomDimension7 == ybc.adCustomDimension7)
        XCTAssertTrue(options.adCustomDimension8 == ybc.adCustomDimension8)
        XCTAssertTrue(options.adCustomDimension9 == ybc.adCustomDimension9)
        XCTAssertTrue(options.adCustomDimension10 == ybc.adCustomDimension10)
        
    }
    
    func testCustomDimensions() throws {
        guard let config = self.ybConfig else {
            return
        }
        
        let options: YBOptions = config.options()
        
        // extraParams
        XCTAssertTrue(options.contentCustomDimension1 == ybc.extraParam1)
        XCTAssertTrue(options.contentCustomDimension2 == ybc.extraParam2)
        XCTAssertTrue(options.contentCustomDimension3 == ybc.extraParam3)
        XCTAssertTrue(options.contentCustomDimension4 == ybc.extraParam4)
        XCTAssertTrue(options.contentCustomDimension5 == ybc.extraParam5)
        XCTAssertTrue(options.contentCustomDimension6 == ybc.extraParam6)
        XCTAssertTrue(options.contentCustomDimension7 == ybc.extraParam7)
        XCTAssertTrue(options.contentCustomDimension8 == ybc.extraParam8)
        XCTAssertTrue(options.contentCustomDimension9 == ybc.extraParam9)
        XCTAssertTrue(options.contentCustomDimension10 == ybc.extraParam10)
        XCTAssertTrue(options.contentCustomDimension11 == ybc.extraParam11)
        XCTAssertTrue(options.contentCustomDimension12 == ybc.extraParam12)
        XCTAssertTrue(options.contentCustomDimension13 == ybc.extraParam13)
        XCTAssertTrue(options.contentCustomDimension14 == ybc.extraParam14)
        XCTAssertTrue(options.contentCustomDimension15 == ybc.extraParam15)
        XCTAssertTrue(options.contentCustomDimension16 == ybc.extraParam16)
        XCTAssertTrue(options.contentCustomDimension17 == ybc.extraParam17)
        XCTAssertTrue(options.contentCustomDimension18 == ybc.extraParam18)
        XCTAssertTrue(options.contentCustomDimension19 == ybc.extraParam19)
        XCTAssertTrue(options.contentCustomDimension20 == ybc.extraParam20)
        
    }
    
    func testContentOptions() throws {
        // Same as media
        XCTAssertTrue(false, "Add Test")
    }
    
    func testContentMetadata() throws {
        // Same as Properties
        XCTAssertTrue(false, "Add Test")
    }
    
    func testParseOptions() throws {
        XCTAssertTrue(false, "Add Test")
    }
    
    func testErrors() throws {
        XCTAssertTrue(false, "Add Test")
    }
    
}
