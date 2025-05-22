import Foundation
import RoutingKit

extension String {
    var pathSegments: [PathComponent] {
        if let components = URL(string: self)?.pathComponents {
            var pathSegments: [PathComponent] = []

            for component in components where component != "/" {
                pathSegments.append(PathComponent(stringLiteral: component))
            }

            return pathSegments
        } else {
            return self.pathComponents
        }
    }
    
    func pathSegments(excluding: String) -> [PathComponent] {
        if let components = URL(string: self)?.pathComponents {
            var pathSegments: [PathComponent] = []

            for component in components where component != "/" && component != excluding {
                pathSegments.append(PathComponent(stringLiteral: component))
            }

            return pathSegments
        } else {
            var mutableComponents =  self.pathComponents
            excludeCheck: for check in mutableComponents {
                if check.description == excluding {
                    if let index = mutableComponents.firstIndex(of: check) {
                        mutableComponents.remove(at: index)
                        break excludeCheck
                    }
                }
            }
            return mutableComponents
        }
    }
}
