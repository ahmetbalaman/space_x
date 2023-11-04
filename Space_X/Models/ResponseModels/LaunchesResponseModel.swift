// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let launchesModel = try? JSONDecoder().decode(LaunchesModel.self, from: jsonData)

import Foundation

// MARK: - LaunchesModel
struct LaunchesModel: Codable {
    let flightNumber: Int?
    let missionName: String?
    let missionID: [String]?
    let launchYear: String?
    let launchDateUnix: Int?
    let launchDateUTC: String?
    let launchDateLocal: String?
    let isTentative: Bool?
    let tentativeMaxPrecision: String?
    let tbd: Bool?
    let launchWindow: Int?
    let rocket: Rocket?
   
    let telemetry: Telemetry?
    let launchSite: LaunchSite?
    let launchSuccess: Bool?
    let links: Links?
    let details: String?
    let upcoming: Bool?
    let lastDateUpdate: String?
    let lastLlLaunchDate, lastLlUpdate: String?
    let lastWikiLaunchDate, lastWikiRevision, lastWikiUpdate, launchDateSource: String?

    enum CodingKeys: String, CodingKey {
        case flightNumber = "flight_number"
        case missionName = "mission_name"
        case missionID = "mission_id"
        case launchYear = "launch_year"
        case launchDateUnix = "launch_date_unix"
        case launchDateUTC = "launch_date_utc"
        case launchDateLocal = "launch_date_local"
        case isTentative = "is_tentative"
        case tentativeMaxPrecision = "tentative_max_precision"
        case tbd
        case launchWindow = "launch_window"
        case rocket, telemetry
        case launchSite = "launch_site"
        case launchSuccess = "launch_success"
        case links, details, upcoming
        
        case lastDateUpdate = "last_date_update"
        case lastLlLaunchDate = "last_ll_launch_date"
        case lastLlUpdate = "last_ll_update"
        case lastWikiLaunchDate = "last_wiki_launch_date"
        case lastWikiRevision = "last_wiki_revision"
        case lastWikiUpdate = "last_wiki_update"
        case launchDateSource = "launch_date_source"
    }
}

// MARK: - LaunchSite
struct LaunchSite: Codable {
    let siteID, siteName, siteNameLong: String?

    enum CodingKeys: String, CodingKey {
        case siteID = "site_id"
        case siteName = "site_name"
        case siteNameLong = "site_name_long"
    }
}

// MARK: - Links
struct Links: Codable {
    let missionPatch, missionPatchSmall: String?
    let redditCampaign: String?
    let redditLaunch, redditRecovery, redditMedia, presskit: String?
    let articleLink, wikipedia, videoLink, youtubeID: String?
    

    enum CodingKeys: String, CodingKey {
        case missionPatch = "mission_patch"
        case missionPatchSmall = "mission_patch_small"
        case redditCampaign = "reddit_campaign"
        case redditLaunch = "reddit_launch"
        case redditRecovery = "reddit_recovery"
        case redditMedia = "reddit_media"
        case presskit
        case articleLink = "article_link"
        case wikipedia
        case videoLink = "video_link"
        case youtubeID = "youtube_id"
        
    }
}

// MARK: - Rocket
struct Rocket: Codable {
    let rocketID, rocketName, rocketType: String?
    let firstStage: FirstStage?
    let secondStage: SecondStage?
    let fairings: Fairings?

    enum CodingKeys: String, CodingKey {
        case rocketID = "rocket_id"
        case rocketName = "rocket_name"
        case rocketType = "rocket_type"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case fairings
    }
}

struct Fairings: Codable{
    let reused: Bool?
    let recoveryAttempt:Bool?
    let recovered:Bool?
    let ship:String?
    enum CodingKeys: String, CodingKey {
        case reused = "reused"
        case recoveryAttempt = "recovery_attempt"
        case recovered = "recovered"
        case ship = "ship"
       
    }
}

// MARK: - FirstStage
struct FirstStage: Codable {
    let cores: [Core]?
}

// MARK: - Core
struct Core: Codable {
    let coreSerial: String?
    let flight, block: Int?
    let gridfins, legs, reused: Bool?
    let landSuccess: Bool?
    let landingIntent: Bool?
    let landingType: String?
    let landingVehicle: String?

    enum CodingKeys: String, CodingKey {
        case coreSerial = "core_serial"
        case flight, block, gridfins, legs, reused
        case landSuccess = "land_success"
        case landingIntent = "landing_intent"
        case landingType = "landing_type"
        case landingVehicle = "landing_vehicle"
    }
}

// MARK: - SecondStage
struct SecondStage: Codable {
    let block: Int?
    let payloads: [Payload]?
}

// MARK: - Payload
struct Payload: Codable {
    let payloadID: String?
    let noradID: [Int]?
    let capSerial: String?
    let reused: Bool?
    let customers: [String]?
    let nationality, manufacturer, payloadType: String?
    let payloadMassKg, payloadMassLbs: Double?
    let orbit: String?
    let orbitParams: OrbitParams?
    let massReturnedKg, massReturnedLbs, flightTimeSEC:Double?
    let cargoManifest: String?

    enum CodingKeys: String, CodingKey {
        case payloadID = "payload_id"
        case noradID = "norad_id"
        case capSerial = "cap_serial"
        case reused, customers, nationality, manufacturer
        case payloadType = "payload_type"
        case payloadMassKg = "payload_mass_kg"
        case payloadMassLbs = "payload_mass_lbs"
        case orbit
        case orbitParams = "orbit_params"
        case massReturnedKg = "mass_returned_kg"
        case massReturnedLbs = "mass_returned_lbs"
        case flightTimeSEC = "flight_time_sec"
        case cargoManifest = "cargo_manifest"
    }
}

// MARK: - OrbitParams
struct OrbitParams: Codable {
    let referenceSystem, regime: String?
    let longitude, semiMajorAxisKM, eccentricity, periapsisKM: Double?
    let apoapsisKM, inclinationDeg, periodMin, lifespanYears: Double?
    
    let meanAnomaly: Double?

    enum CodingKeys: String, CodingKey {
        case referenceSystem = "reference_system"
        case regime, longitude
        case semiMajorAxisKM = "semi_major_axis_km"
        case eccentricity
        case periapsisKM = "periapsis_km"
        case apoapsisKM = "apoapsis_km"
        case inclinationDeg = "inclination_deg"
        case periodMin = "period_min"
        case lifespanYears = "lifespan_years"
        case meanAnomaly = "mean_anomaly"
    }
}

// MARK: - Telemetry
struct Telemetry: Codable {
    let flightClub: String?

    enum CodingKeys: String, CodingKey {
        case flightClub = "flight_club"
    }
}
