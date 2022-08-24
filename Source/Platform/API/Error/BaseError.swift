//
//  BaseError.swift

enum BaseError: Error {
    case networkError
    case httpError(httpCode: Int)
    case unexpectedError
    case urlError
    
    struct Errors {
        static let networkError = "Network Error"
        static let error = "Error"
        static let unexpectedError = "Unexpected Error"
        static let unexpectedHTTP = "Server responded with unexpected HTTP"
        static let serverLimited  = "Server limited client with response"
        static let serverRejected = "Server rejected payload with HTTP"
        static let urlError = "HTTP error"
    }
    
    public var errorMessage: String? {
        switch self {
        case .networkError:
            return Errors.networkError
        case .httpError(let code):
            return getHttpErrorMessage(httpCode: code)
        case .urlError:
            return Errors.urlError
        default:
            return Errors.unexpectedError
        }
    }
    
    private func getHttpErrorMessage(httpCode: Int) -> String? {
        switch httpCode {
        case 300..<400:
            return Errors.unexpectedHTTP
        case 429:
            return Errors.serverLimited
        default:
            return Errors.serverRejected
        }
    }
}
