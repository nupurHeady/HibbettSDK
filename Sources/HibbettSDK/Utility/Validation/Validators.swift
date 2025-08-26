//
//  Validators.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 6/27/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// All validators available for Hibbett.
public struct Validators {

    // MARK: - Properties
    
    /// Credit card form validator.
    public let creditCardFormValidator: CreditCardFormValidator

    /// Credit card number validator.
    public let creditCardNumberValidator: CreditCardNumberValidator

    /// Email validator.
    public let emailValidator: EmailValidator

    /// Name validator.
    public let nameValidator: NameValidator

    /// Password validator.
    public let passwordValidator: SignupPasswordValidator

    /// Phone number validator.
    public let phoneNumberValidator: PhoneNumberValidator

    /// Zip code validator.
    public let zipCodeValidator: ZipCodeValidatorProtocol

    /// Rewards Number validator.
    public let rewardsNumberValidator: RewardsNumberValidator

    // MARK: - Init/Deinit

    /// Creates new instanec.
    public init() {
        let creditCardNumberValidator = CaishenCreditCardNumberValidator()
        
        self.creditCardNumberValidator = creditCardNumberValidator
        creditCardFormValidator = CreditCardFormValidator(creditCardNumberValidator: creditCardNumberValidator)
        emailValidator = EmailValidator()
        nameValidator = NameValidator()
        passwordValidator = SignupPasswordValidator()
        phoneNumberValidator = PhoneNumberValidator()
        zipCodeValidator = USZipCodeValidator()
        rewardsNumberValidator = RewardsNumberValidator()
    }

}
