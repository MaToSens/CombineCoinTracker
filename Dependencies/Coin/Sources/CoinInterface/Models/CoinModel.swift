//
//  CoinModel.swift
//
//
//  Created by MaTooSens on 09/03/2024.
//

import Utilities
import SwiftUI

public struct CoinModel: Identifiable, Decodable, Equatable {
    public let id, symbol, name: String
    public let image: String
    public let currentPrice: Double?
    public let marketCap, marketCapRank: Int?
    public let fullyDilutedValuation: Double?
    public let totalVolume, high24H, low24H: Double?
    public let priceChange24H, priceChangePercentage24H: Double?
    public let marketCapChange24H: Double?
    public let marketCapChangePercentage24H: Double?
    public let circulatingSupply, totalSupply, maxSupply, ath: Double?
    public let athChangePercentage: Double?
    public let athDate: String?
    public let atl, atlChangePercentage: Double?
    public let atlDate: String?
    public let lastUpdated: String?
    public let sparklineIn7D: SparklineIn7D?
    public let priceChangePercentageInCurrency: Double?
    
    public var currentPriceString: String { currentPrice?.asCurrencyWithDecimals() ?? "N/A" }
    
    public init(
        id: String,
        symbol: String,
        name: String,
        image: String,
        currentPrice: Double?,
        marketCap: Int?,
        marketCapRank: Int?,
        fullyDilutedValuation: Double?,
        totalVolume: Double?,
        high24H: Double?,
        low24H: Double?,
        priceChange24H: Double?,
        priceChangePercentage24H: Double?,
        marketCapChange24H: Double?,
        marketCapChangePercentage24H: Double?,
        circulatingSupply: Double?,
        totalSupply: Double?,
        maxSupply: Double?,
        ath: Double?,
        athChangePercentage: Double?,
        athDate: String?,
        atl: Double?,
        atlChangePercentage: Double?,
        atlDate: String?,
        lastUpdated: String?,
        sparklineIn7D: SparklineIn7D?,
        priceChangePercentageInCurrency: Double?
    ) {
        self.id = id
        self.symbol = symbol
        self.name = name
        self.image = image
        self.currentPrice = currentPrice
        self.marketCap = marketCap
        self.marketCapRank = marketCapRank
        self.fullyDilutedValuation = fullyDilutedValuation
        self.totalVolume = totalVolume
        self.high24H = high24H
        self.low24H = low24H
        self.priceChange24H = priceChange24H
        self.priceChangePercentage24H = priceChangePercentage24H
        self.marketCapChange24H = marketCapChange24H
        self.marketCapChangePercentage24H = marketCapChangePercentage24H
        self.circulatingSupply = circulatingSupply
        self.totalSupply = totalSupply
        self.maxSupply = maxSupply
        self.ath = ath
        self.athChangePercentage = athChangePercentage
        self.athDate = athDate
        self.atl = atl
        self.atlChangePercentage = atlChangePercentage
        self.atlDate = atlDate
        self.lastUpdated = lastUpdated
        self.sparklineIn7D = sparklineIn7D
        self.priceChangePercentageInCurrency = priceChangePercentageInCurrency
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case name
        case image
        case currentPrice
        case marketCap
        case marketCapRank
        case fullyDilutedValuation
        case totalVolume
        case high24H
        case low24H
        case priceChange24H
        case priceChangePercentage24H
        case marketCapChange24H
        case marketCapChangePercentage24H
        case circulatingSupply
        case totalSupply
        case maxSupply
        case ath
        case athChangePercentage
        case athDate
        case atl
        case atlChangePercentage
        case atlDate
        case lastUpdated
        case sparklineIn7D
        case priceChangePercentageInCurrency
        case priceChangePercentage1HInCurrency
        case priceChangePercentage24HInCurrency
        case priceChangePercentage7DInCurrency
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.symbol = try container.decode(String.self, forKey: .symbol)
        self.name = try container.decode(String.self, forKey: .name)
        self.image = try container.decode(String.self, forKey: .image)
        self.currentPrice = try container.decodeIfPresent(Double.self, forKey: .currentPrice)
        self.marketCap = try container.decodeIfPresent(Int.self, forKey: .marketCap)
        self.marketCapRank = try container.decodeIfPresent(Int.self, forKey: .marketCapRank)
        self.fullyDilutedValuation = try container.decodeIfPresent(Double.self, forKey: .fullyDilutedValuation)
        self.totalVolume = try container.decodeIfPresent(Double.self, forKey: .totalVolume)
        self.high24H = try container.decodeIfPresent(Double.self, forKey: .high24H)
        self.low24H = try container.decodeIfPresent(Double.self, forKey: .low24H)
        self.priceChange24H = try container.decodeIfPresent(Double.self, forKey: .priceChange24H)
        self.priceChangePercentage24H = try container.decodeIfPresent(Double.self, forKey: .priceChangePercentage24H)
        self.marketCapChange24H = try container.decodeIfPresent(Double.self, forKey: .marketCapChange24H)
        self.marketCapChangePercentage24H = try container.decodeIfPresent(Double.self, forKey: .marketCapChangePercentage24H)
        self.circulatingSupply = try container.decodeIfPresent(Double.self, forKey: .circulatingSupply)
        self.totalSupply = try container.decodeIfPresent(Double.self, forKey: .totalSupply)
        self.maxSupply = try container.decodeIfPresent(Double.self, forKey: .maxSupply)
        self.ath = try container.decodeIfPresent(Double.self, forKey: .ath)
        self.athChangePercentage = try container.decodeIfPresent(Double.self, forKey: .athChangePercentage)
        self.athDate = try container.decodeIfPresent(String.self, forKey: .athDate)
        self.atl = try container.decodeIfPresent(Double.self, forKey: .atl)
        self.atlChangePercentage = try container.decodeIfPresent(Double.self, forKey: .atlChangePercentage)
        self.atlDate = try container.decodeIfPresent(String.self, forKey: .atlDate)
        self.lastUpdated = try container.decodeIfPresent(String.self, forKey: .lastUpdated)
        self.sparklineIn7D = try container.decodeIfPresent(SparklineIn7D.self, forKey: .sparklineIn7D)
        self.priceChangePercentageInCurrency = try container.decodeIfPresent(Double.self, forKey: .priceChangePercentage1HInCurrency)
                   ?? container.decodeIfPresent(Double.self, forKey: .priceChangePercentage24HInCurrency)
                   ?? container.decodeIfPresent(Double.self, forKey: .priceChangePercentage7DInCurrency)
    }
}

public struct SparklineIn7D: Codable, Equatable {
    public let price: [Double]?
    
    public init(price: [Double]?) {
        self.price = price
    }
}

public extension CoinModel {
    static let mock = CoinModel(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
        currentPrice: 61408,
        marketCap: 1141731099010,
        marketCapRank: 1,
        fullyDilutedValuation: 1285385611303,
        totalVolume: 67190952980,
        high24H: 61712,
        low24H: 56220,
        priceChange24H: 3952.64,
        priceChangePercentage24H: 6.87944,
        marketCapChange24H: 72110681879,
        marketCapChangePercentage24H: 6.74171,
        circulatingSupply: 18653043,
        totalSupply: 21000000,
        maxSupply: 21000000,
        ath: 61712,
        athChangePercentage: -0.97589,
        athDate: "2021-03-13T20:49:26.606Z",
        atl: 67.81,
        atlChangePercentage: 90020.24075,
        atlDate: "2013-07-06T00:00:00.000Z",
        lastUpdated: "2021-03-13T23:18:10.268Z",
        sparklineIn7D: SparklineIn7D(price: [
            54019.26878317463,
            53718.060935791524,
            53677.12968669343,
            53848.3814432924,
            53561.593235320615,
            53456.0913723206,
            53888.97184353125,
            54796.37233913172,
            54593.507358383504,
            54582.558599307624,
            54635.7248282177,
            54772.612788430226,
            55192.54513921453,
            54878.11598538206,
            54513.95881205807,
            55013.68511841942,
            55145.89456844788,
            54718.37455337104,
            54954.0493828267,
            54910.13413954234,
            54778.58411728141,
            55027.87934987173,
            55473.0657777974,
            54997.291345118225,
            54991.81484262107,
            55395.61328972238,
            55530.513360661644,
            55344.4499292381,
            54889.00473869075,
            54844.521923521665,
            54710.03981625522,
            54135.005312343856,
            54278.51586384954,
            54255.871982023025,
            54346.240757736465,
            54405.90449526803,
            54909.51138548527,
            55169.3372715675,
            54810.85302834732,
            54696.044114623706,
            54332.39670114743,
            54815.81007775886,
            55013.53089568202,
            54856.867125138066,
            55090.76841223987,
            54524.41939124773,
            54864.068334250915,
            54462.38634298567,
            54810.6138506792,
            54763.5416402156,
            54621.36137575708,
            54513.628030530825,
            54356.00127005116,
            53755.786684715764,
            54024.540451750094,
            54385.912857981304,
            54399.67618552436,
            53991.52168768531,
            54683.32533920595,
            54449.31811384671,
            54409.102042970466,
            54370.86991701537,
            53731.669170540394,
            53645.37874343392,
            53841.45014070333,
            53078.52898275558,
            52881.63656182149,
            53010.25164880975,
            52936.11939761323,
            52937.55256563505,
            53413.673939003136,
            53395.17699522727,
            53596.70402266675,
            53456.22811013035,
            53483.547854166834,
            53574.40015717944,
            53681.336964452734,
            54101.59049997355,
            54318.29276391888,
            54511.25370785759,
            54332.08597577831,
            54577.323438764404,
            54477.276388342325,
            54289.676338302765,
            54218.42837403623,
            54802.18754896328,
            55985.49640087922,
            56756.316501699876,
            57210.138362768965,
            56805.27815017699,
            56682.3217648727,
            57043.194415417776,
            56912.77785094373,
            56786.15869001341,
            57003.56072100917,
            57166.66441986013,
            57828.511814425874,
            57727.41272216753,
            58721.7528896422,
            58167.84861375856,
            58180.50145658414,
            58115.72142404893,
            58058.65960870684,
            58105.84576135331,
            57815.47461888876,
            57555.387870015315,
            57506.06807298437,
            57474.98576430212,
            57943.629057843165,
            57864.43148371131,
            57518.884140001275,
            57500.77929481661,
            57368.69249425147,
            57544.96374659641,
            57642.48628971112,
            57610.310340523756,
            57801.707574342116,
            57764.18193058321,
            57403.375409342945,
            57669.860487076316,
            57812.96915967891,
            57504.33531773738,
            57444.43455289276,
            57671.75799990867,
            56629.776997674526,
            57009.09536225692,
            56974.39138798086,
            56874.43203673815,
            56652.77633376425,
            56530.179449555064,
            56387.95830875742,
            56992.622783818544,
            57181.09163589668,
            56908.09493826477,
            56902.91387334043,
            56924.327009138164,
            56636.44312948976,
            56649.998369848996,
            56825.95829302063,
            56860.281702323526,
            56917.55558938772,
            56927.31213741791,
            56754.810633329354,
            56433.44851800957,
            56600.74528738432,
            57453.29169375094,
            58130.78114831457,
            58070.47719600076,
            57930.49833482948,
            57787.23755822543,
            58021.66564986657,
            57899.998011485266,
            58833.861160841436,
            58789.11830069634,
            58491.11446437883,
            58493.58897378262,
            58757.30471138256,
            58554.84171574884,
            57839.05673758758,
            57992.34121354044,
            57699.960140573115,
            57771.20058181922,
            58080.643272295056,
            57831.48061892176,
            57430.1839517489,
            56969.140564644826,
            57154.57504790339,
            57336.828870254896

        ]),
        priceChangePercentageInCurrency: 3952.64
     )
}
