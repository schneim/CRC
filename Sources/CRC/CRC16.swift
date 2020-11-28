

import Foundation

struct CRC16 {
    
    var start:UInt16=0
    
    static let crcTable : Array<UInt16> = [
       0x0000, 0xCC01, 0xD801, 0x1400, 0xF001, 0x3C00, 0x2800, 0xE401,
       0xA001, 0x6C00, 0x7800, 0xB401, 0x5000, 0x9C01, 0x8801, 0x4400
    ]
    
    init(start:UInt16=0) {
        self.start = start
    }
    
    static func crc(data: Data, start:UInt16=0) -> UInt16 {
        
        var crc:UInt16 = start
        
        for byte in data {

            var temp = self.crcTable[Int(crc & 0xF)]
            crc = (crc >> 4) & 0x0FFF
            crc = crc ^ temp ^ crcTable[Int(byte & 0xF)]
            
            temp = self.crcTable[Int(crc & 0xF)]
            crc = (crc >> 4) & 0x0FFF
            crc = crc ^ temp ^ crcTable[Int((byte >> 4) & 0xF)]
            
        }
        return crc
    }    
}
