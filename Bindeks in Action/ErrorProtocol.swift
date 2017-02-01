
protocol ErrorProtocol: Error {
    var statusCode: Int { get }
    var description: String { get }
}
