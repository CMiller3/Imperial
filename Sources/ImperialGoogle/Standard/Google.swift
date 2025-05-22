@_exported import ImperialCore
import Vapor

public struct Google: FederatedServiceRespectingGroups {
    @discardableResult
    public init(
        routes: some RoutesBuilder,
        ignoreSegment: String?,
        authenticate: String,
        authenticateCallback: (@Sendable (Request) async throws -> Void)?,
        callback: String,
        scope: [String] = [],
        completion: @escaping @Sendable (Request, String) async throws -> some AsyncResponseEncodable
    ) throws {
        try GoogleRouter(callback: callback, scope: scope, completion: completion)
            .configureRoutes(withAuthURL: authenticate, ignoreSegment: ignoreSegment, authenticateCallback: authenticateCallback, on: routes)
    }
}
