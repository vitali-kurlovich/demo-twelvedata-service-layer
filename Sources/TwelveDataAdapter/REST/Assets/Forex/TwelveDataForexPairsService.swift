//
//  Created by Kurlovich Vitali on 10/4/26.
//

import DataLayer
import TwelveDataREST

nonisolated struct TwelveDataForexPairsService: AssetsService<ForexPair>, AssetsPagesService<ForexPair>, Sendable {
    let apiKeyService: any TwelveDataApiKeyService

    func fetch() async throws(FetchError) -> [ForexPair] {
        do {
            let rest = TwelveDataREST(apiKey: apiKeyService.apiKey)

            let response = try await rest.forexPairs()
            return response.data.map { pair in
                ForexPair(pair)
            }

        } catch {
            throw FetchError(error)
        }
    }

    func fetch(_ page: FetchPage) async throws(FetchError) -> AssetsPage<ForexPair> {
        do {
            let rest = TwelveDataREST(apiKey: apiKeyService.apiKey)

            let response = try await rest.forexPairs(page: .init(page))

            let assets = response.data.map { pair in
                ForexPair(pair)
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
