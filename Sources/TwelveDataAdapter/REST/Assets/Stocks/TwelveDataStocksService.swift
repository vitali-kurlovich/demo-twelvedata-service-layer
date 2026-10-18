//
//  Created by Kurlovich Vitali on 10/5/26.
//

import DataLayer
import TwelveDataREST

struct TwelveDataStocksService: AssetsService<StockInstrument>, AssetsPagesService<StockInstrument>, Sendable {
    let apiKeyService: any TwelveDataApiKeyService

    func fetch() async throws(FetchError) -> [StockInstrument] {
        do {
            let rest = TwelveDataREST(apiKey: apiKeyService.apiKey)

            let response = try await rest.stocks()
            return response.data.map { pair in
                StockInstrument(pair)
            }

        } catch {
            throw FetchError(error)
        }
    }

    func fetch(_ page: FetchPage) async throws(FetchError) -> AssetsPage<StockInstrument> {
        do {
            let rest = TwelveDataREST(apiKey: apiKeyService.apiKey)

            let response = try await rest.stocks(page: .init(page))

            let assets = response.data.map { pair in
                StockInstrument(pair)
            }

            return AssetsPage(
                count: response.count,
                page: page.page,
                assets: assets
            )
        } catch {
            throw FetchError(error)
        }
    }
}
