// # Proxy Compiler 18.9.6-f57fd3-20190124

import Foundation
import SAPOData

internal class ParkingMetadataParser {
    internal static let options: Int = (CSDLOption.allowCaseConflicts | CSDLOption.disableFacetWarnings | CSDLOption.disableNameValidation | CSDLOption.processMixedVersions | CSDLOption.retainOriginalText | CSDLOption.ignoreUndefinedTerms)

    internal static let parsed: CSDLDocument = ParkingMetadataParser.parse()

    static func parse() -> CSDLDocument {
        let parser: CSDLParser = CSDLParser()
        parser.logWarnings = false
        parser.csdlOptions = ParkingMetadataParser.options
        let metadata: CSDLDocument = parser.parseInProxy(ParkingMetadataText.xml, url: "kaust.services.parking")
        metadata.proxyVersion = "18.9.6-f57fd3-20190124"
        return metadata
    }
}
