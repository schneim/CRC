import XCTest
@testable import CRC

final class CRCTests: XCTestCase {

    func testCRC16() {
        
        let message = Data(Array<UInt8>(arrayLiteral:0x12,0x34,0x56,0x78,0x9))
        XCTAssertEqual(CRC16.crc(data:message), 0x25B4)
    }
    
    static var allTests = [
        ("testCRC16", testCRC16),
    ]
}
