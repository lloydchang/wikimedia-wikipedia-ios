import Foundation
import SwiftUI

public class WMFYearInReviewViewModel: ObservableObject {
    @Published var isFirstSlide = true
    let localizedStrings: LocalizedStrings
    var slides: [YearInReviewSlideContent]
    let username: String?

    weak var coordinatorDelegate: YearInReviewCoordinatorDelegate?

    public init(localizedStrings: LocalizedStrings, slides: [YearInReviewSlideContent], username: String?, coordinatorDelegate: YearInReviewCoordinatorDelegate?) {
        self.localizedStrings = localizedStrings
        self.slides = slides
        self.username = username
        self.coordinatorDelegate = coordinatorDelegate
    }

    public func getStarted() {
        isFirstSlide = false
    }

    public struct LocalizedStrings {
        let donateButtonTitle: String
        let doneButtonTitle: String
        let shareButtonTitle: String
        let nextButtonTitle: String
        let firstSlideTitle: String
        let firstSlideSubtitle: String
        let firstSlideCTA: String
        let firstSlideHide: String

        public init(donateButtonTitle: String, doneButtonTitle: String, shareButtonTitle: String, nextButtonTitle: String, firstSlideTitle: String, firstSlideSubtitle: String, firstSlideCTA: String, firstSlideHide: String) {
            self.donateButtonTitle = donateButtonTitle
            self.doneButtonTitle = doneButtonTitle
            self.shareButtonTitle = shareButtonTitle
            self.nextButtonTitle = nextButtonTitle
            self.firstSlideTitle = firstSlideTitle
            self.firstSlideSubtitle = firstSlideSubtitle
            self.firstSlideCTA = firstSlideCTA
            self.firstSlideHide = firstSlideHide
        }
    }

    func handleShare(for slide: Int) {
        coordinatorDelegate?.handleYearInReviewAction(.share)
    }

}

public struct YearInReviewSlideContent: SlideShowProtocol {
    public let imageName: String
    public let title: String
    let informationBubbleText: String?
    public let subtitle: String

    public init(imageName: String, title: String, informationBubbleText: String?, subtitle: String) {
        self.imageName = imageName
        self.title = title
        self.informationBubbleText = informationBubbleText
        self.subtitle = subtitle
    }
}

// temp - waiting for the donate action to be merged

public protocol YearInReviewCoordinatorDelegate: AnyObject {
    func handleYearInReviewAction(_ action: YearInReviewCoordinatorAction)
}

public enum YearInReviewCoordinatorAction {
    case share
}
