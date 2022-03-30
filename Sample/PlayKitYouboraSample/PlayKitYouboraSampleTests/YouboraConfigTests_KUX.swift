//
//  YouboraConfigTests_KUX.swift
//  PlayKitYouboraSampleTests
//
//  Created by Nilit Danan on 25/03/2022.
//

import XCTest

// MARK: - Test KUX config

extension YouboraConfigTests {
    func testKUXOptions() {
        guard let options = self.ybKUXOptions else {
            XCTFail(ybOptionsNilMessage)
            return
        }
        
        // General
        XCTAssertTrue(options.accountCode == ybCT.KUXValues.accountCode)
        XCTAssertTrue(options.username == ybCT.KUXValues.username)
        // App
        XCTAssertTrue(options.appReleaseVersion == ybCT.KUXValues.App.releaseVersion)
        XCTAssertTrue(options.appName == ybCT.KUXValues.App.name)
        // Content
        XCTAssertTrue(options.contentChannel == ybCT.KUXValues.Content.channel)
        XCTAssertTrue(options.contentType == ybCT.KUXValues.Content.type)
        XCTAssertTrue(options.contentGenre == ybCT.KUXValues.Content.genre)
        XCTAssertTrue(options.contentSubtitles == ybCT.KUXValues.Content.subtitles)
        XCTAssertTrue(options.contentTitle == ybCT.KUXValues.Content.title)
        XCTAssertTrue(options.program ==  ybCT.KUXValues.Content.program)
        XCTAssertTrue(options.contentCustomDimension1 == ybCT.KUXValues.Content.CustomDimension.cd1)
    }
}
