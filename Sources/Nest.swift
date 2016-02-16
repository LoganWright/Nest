/// Represents a HTTP Header, Key and Value
public typealias Header = (String, String)
public typealias Byte = UInt8

/// Represents a HTTP request or response body
public protocol PayloadType {
    /// Returns the next byte in the payload
    mutating func next() -> Byte?
}


/// Represents a HTTP Request
public protocol RequestType {
    var method:String { get }
    var path:String { get }
    var headers:[Header] { get }
    var body: PayloadType? { get }
}


/// Represents a HTTP Response
public protocol ResponseType {
    var statusLine:String { get }
    var headers:[Header] { get }
    var body: PayloadType? { get }
}

public typealias Application = RequestType -> ResponseType
