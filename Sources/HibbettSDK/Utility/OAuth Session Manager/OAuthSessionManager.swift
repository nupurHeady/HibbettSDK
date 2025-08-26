//
//  OAuthSessionManager.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 6/7/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import PCFSwift

/// OAuth Session manager
public final class OAuthSessionManager: SessionManager {
    
    /// State of session being managed, in context of session manager.
    ///
    /// - noSession: No session.
    /// - sessionIsActive: Session is not yet expired
    /// - sessionIsExpired: Sessionis expired.
    private enum SessionState {
        case noSession
        case sessionIsActive
        case sessionIsExpired
    }
    
    // MARK: - Properties
    
    /// Delegate.
    public weak var delegate: OAuthSessionManagerDelegate?
    
    /// Environent manager.
    public let environmentManager: HTTPEnvironmentManager
    
    /// HTTP client.
    public let httpClient: HTTPClient
    
    /// Persistence client.
    public let persistenceClient: Persistable?
    
    public var sessionHeaders: Headers {
        if let session = currentSession() {
            return ["Authorization": "Bearer \(session.token)"]
        } else {
            return [:]
        }
    }
    
    static private var isRetrievingSessionIdentifier = false
    static private var retrieveSessionIdentifierCompletions = [(Swift.Error?) -> Void]()
    
    // MARK: - Init
    
    /// Creates new instance with provided dependenceis.
    ///
    /// - Parameters:
    ///   - environmentManager: Environment manager.
    ///   - httpClient: HTTP client.
    ///   - persistenceClient: Persistence client.
    public init(environmentManager: HTTPEnvironmentManager,
                httpClient: HTTPClient,
                persistenceClient: Persistable) {
        self.environmentManager = environmentManager
        self.httpClient = httpClient
        self.persistenceClient = persistenceClient
    }
    
    // MARK: - Protocol conformance
    
    // MARK: SessionManager
    
    public func isSessionExpired() -> Bool {
        guard let session = currentSession() else {
            return true
        }
        
        return session.isExpired()
    }
    
    public func resetSession(request: HTTPRequest, completion: @escaping (Any?, Swift.Error?) -> Void) {
        switch sessionState() {
        case .sessionIsActive:
            perform(request: request, completion: completion)
        case .sessionIsExpired,
             .noSession:
            createNewSessionThenPerform(request: request, completion: completion)
        }
    }
    
    public func retrieveSessionIdentifier(completion: @escaping (Swift.Error?) -> Void) {
        guard !OAuthSessionManager.isRetrievingSessionIdentifier else {
            OAuthSessionManager.retrieveSessionIdentifierCompletions.append(completion)
            
            return
        }
        
        OAuthSessionManager.isRetrievingSessionIdentifier = true
        let request = guestRegistrationRequest()
        
        perform(request: request) { [weak self] (response, error) in
            guard OAuthSessionManager.isRetrievingSessionIdentifier else {
                return
            }
            
            self?.retrieveSessionIdentifierCompletion(response: response, error: error, completion: { error in
                completion(error)
                OAuthSessionManager.retrieveSessionIdentifierCompletions.forEach({ completion in
                    completion(error)
                })
                OAuthSessionManager.retrieveSessionIdentifierCompletions = []
                
                OAuthSessionManager.isRetrievingSessionIdentifier = false
            })
        }
    }
    
    // MARK: - Instance functions
    
    // MARK: Private Functions
    
    private func currentSession() -> OAuthSession? {
        return delegate?.savedSession()
    }
    
    private func hasExistingSession() -> Bool {
        return currentSession() != nil
    }
    
    private func sessionState() -> SessionState {
        if hasExistingSession() {
            switch currentSession()!.state {
            case .active:
                return .sessionIsActive
            case .expired:
                return .sessionIsExpired
            }
        } else {
            return .noSession
        }
    }
    
    private func createNewSessionThenPerform(request: HTTPRequest, completion: @escaping (Any?, Swift.Error?) -> Void) {
        retrieveSessionIdentifier { [weak self] error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            self?.perform(request: request, completion: completion)
        }
    }
    
    private func guestRegistrationRequest() -> HTTPRequest {
        let path = "/users/guest"
        
        return HTTPRequest(method: .post,
                           baseURL: environmentManager.currentEnvironment.baseURL,
                           path: path,
                           queryItems: nil,
                           parameters: nil,
                           headers: nil)
    }
    
    private func perform(request: HTTPRequest,
                         completion: @escaping (_ response: HTTPResponse?, _ error: Swift.Error?) -> Void) {
        httpClient.perform(request: request) { (response, error) in
            if let error = error {
                completion(nil, error)
            } else if let response = response {
                completion(response, nil)
            } else {
                completion(nil, PCFError.invalidJSON)
            }
        }
    }
    
    private func retrieveSessionIdentifierCompletion(response: HTTPResponse?,
                                                     error: Swift.Error?,
                                                     completion: @escaping (Swift.Error?) -> Void) {
        if let error = error {
            completion(error)
            
            return
        }
        
        if let data = (response?.data) as? Data,
           let session = try? JSONDecoder().decode(OAuthSession.self, from: data) {
            delegate?.didCreateNewSession(session) { error in
                completion(error)
            }
        } else {
            completion(PCFError.invalidJSON)
        }
    }
    
}
