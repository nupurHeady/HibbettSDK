//
//  BusinessConstants.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 7/7/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

// swiftlint:disable line_length
/// Constants.
public enum BusinessConstants {
    /// Minimum length of Hibbett Rewards Number
    public static let minimumRewardsNumberLength = 10

    /// The maximum number of a specific product selectable in a user's bag.
    public static let maxSelectableItemQuantity = 10

    /// The maximum number of a specific product selecteable if it's restricted quantity.
    public static let restrictedItemQuantity = 1

    /// Page size for pagination on Category views.
    public static let categoryPageSize = 24

    /// Page size for pagination on also Available products
    public static let alsoAvailablePageSize = 4

    /// Bazaarvoice curations groups.
    public static let bazaarvoiceCurationsGroups = ["meta-pdp", "instagram", "custom"]

    /// The customer support phone number.
    public static let customerSupportPhoneNumber = "1-844-362-4422"

    public static let timeInfo = "90 mins"

    /// The online raffle store id
    public static let onlineRaffleStoreId = 96

    /// Dropship number for Nike Store.
    public static let NikeDropshipVendorNumber = 29333

    /// Duration for launch screen video
    public static let launchScreenDurationSeconds = 5

    /// Locale Identifier
    public enum LocaleIdentifier {
        public static let enUSLocaleIdentifier = "en_US"
    }

    /// Minimum length of Orders per page
    public static let ordersPerPage = 6

    /// Platform identifier.
    public static let platform = "iOS"

    public enum URLConstants {
        public static let baseHibbettURL = "https://www.hibbett.com"

        public static let baseURLProduction = "https://hibbett-mobileapi.prolific.io"
        public static let baseURLStaging = "https://it3.hibbettdev.prolific.io"
        public static let baseURLDev = "https://it4.hibbettdev.prolific.io"
        public static let baseURLFeature = "https://ab9umr3ua9.execute-api.us-east-1.amazonaws.com/hibbett-load-test"
        public static let baseURLMock = "http://34.238.138.219:3000"

        public static let baseRadialURLStaging = "https://tst.payments.radial.com"
        public static let baseRadialURLProduction = "https://hostedpayments.radial.com"
        public static let hibbettDownloadURL = "https://hibbett.app.link/tab_shop"

        public static let baseSiteVibesURLDev = "https://dev.sitevibes.com/api"
        public static let baseSiteVibesURLProduction = "https://api.sitevibes.com"

        public static let baseNarvarTrackingURLDev = "https://ws-st01.narvar.qa/api/v1"
        public static let baseNarvarTrackingURLProduction = "https://ws.narvar.com/api/v1"

        /// The URL for the Hibbett Sports app on the App Store.
        ///
        /// - Returns: The App Store URL.
        public static func appStoreURL() -> URL? {
            return URL(string: "https://itunes.apple.com/us/app/hibbett-sports/id1325232713?mt=8")
        }

        /// Find Rewards Number URL for environment.
        ///
        /// - Returns: Find Rewards Number URL.
        public static func findRewardsNumberURL() -> URL? {
            return URL(string: "https://www.hibbett.com/on/demandware.store/Sites-Hibbett-US-Site/default/Relate-FindRewardNumberAJAX")
        }

        /// Privacy Policy URL for environment.
        ///
        /// - Returns: Privacy Policy URL.
        public static func privacyPolicyURL() -> URL? {
            return URL(string: "https://www.hibbett.com/privacy-security/privacy-policy.html?sourcepath=consumerapp")
        }

        /// Privacy Policy URL for environment.
        ///
        /// - Returns: Privacy Policy URL.
        public static func arbritationPrivacyPolicyURL() -> URL? {
            return URL(string: "https://www.hibbett.com/privacy-policy-hibbett-city-gear.html?sourcepath=consumerapp")
        }

        /// Signup - Privacy Policy URL for environment.
        ///
        /// - Returns: Privacy Policy URL.
        public static func signupPrivacyPolicyURL() -> URL? {
            return URL(string: "https://www.hibbett.com/help/legal/privacy-policy.html?sourcepath=consumerapp")
        }

        /// Signup - Terms & Conditions URL for environment.
        ///
        /// - Returns: Terms & Conditions URL.
        public static func signupTermsAndConditionsURL() -> URL? {
            return URL(string: "https://www.hibbett.com/customer-service/terms/terms-conditions.html?sourcepath=consumerapp")
        }

        /// Rewards Terms and Conditions URL for environment.
        ///
        /// - Returns: Rewards Terms and Conditions URL URL.
        public static func rewardsTermsAndConditionsURL() -> URL? {
            return URL(string: "https://www.hibbett.com/hibbett-rewards-terms-conditions.html?sourcepath=consumerapp")
        }

        /// Privacy Web Form URL for environment.
        ///
        /// - Returns: Privacy Web Form URL.
        public static func privacyWebForm() -> URL? {
            return URL(string: "https://privacyportal.onetrust.com/webform/aad6f6b7-b53e-48b4-b1c6-e320de8136af/8946eb8a-ab24-4705-a725-c0d1e72b3493")
        }

        /// Terms & Conditions URL for environment.
        ///
        /// - Returns: Terms & Conditions URL.
        public static func termsAndConditionsForRestrictionsQuantityURL() -> URL? {
            return URL(string: "https://www.hibbett.com/customer-service/terms/terms-conditions.html?sourcepath=consumerapp")
        }

        /// Terms & Conditions URL for environment.
        ///
        /// - Returns: Terms & Conditions URL.
        public static func termsAndConditionsURL() -> URL? {
            return URL(string: "https://www.hibbett.com/terms/terms-conditions.html?sourcepath=consumerapp")
        }

        /// California Disclosures URL for environment.
        ///
        /// - Returns: California Disclosures URL.
        public static func californiaDisclosuresURL() -> URL? {
            return URL(string: "https://www.hibbett.com/help/ca-disclosures-accordion.html?sourcepath=consumerapp")
        }

        /// Accessibility URL for environment.
        ///
        /// - Returns: Accessibility URL.
        public static func accessibilityURL() -> URL? {
            return URL(string: "https://www.hibbett.com/hibbett-website-accessibility.html?sourcepath=consumerapp")
        }

        /// Accessibility URL for environment.
        ///
        /// - Returns: Accessibility URL.
        public static func yourPrivacyChoicesURL() -> URL? {
            return URL(string: "https://www.hibbett.com/cookieprivacypage.html?sourcepath=consumerapp")
        }

        /// Loyalty Terms & Conditions URL.
        ///
        /// - Returns: Loyalty Terms & Conditions URL.
        public static func loyaltyTermsAndConditionsURL() -> URL? {
            return URL(string: "https://www.hibbett.com/hibbett-rewards-terms.html?sourcepath=consumerapp")
        }

        /// Loyalty Add to wallet URL.
        ///
        /// - Returns: Loyalty Add to wallet URL.
        public static func loyaltyAddToWalletURL(for cardNumber: String, _ customerName: String) -> URL? {
            return URL(string: String(format: "https://mp.vibescm.com/c/h7118h?uuid=%@&data[first_name]=%@&data[rewards_id]=%@&data[source]=app", cardNumber, customerName, cardNumber))
        }

        /// Loyalty FAQ URL.
        ///
        /// - Returns: Loyalty FAQ URL.
        public static func loyaltyFAQURL() -> URL? {
            return URL(string: "https://www.hibbett.com/hibbett-rewards-faqs.html?sourcepath=consumerapp")
        }

        /// Loyalty MVP/VIP info URL.
        ///
        /// - Returns: Loyalty MVP/VIP info URL.
        public static func loyaltyInfoURL() -> URL? {
            return URL(string: "https://www.hibbett.com/register?sourcepath=consumerapp")
        }

        /// The shipping details page URL.
        ///
        /// - Returns: The shipping details URL.
        public static func shippingDetailsURL() -> URL? {
            return URL(string: "https://www.hibbett.com/ship-to-home.html?sourcepath=consumerapp")
        }

        /// The return policy page URL.
        ///
        /// - Returns: The return policy URL.
        public static func returnPolicyURL() -> URL? {
            return URL(string: "https://www.hibbett.com/help/hibbett-sports-return-policy.html?sourcepath=consumerapp")
        }

        /// The return policy page URL.
        ///
        /// - Returns: The return policy URL.
        public static func agreementURL() -> URL? {
            return URL(string: "https://www.hibbett.com/help/legal/Buy+Online+Pick+Up+In+Store+Reserve+Online+Pick+Up+In+Store+Alerts+Terms.html")
        }

        /// The return policy page URL.
        ///
        /// - Returns: The return policy URL.
        public static func marketingURL() -> URL? {
            return URL(string: "https://www.hibbett.com/mobile-alerts-terms.html?sourcepath=consumerapp")
        }

        /// The Our Story page URL.
        ///
        /// - Returns: The Our Stort URL.
        public static func ourStoryURL() -> URL? {
            return URL(string: "https://www.hibbett.com/about-us-timeline.html?sourcepath=consumerapp")
        }

        /// The Hibbett Blog page URL.
        ///
        /// - Returns: The Hibbett Blog URL.
        public static func hibbettBlogURL() -> URL? {
            return URL(string: "https://www.hibbett.com/blog?sourcepath=consumerapp")
        }

        /// The philanthropy page URL.
        ///
        /// - Returns: The philanthropy URL.
        public static func philanthropyURL() -> URL? {
            return URL(string: "https://www.hibbett.com/philanthropy-hibbett.html?sourcepath=consumerapp")
        }

        /// The investor relations page URL.
        ///
        /// - Returns: The investor relations URL.
        public static func investorRelationURL() -> URL? {
            return URL(string: "https://www.hibbett.com/investor_relations?sourcepath=consumerapp")
        }

        /// The raffle terms and conditions page URL.
        ///
        /// - Returns: The raffle and conditions URL.
        public static func raffleTermsAndConditionsURL() -> URL? {
            return URL(string:
                "https://www.hibbett.com/help/legal/HIBBETT+SHOE+LAUNCH+RAFFLE+TERMS+AND+CONDITIONS.html?sourcepath=consumerapp")
        }

        /// The find a store page URL.
        ///
        /// - Returns: The find a store URL.
        public static func findStoreURL() -> URL? {
            return URL(string: "https://www.hibbett.com/stores?sourcepath=consumerapp")
        }

        /// The order history page URL.
        ///
        /// - Returns: The order history URL.
        public static func orderHistoryURL() -> URL? {
            return URL(string: "https://www.hibbett.com/orders?sourcepath=consumerapp")
        }

        /// The work at hibbett page URL.
        ///
        /// - Returns: The work at hibbett URL.
        public static func workAtHibbettURL() -> URL? {
            return URL(string: "https://www.hibbett.com/corporate/careers-hibbett-citygear.html?sourcepath=consumerapp")
        }

        /// The customer help FAQ page URL.
        ///
        /// - Returns: The customer help FAQ URL.
        public static func customerHelpURL() -> URL? {
            return URL(string: "https://www.hibbett.com/help?sourcepath=consumerapp")
        }

        /// The customer help center page URL.
        ///
        /// - Returns: The customer help center URL.
        public static func customerHelpCenterURL() -> URL? {
            return URL(string: "https://www.hibbett.com/customer-service-help-menu.html?sourcepath=consumerapp")
        }

        /// The customer support chat bot page URL.
        ///
        /// - Returns: The customer support chat bot page URL.
        public static func customerSupportChatBotURL() -> URL? {
            return URL(string: "https://www.hibbett.com/app-chatbot?sourcepath=consumerapp")
        }

        /// The contact by email page URL.
        ///
        /// - Returns: The contact by email URL.
        public static func contactByEmailURL() -> URL? {
            return URL(string: "https://www.hibbett.com/contactus?sourcepath=consumerapp")
        }

        /// The reset password page URL.
        ///
        /// - Returns: The reset password URL.
        public static func resetPasswordURL() -> URL? {
            return URL(string: "https://www.hibbett.com/reset-password?sourcepath=consumerapp")
        }

        /// The raffle terms and conditions page URL.
        ///
        /// - Returns: The raffle and conditions URL.
        public static func paymentAndForfeitPolicyURL() -> URL? {
            return URL(string:
                "https://www.hibbett.com/rafflealertterms?sourcepath=consumerapp")
        }

        /// The raffle shoes launch termspage URL.
        ///
        /// - Returns: The raffle shoes launch conditions URL.
        public static func shoeLaunchRaffleTermsURL() -> URL? {
            return URL(string:
                "https://www.hibbett.com/help/legal/Hibbett-Shoe-Launch-Raffle-Terms.html?sourcepath=consumerapp")
        }

        /// The raffle rules terms and conditions page URL.
        ///
        /// - Returns: The raffle rules terms and conditions URL.
        public static func raffleRulesTermsURL() -> URL? {
            return URL(string: "https://www.hibbett.com/help/legal/Hibbett-Shoe-Launch-Raffle-Terms.html?sourcepath=consumerapp")
        }

        // Nike Landing page FAQs URLs

        public static let baseNikeURL = "https://www.nike.com"
        public static let hibbettRegisterURL = "https://www.hibbett.com/register"
        public static let nikeMembershipURL = "https://www.nike.com/membership"
        public static let hibbettRewardsMissingPointsURL = "https://www.hibbett.com/hibbett-rewards-missing-points-nav06-decor-leftnav-customer-support.html"
    }

    /// Hibbett default values for API requests.
    public enum APIDefaults {
        public static let creditCardPaymentType = "CREDIT_CARD"
        public static let klarnaPaymentType = "KLARNA"
        public static let forceClearKlarna = "ForceClearKlarna"
        public static let loyaltyAwardAdjustmentIdentifier = "award"
        public static let promoCodeAdjustmentIdentifier = "coupon"
        public static let globalPromotionAdjustmentIdentifier = "discount"
        public static let allCategoriesCategoryID = "all-categories"
        public static let storeLocatorDistanceUnit = "mi"
        public static let storeLocatorMaxDistance = "200"
        public static let unitedStatesIdentifier = "US"
        public static let unitedStatesCurrencyIdentifier = "USD"
        public static let mobileOnlyFilterIdentifier = "c_isHideOCAPI"
        public static let mobileOnlyFilterQuery = "\(mobileOnlyFilterIdentifier)=false"

        public enum ErrorCodes {
            public static let invalidToken = 12000
            public static let loginFailed = 12003
            public static let accountSyncRequired = 12032
            public static let basketIDNotFound = 13002
            public static let basketQuotaExceeded = 13025
            public static let invalidOTP = 11060
            public static let invalidEmailNonOverridable = 12029
            public static let invalidPhoneNonOverridable = 12038
            public static let incorrectOTP = 12039
            public static let invalidEmailOverridable = 12929
            public static let invalidPhoneOverridable = 12938
            public static let paymentFailureStartCode = 13017
            public static let paymentFailureEndCode = 13022
            public static let invalidCVVErrorCode = 13017
            public static let sameItemAvailableInWishlist = 13106
            public static let invalidPhoneShippingHardOverridable = 12048
            public static let invalidPhoneShippingSoftOverridable = 12948
            public static let invalidPhoneBillingHardOverridable = 12049
            public static let invalidPhoneBillingSoftOverridable = 12949
            public static let bagProductNotAvailable = 13067
            public static let bagProductsNotAvailable = 13068
            public static let faceIDNotEnrolled = -7
            public static let productOutOfQuantityError = 13065
            public static let productsOutOfQuantityError = 13066
            public static let raffleNotFound = 11017
            public static let reRaffleClaimedBySelf = 11030
            public static let reRaffleAlreadyClaimedByOther = 11100
        }
    }

    /// Datatype holding constants pertaining to Syte implemention for Shop Similar feature.
    public enum SyteConstants {
        public static let accountId = "9465"
        public static let accountSignature = "621360c475ef95102a9d4b57"
        /// This is amongst the possible values mentioned by Syte.
        public static let shopSimilarButtonPlacement = "PDP-button"
    }

    public enum GlobalToggleKeys {
        public static let oneTapCheckoutEnabled = "oneTapCheckoutEnabled"
        public static let oneTrustEnabled = "oneTrustEnabled"
        public static let bopisRopisEnabled = "bopisRopisEnabled"
    }

    /// Hibbett Key Values for Deeplinks
    public enum Deeplink {
        public enum Key {
            /// Account Tab Key
            public static let accountTab = "account"
            public static let sort = "sort"
            public static let pmId = "pmid"
        }

        public enum Value {
            /// Registered Raffle Screen value for account key
            public static let registeredRaffle = "registeredRaffle"
        }
    }
}
