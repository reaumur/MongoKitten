// swift-tools-version:4.0
import PackageDescription

var package = Package(
    name: "MongoKitten",
    dependencies: [
        // For MongoDB Documents
        .package(url: "https://github.com/OpenKitten/BSON.git", .upToNextMajor(from: "5.0.0")),
        // For ExtendedJSON support
        .package(url: "https://github.com/OpenKitten/Cheetah.git", .upToNextMajor(from: "2.0.0")),
        // Authentication
        .package(url: "https://github.com/OpenKitten/CryptoKitten.git", .upToNextMajor(from: "0.2.0")),
        // Asynchronous behaviour
        .package(url: "https://github.com/OpenKitten/Schrodinger.git", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
      .target(
          name: "GeoJSON",
          dependencies: ["BSON", "Cheetah"]),
      .target(
          name: "ExtendedJSON",
          dependencies: ["BSON", "Cheetah", "CryptoKitten"]),
      .target(
          name: "MongoKitten",
          dependencies: ["BSON", "Cheetah", "GeoJSON", "ExtendedJSON", "CryptoKitten", "Schrodinger", "MongoSocket"])
    ]
)

// Provides Sockets + SSL
#if !os(macOS) && !os(iOS)
package.dependencies.append(.package(url: "https://github.com/OpenKitten/KittenCTLS.git", from: Version(1, 0, 0)))
#endif
