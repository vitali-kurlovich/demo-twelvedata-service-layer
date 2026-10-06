//
//  Created by Kurlovich Vitali on 10/6/26.
//

import DataLayer

public struct TwelveDataServiceLocator: Sendable {
    public let apiKeyService: any TwelveDataApiKeyService

    let symbolPriceServiceImpl: TwelveDataSymbolPriceAdapter

    let forexServiceImpl: TwelveDataForexPairsService
    let cryptoServiceImpl: TwelveDataCryptoPairsService
    let stocksServiceImpl: TwelveDataStocksService
    let commoditiesPairsServiceImpl: TwelveDataCommoditiesPairsService

    public init(apiKeyService: any TwelveDataApiKeyService) {
        self.apiKeyService = apiKeyService
        symbolPriceServiceImpl = TwelveDataSymbolPriceAdapter(
            apiKeyService: apiKeyService
        )
        forexServiceImpl = TwelveDataForexPairsService(
            apiKeyService: apiKeyService
        )
        cryptoServiceImpl = TwelveDataCryptoPairsService(
            apiKeyService: apiKeyService
        )

        stocksServiceImpl = TwelveDataStocksService(
            apiKeyService: apiKeyService
        )

        commoditiesPairsServiceImpl = TwelveDataCommoditiesPairsService(
            apiKeyService: apiKeyService
        )
    }
}

public extension TwelveDataServiceLocator {
    var symbolPriceService: any SymbolPriceService {
        symbolPriceServiceImpl
    }

    var connectivityService: any ConnectivityService {
        symbolPriceServiceImpl
    }

    var forexService: any ForexPairsService {
        forexServiceImpl
    }

    var cryptoService: any CryptoPairsService {
        cryptoServiceImpl
    }

    var stockService: any StocksService {
        stocksServiceImpl
    }

    var commoditiesService: any CommoditiesPairsService {
        commoditiesPairsServiceImpl
    }
}
