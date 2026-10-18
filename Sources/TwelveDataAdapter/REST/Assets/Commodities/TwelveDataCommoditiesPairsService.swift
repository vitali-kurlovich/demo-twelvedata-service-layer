//
//  Created by Kurlovich Vitali on 10/5/26.
//

import DataLayer
import TwelveDataREST

nonisolated struct TwelveDataCommoditiesPairsService: AssetsService<CommoditiesPair>, AssetsPagesService<CommoditiesPair>, Sendable {
    let apiKeyService: any TwelveDataApiKeyService

    func fetch() async throws(FetchError) -> [CommoditiesPair] {
        do {
            let rest = TwelveDataREST(apiKey: apiKeyService.apiKey)

            let response = try await rest.commodities()
            return response.data.map { pair in
                CommoditiesPair(pair)
            }

        } catch {
            throw FetchError(error)
        }
    }

    func fetch(_ page: FetchPage) async throws(FetchError) -> AssetsPage<CommoditiesPair> {
        do {
            let rest = TwelveDataREST(apiKey: apiKeyService.apiKey)

            let response = try await rest.commodities(page: .init(page))

            let assets = response.data.map { pair in
                CommoditiesPair(pair)
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
