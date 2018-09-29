//
//  GameUS.swift
//

import Foundation

public struct GameUS {
    let buyItNow: Bool
    let buyOnline: Bool
    let caPrice: Double?
    let categories: [String]
    let digitalDownload: Bool
    let eshopPrice: Double?
    let freeToStart: Bool
    let frontBoxArt: String
    let gameCode: String
    let id: String
    let nso: Bool?
    let nsuid: String?
    let numberOfPlayers: String
    let releaseDate: String
    let releaseDateDisplay: String?
    let salePrice: Double?
    let slug: String
    let system: String
    let title: String
    let videoLink: String?
    
    init?(jsonObject: Any) {
        guard let info = jsonObject as? [String: Any] else {
            return nil
        }
        
        // Note: Casting has to happen after String cast due to ill formatted json
        
        // Shouldnt be optionals
        buyItNow = Bool(info[.buyItNow].expectedString) ?? false
        buyOnline = Bool(info[.buyOnline].expectedString) ?? false
        digitalDownload = Bool(info[.digitalDownload].expectedString) ?? false
        freeToStart = Bool(info[.freeToStart].expectedString) ?? false
        frontBoxArt = info[.frontBoxArt].expectedString
        gameCode = info[.gameCode].expectedString
        id = info[.id].expectedString
        numberOfPlayers = info[.numberOfPlayers].expectedString
        releaseDate = info[.releaseDate].expectedString
        slug = info[.slug].expectedString
        system = info[.system].expectedString
        title = info[.title].expectedString
        
        // Category
        let categoriesDictionary = info["categories"] as? [String: Any] ?? [:]
        if let categoriesList = categoriesDictionary["category"] as? [String] {
            categories = categoriesList
        } else if let category = categoriesDictionary["category"] as? String {
            categories = [category]
        } else {
            categories = []
        }
        
        // Optionals
        caPrice = Double(info[.caPrice] as? String ?? "")
        eshopPrice = Double(info[.eshopPrice] as? String ?? "")
        nso = Bool(info[.nso] as? String ?? "")
        nsuid = info[.nsuid] as? String
        releaseDateDisplay = info[.releaseDateDisplay] as? String
        salePrice = Double(info[.salePrice] as? String ?? "")
        videoLink = info[.videoLink] as? String
    }
    
    enum ParseKey: String, CaseIterable {
        case buyOnline = "buyonline"
        case caPrice = "ca_price"
        case categoriesDictionary = "categories"
        case digitalDownload = "digitaldownload"
        case eshopPrice = "eshop_price"
        case freeToStart = "free_to_start"
        case frontBoxArt = "front_box_art"
        case gameCode = "game_code"
        case id = "id"
        case nsuid = "nsuid"
        case numberOfPlayers = "number_of_players"
        case releaseDate = "release_date"
        case slug = "slug"
        case system = "system"
        case title = "title"
        case videoLink = "video_link"
        case buyItNow = "buyitnow"
        case nso = "nso"
        case releaseDateDisplay = "release_date_display"
        case salePrice = "sale_price"
    }
}

extension Dictionary where Key == String {
    
    fileprivate subscript(_ key: GameUS.ParseKey) -> Any? {
        return self[key.rawValue]
    }
    
}
