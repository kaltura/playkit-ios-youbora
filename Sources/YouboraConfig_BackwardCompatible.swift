//
//  YouboraConfig_BackwardCompatible.swift
//  PlayKitYoubora
//
//  Created by Nilit Danan on 16/03/2022.
//

import YouboraLib

// MARK: BackwardCompatibleData

// Backward Compatible - Deprecated - Will be removed in the future.

@available(*, deprecated, message: "Check property message, Most are in the Content object")
struct Properties: Decodable {
    /**
    Use content, genre.
     */
    let genre: String?
    /**
    Use content, type.
     */
    let type: String?
    /**
    Use content, metadata array.
     */
    let transactionType: String?
    /**
    Use content, metadata array.
     */
    let year: String?
    /**
    Use content, metadata array.
     */
    let cast: String?
    /**
    Use content, metadata array.
     */
    let director: String?
    /**
    Use content, metadata array.
     */
    let owner: String?
    /**
    Use content, metadata array.
     */
    let parental: String?
    /**
    Use content, price.
     */
    let price: String?
    /**
    Use content, metadata array.
     */
    let rating: String?
    /**
    Use content, metadata array.
     */
    let audioType: String?
    /**
    Use content, metadata array.
     */
    let audioChannels: String?
    /**
    Use device object, has more properties.
     */
    let device: String?
    /**
    Use content, metadata array.
     */
    let quality: String?
}

@available(*, deprecated, message: "Use customDimension property in Content")
struct ContentCustomDimensions: Decodable {
    let contentCustomDimension1: String?
    let contentCustomDimension2: String?
    let contentCustomDimension3: String?
    let contentCustomDimension4: String?
    let contentCustomDimension5: String?
    let contentCustomDimension6: String?
    let contentCustomDimension7: String?
    let contentCustomDimension8: String?
    let contentCustomDimension9: String?
    let contentCustomDimension10: String?
    let contentCustomDimension11: String?
    let contentCustomDimension12: String?
    let contentCustomDimension13: String?
    let contentCustomDimension14: String?
    let contentCustomDimension15: String?
    let contentCustomDimension16: String?
    let contentCustomDimension17: String?
    let contentCustomDimension18: String?
    let contentCustomDimension19: String?
    let contentCustomDimension20: String?
}

@available(*, deprecated, message: "Use customDimension property in Content")
struct ExtraParams: Codable {
    let param1: String?
    let param2: String?
    let param3: String?
    let param4: String?
    let param5: String?
    let param6: String?
    let param7: String?
    let param8: String?
    let param9: String?
    let param10: String?
}

@available(*, deprecated, renamed: "Ad", message: "Use ad property instead")
struct Ads: Decodable {
    let adBreaksTime: [Int]?
    let campaign: String?
    let adCampaign: String?
    let adCreativeId: String?
    let adExpectedBreaks: Int?
    let adGivenBreaks: Int?
    let adProvider: String?
    let adResource: String?
    let adTitle: String?
    let adGivenAds: Int?
    let extraParams: ExtraParams?
    let adCustomDimensions: AdCustomDimensions?
}

@available(*, deprecated)
struct AdCustomDimensions: Decodable {
    let adCustomDimension1: String?
    let adCustomDimension2: String?
    let adCustomDimension3: String?
    let adCustomDimension4: String?
    let adCustomDimension5: String?
    let adCustomDimension6: String?
    let adCustomDimension7: String?
    let adCustomDimension8: String?
    let adCustomDimension9: String?
    let adCustomDimension10: String?
}

extension YouboraConfig {
    
    func addBackwardCompatibleData(to options: YBOptions) {

        if options.userEmail == nil {
            options.userEmail = userEmail
        }
        
        if options.anonymousUser == nil {
            options.anonymousUser = userAnonymousId
        }
        
        if options.userType == nil {
            options.userType = userType
        }
        
        if options.userObfuscateIp == nil {
            if let obfuscateIP = obfuscateIP {
                options.userObfuscateIp = NSNumber(booleanLiteral: obfuscateIP)
            } else if let userObfuscateIp = userObfuscateIp {
                options.userObfuscateIp = NSNumber(booleanLiteral: userObfuscateIp)
            }
        }
        
        if options.contentCdn == nil {
            options.contentCdn = contentCDN
        }
        
        if enabled == nil, let isEnabled = isEnabled {
            options.enabled = isEnabled
        }
        
        if forceInit == nil, let isForceInit = isForceInit {
            options.forceInit = isForceInit
        }
        
        if options.appName == nil {
            options.appName = appName
        }

        if let properties = properties {
            if options.contentGenre == nil {
                options.contentGenre = properties.genre
            }
            
            if options.contentType == nil {
                options.contentType = properties.type
            }
            
            var additionalContentMetadata: [String: String] = [:]
            if let transactionType = properties.transactionType, !transactionType.isEmpty {
                additionalContentMetadata["transaction_type"] = transactionType
            }
            if let year = properties.year, !year.isEmpty {
                additionalContentMetadata["year"] = year
            }
            if let cast = properties.cast, !cast.isEmpty {
                additionalContentMetadata["cast"] = cast
            }
            if let director = properties.director, !director.isEmpty {
                additionalContentMetadata["director"] = director
            }
            if let owner = properties.owner, !owner.isEmpty {
                additionalContentMetadata["owner"] = owner
            }
            if let parental = properties.parental, !parental.isEmpty {
                additionalContentMetadata["parental"] = parental
            }
            if let price = properties.price, !price.isEmpty {
                additionalContentMetadata["price"] = price
            }
            if let rating = properties.rating, !rating.isEmpty {
                additionalContentMetadata["rating"] = rating
            }
            if let audioType = properties.audioType, !audioType.isEmpty {
                additionalContentMetadata["audioType"] = audioType
            }
            if let audioChannels = properties.audioChannels, !audioChannels.isEmpty {
                additionalContentMetadata["audioChannels"] = audioChannels
            }
            if let device = properties.device, !device.isEmpty {
                additionalContentMetadata["device"] = device
            }
            if let quality = properties.quality, !quality.isEmpty {
                additionalContentMetadata["quality"] = quality
            }
            
            if options.contentMetadata == nil {
                options.contentMetadata = additionalContentMetadata
            } else {
                // Keeping the value in options.contentMetadata if exists also in appendContentMetadata.
                options.contentMetadata?.merge(additionalContentMetadata) {(current,_) in current}
            }
        }
        
        if let contentCustomDimensions = contentCustomDimensions {
            if options.contentCustomDimension1 == nil {
                options.contentCustomDimension1 = contentCustomDimensions.contentCustomDimension1
            }
            
            if options.contentCustomDimension2 == nil {
                options.contentCustomDimension2 = contentCustomDimensions.contentCustomDimension2
            }
            
            if options.contentCustomDimension3 == nil {
                options.contentCustomDimension3 = contentCustomDimensions.contentCustomDimension3
            }
            
            if options.contentCustomDimension4 == nil {
                options.contentCustomDimension4 = contentCustomDimensions.contentCustomDimension4
            }
                
            if options.contentCustomDimension5 == nil {
                options.contentCustomDimension5 = contentCustomDimensions.contentCustomDimension5
            }
            
            if options.contentCustomDimension6 == nil {
                options.contentCustomDimension6 = contentCustomDimensions.contentCustomDimension6
            }
               
            if options.contentCustomDimension7 == nil {
                options.contentCustomDimension7 = contentCustomDimensions.contentCustomDimension7
            }
            
            if options.contentCustomDimension8 == nil {
                options.contentCustomDimension8 = contentCustomDimensions.contentCustomDimension8
            }
            
            if options.contentCustomDimension9 == nil {
                options.contentCustomDimension9 = contentCustomDimensions.contentCustomDimension9
            }
            
            if options.contentCustomDimension10 == nil {
                options.contentCustomDimension10 = contentCustomDimensions.contentCustomDimension10
            }
            
            if options.contentCustomDimension11 == nil {
                options.contentCustomDimension11 = contentCustomDimensions.contentCustomDimension11
            }
            
            if options.contentCustomDimension12 == nil {
                options.contentCustomDimension12 = contentCustomDimensions.contentCustomDimension12
            }
            
            if options.contentCustomDimension13 == nil {
                options.contentCustomDimension13 = contentCustomDimensions.contentCustomDimension13
            }
            
            if options.contentCustomDimension14 == nil {
                options.contentCustomDimension14 = contentCustomDimensions.contentCustomDimension14
            }
            
            if options.contentCustomDimension15 == nil {
                options.contentCustomDimension15 = contentCustomDimensions.contentCustomDimension15
            }
            
            if options.contentCustomDimension16 == nil {
                options.contentCustomDimension16 = contentCustomDimensions.contentCustomDimension16
            }
            
            if options.contentCustomDimension17 == nil {
                options.contentCustomDimension17 = contentCustomDimensions.contentCustomDimension17
            }
            
            if options.contentCustomDimension18 == nil {
                options.contentCustomDimension18 = contentCustomDimensions.contentCustomDimension18
            }
            
            if options.contentCustomDimension19 == nil {
                options.contentCustomDimension19 = contentCustomDimensions.contentCustomDimension19
            }
            
            if options.contentCustomDimension20 == nil {
                options.contentCustomDimension20 = contentCustomDimensions.contentCustomDimension20
            }
        }
        
        if let extraParams = extraParams {
            if let additionalExtraParams = extraParams.dictionary {
                if options.contentCustomDimensions == nil {
                    options.contentCustomDimensions = additionalExtraParams
                } else {
                    // Keeping the value in options.customDimensions if exists also in appendExtraParams.
                    options.contentCustomDimensions?.merge(additionalExtraParams) {(current,_) in current}
                }
            }
        }

        if let ads = ads {
            if options.adBreaksTime == nil {
                options.adBreaksTime = ads.adBreaksTime
            }
            
            if options.adCampaign == nil {
                options.adCampaign = ads.adCampaign ?? ads.campaign
            }
            
            if options.adCreativeId == nil {
                options.adCreativeId = ads.adCreativeId
            }
            
            if options.adExpectedBreaks == nil, let adExpectedBreaks = ads.adExpectedBreaks {
                options.adExpectedBreaks = NSNumber(value: adExpectedBreaks)
            }
            
            if options.adGivenBreaks == nil, let adGivenBreaks = ads.adGivenBreaks {
                options.adGivenBreaks = NSNumber(value: adGivenBreaks)
            }
            
            if options.adProvider == nil {
                options.adProvider = ads.adProvider
            }
            
            if options.adResource == nil {
                options.adResource = ads.adResource
            }
            
            if options.adTitle == nil {
                options.adTitle = ads.adTitle
            }
            
            if options.adGivenAds == nil, let adGivenAds = ads.adGivenAds {
                options.adGivenAds = NSNumber(value: adGivenAds)
            }
            
            if let adCustomDimensions = ads.adCustomDimensions {
                if options.adCustomDimension1 == nil {
                    options.adCustomDimension1 = adCustomDimensions.adCustomDimension1
                }
                if options.adCustomDimension2 == nil {
                    options.adCustomDimension2 = adCustomDimensions.adCustomDimension2
                }
                if options.adCustomDimension3 == nil {
                    options.adCustomDimension3 = adCustomDimensions.adCustomDimension3
                }
                if options.adCustomDimension4 == nil {
                    options.adCustomDimension4 = adCustomDimensions.adCustomDimension4
                }
                if options.adCustomDimension5 == nil {
                    options.adCustomDimension5 = adCustomDimensions.adCustomDimension5
                }
                if options.adCustomDimension6 == nil {
                    options.adCustomDimension6 = adCustomDimensions.adCustomDimension6
                }
                if options.adCustomDimension7 == nil {
                    options.adCustomDimension7 = adCustomDimensions.adCustomDimension7
                }
                if options.adCustomDimension8 == nil {
                    options.adCustomDimension8 = adCustomDimensions.adCustomDimension8
                }
                if options.adCustomDimension9 == nil {
                    options.adCustomDimension9 = adCustomDimensions.adCustomDimension9
                }
                if options.adCustomDimension10 == nil {
                    options.adCustomDimension10 = adCustomDimensions.adCustomDimension10
                }
            }
            
            if let extraParams = ads.extraParams {
                if options.adCustomDimension1 == nil {
                    options.adCustomDimension1 = extraParams.param1
                }
                if options.adCustomDimension2 == nil {
                    options.adCustomDimension2 = extraParams.param2
                }
                if options.adCustomDimension3 == nil {
                    options.adCustomDimension3 = extraParams.param3
                }
                if options.adCustomDimension4 == nil {
                    options.adCustomDimension4 = extraParams.param4
                }
                if options.adCustomDimension5 == nil {
                    options.adCustomDimension5 = extraParams.param5
                }
                if options.adCustomDimension6 == nil {
                    options.adCustomDimension6 = extraParams.param6
                }
                if options.adCustomDimension7 == nil {
                    options.adCustomDimension7 = extraParams.param7
                }
                if options.adCustomDimension8 == nil {
                    options.adCustomDimension8 = extraParams.param8
                }
                if options.adCustomDimension9 == nil {
                    options.adCustomDimension9 = extraParams.param9
                }
                if options.adCustomDimension10 == nil {
                    options.adCustomDimension10 = extraParams.param10
                }
            }
            
            if options.contentIsLiveNoSeek == nil, let isDVR = content?.isDVR {
                options.contentIsLiveNoSeek = NSNumber(value: isDVR)
            }
            
            if options.program == nil {
                options.program = content?.title2
            }
        }
    }
}
