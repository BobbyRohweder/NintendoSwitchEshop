//
//  GameEU.swift
//

import Foundation

public struct GameEU {
    
    let addOnContent: Bool?
    let ageRatingSorting: Int
    let ageRatingType: String
    let ageRatingValue: String
    let changeDate: Date
    let cloudSaves: Bool?
    let clubNintendo: Bool
    let compatibleController: [String]?
    let coopPlay: Bool?
    let copyright: String?
    let dateFrom: Date
    let datesReleasedDts: [Date]
    let demoAvailability: Bool?
    let developer: String?
    let digitalVersion: Bool
    let excerpt: String
    let gameCategoriesTxt: [String]
    let gameCategory: [String]
    let gameSeries: String?
    let gameSeriesTxt: [String]?
    let giftFinderCarouselImageUrl: String
    let giftFinderDescription: String?
    let giftFinderDetailPageImageUrl: String
    let giftFinderDetailPageStoreLink: String?
    let giftFinderWishlistImageUrl: String
    let hdRumble: Bool?
    let id: String
    let imageUrl: String
    let imageUrlHorizontal: String
    let imageUrlSq: String
    let imageUrlTm: String?
    let indie: Bool?
    let internet: Bool?
    let languageAvailability: [String]
    let localPlay: Bool?
    let matchPlay: Bool?
    let multiplayerMode: String?
    let nearFieldComm: Bool?
    let nsuidTxt: [String]?
    let offTvPlay: Bool?
    let originallyFor: String
    let paidSubscriptionRequired: Bool?
    let physicalVersion: Bool
    let playModeHandheldMode: Bool?
    let playModeTabletopMode: Bool?
    let playModeTvMode: Bool?
    let playableOnTxt: [String]?
    let playersFrom: Int?
    let playersTo: Int?
    let prettyAgeRating: String
    let prettyDate: String
    let prettyGameCategoriesTxt: [String]
    let priceDiscountPercentage: Double
    let priceHasDiscount: Bool?
    let priceLowest: Double
    let priceSorting: Double
    let priority: Date?
    let productCodeTxt: [String]?
    let publisher: String?
    let sortingTitle: String
    let systemNamesTxt: [String]
    let systemType: [String]
    let title: String
    let titleExtrasTxt: [String]
    let type: String
    let url: String
    
    init?(jsonObject: Any) {
        guard let info = jsonObject as? [String: Any] else {
            return nil
        }
        
        // Shouldnt be optionals
        ageRatingSorting = info[.ageRatingSorting].expectedInt
        ageRatingType = info[.ageRatingType].expectedString
        ageRatingValue = info[.ageRatingValue].expectedString
        clubNintendo = info[.clubNintendo].expectedBool
        digitalVersion = info[.digitalVersion].expectedBool
        excerpt = info[.excerpt].expectedString
        gameCategoriesTxt = info[.gameCategoriesTxt].expectedStringArray
        gameCategory = info[.gameCategory].expectedStringArray
        giftFinderCarouselImageUrl = info[.giftFinderCarouselImageUrl].expectedString
        giftFinderDetailPageImageUrl = info[.giftFinderDetailPageImageUrl].expectedString
        giftFinderWishlistImageUrl = info[.giftFinderWishlistImageUrl].expectedString
        id = info[.id].expectedString
        imageUrl = info[.imageUrl].expectedString
        imageUrlHorizontal = info[.imageUrlHorizontal].expectedString
        imageUrlSq = info[.imageUrlSq].expectedString
        languageAvailability = info[.languageAvailability].expectedStringArray
        originallyFor = info[.originallyFor].expectedString
        physicalVersion = info[.physicalVersion].expectedBool
        prettyAgeRating = info[.prettyAgeRating].expectedString
        prettyDate = info[.prettyDate].expectedString
        prettyGameCategoriesTxt = info[.prettyGameCategoriesTxt].expectedStringArray
        priceDiscountPercentage = info[.priceDiscountPercentage].expectedDouble
        priceLowest = info[.priceLowest].expectedDouble
        priceSorting = info[.priceSorting].expectedDouble
        sortingTitle = info[.sortingTitle].expectedString
        systemNamesTxt = info[.systemNamesTxt].expectedStringArray
        systemType = info[.systemType].expectedStringArray
        title = info[.title].expectedString
        titleExtrasTxt = info[.titleExtrasTxt].expectedStringArray
        type = info[.type].expectedString
        url = info[.url].expectedString
        
        // Dates
        changeDate = DateFormatter.iso8601.date(from: info[.changeDate].expectedString) ?? Date()
        dateFrom = DateFormatter.iso8601.date(from: info[.dateFrom].expectedString) ?? Date()
        datesReleasedDts = info[.datesReleasedDts].expectedStringArray.map { DateFormatter.iso8601.date(from: $0) ?? Date() }
        
        // Optionals
        addOnContent = info[.addOnContent] as? Bool
        cloudSaves = info[.cloudSaves] as? Bool
        compatibleController = info[.compatibleController] as? [String]
        coopPlay = info[.coopPlay] as? Bool
        copyright = info[.copyright] as? String
        demoAvailability = info[.demoAvailability] as? Bool
        developer = info[.developer] as? String
        gameSeries = info[.gameSeries] as? String
        gameSeriesTxt = info[.gameSeriesTxt] as? [String]
        giftFinderDescription = info[.giftFinderDescription] as? String
        giftFinderDetailPageStoreLink = info[.giftFinderDetailPageStoreLink] as? String
        hdRumble = info[.hdRumble] as? Bool
        imageUrlTm = info[.imageUrlTm] as? String
        indie = info[.indie] as? Bool
        internet = info[.internet] as? Bool
        localPlay = info[.localPlay] as? Bool
        matchPlay = info[.matchPlay] as? Bool
        multiplayerMode = info[.multiplayerMode] as? String
        nearFieldComm = info[.nearFieldComm] as? Bool
        nsuidTxt = info[.nsuidTxt] as? [String]
        offTvPlay = info[.offTvPlay] as? Bool
        paidSubscriptionRequired = info[.paidSubscriptionRequired] as? Bool
        playModeHandheldMode = info[.playModeHandheldMode] as? Bool
        playModeTabletopMode = info[.playModeTabletopMode] as? Bool
        playModeTvMode = info[.playModeTvMode] as? Bool
        playableOnTxt = info[.playableOnTxt] as? [String]
        playersFrom = info[.playersFrom] as? Int
        playersTo = info[.playersTo] as? Int
        priceHasDiscount = info[.priceHasDiscount] as? Bool
        priority = DateFormatter.iso8601.date(from: info[.priority] as? String ?? "")
        productCodeTxt = info[.productCodeTxt] as? [String]
        publisher = info[.publisher] as? String
    }
    
    enum ParseKey: String, CaseIterable {
        case addOnContent = "add_on_content_b"
        case ageRatingSorting = "age_rating_sorting_i"
        case ageRatingType = "age_rating_type"
        case ageRatingValue = "age_rating_value"
        case changeDate = "change_date"
        case clubNintendo = "club_nintendo"
        case compatibleController = "compatible_controller"
        case copyright = "copyright_s"
        case dateFrom = "date_from"
        case developer = "developer"
        case excerpt = "excerpt"
        case gameCategoriesTxt = "game_categories_txt"
        case gameCategory = "game_category"
        case gameSeries = "game_series_t"
        case giftFinderCarouselImageUrl = "gift_finder_carousel_image_url_s"
        case giftFinderDescription = "gift_finder_description_s"
        case giftFinderDetailPageImageUrl = "gift_finder_detail_page_image_url_s"
        case giftFinderDetailPageStoreLink = "gift_finder_detail_page_store_link_s"
        case giftFinderWishlistImageUrl = "gift_finder_wishlist_image_url_s"
        case id = "fs_id"
        case imageUrl = "image_url"
        case imageUrlSq = "image_url_sq_s"
        case imageUrlTm = "image_url_tm_s"
        case languageAvailability = "language_availability"
        case nearFieldComm = "near_field_comm_b"
        case nsuidTxt = "nsuid_txt"
        case originallyFor = "originally_for_t"
        case physicalVersion = "physical_version_b"
        case playModeHandheldMode = "play_mode_handheld_mode_b"
        case playModeTabletopMode = "play_mode_tabletop_mode_b"
        case playModeTvMode = "play_mode_tv_mode_b"
        case playableOnTxt = "playable_on_txt"
        case playersFrom = "players_from"
        case playersTo = "players_to"
        case prettyAgeRating = "pretty_agerating_s"
        case prettyDate = "pretty_date_s"
        case priority = "priority"
        case productCodeTxt = "product_code_txt"
        case publisher = "publisher"
        case sortingTitle = "sorting_title"
        case systemNamesTxt = "system_names_txt"
        case systemType = "system_type"
        case title = "title"
        case titleExtrasTxt = "title_extras_txt"
        case type = "type"
        case url = "url"
        
        case gameSeriesTxt = "game_series_txt"
        case paidSubscriptionRequired = "paid_subscription_required_b"
        case priceSorting = "price_sorting_f"
        case imageUrlHorizontal = "image_url_h2x1_s"
        case multiplayerMode = "multiplayer_mode"
        case offTvPlay = "off_tv_play_b"
        case prettyGameCategoriesTxt = "pretty_game_categories_txt"
        case cloudSaves = "cloud_saves_b"
        case indie = "indie_b"
        case digitalVersion = "digital_version_b"
        case demoAvailability = "demo_availability"
        case internet = "internet"
        case priceLowest = "price_lowest_f"
        case localPlay = "local_play"
        case matchPlay = "match_play_b"
        case hdRumble = "hd_rumble_b"
        case priceDiscountPercentage = "price_discount_percentage_f"
        case datesReleasedDts = "dates_released_dts"
        case priceHasDiscount = "price_has_discount_b"
        case coopPlay = "coop_play_b"
    }
}

extension Dictionary where Key == String {
    
    fileprivate subscript(_ key: GameEU.ParseKey) -> Any? {
        return self[key.rawValue]
    }
    
}
