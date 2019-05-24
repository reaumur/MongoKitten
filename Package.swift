import PackageDescription

var package = Package(
    name: "MongoKitten",
    dependencies: [
        // For MongoDB Documents
        .Package(url: "https://github.com/OpenKitten/BSON.git", versions: Version(5, 2, 0) ..< Version(6, 0, 0)),

        // For ExtendedJSON support
        .Package(url: "https://github.com/OpenKitten/Cheetah.git", majorVersion: 2),

        // Authentication
        .Package(url: "https://github.com/OpenKitten/CryptoKitten.git", majorVersion: 0, minor: 2),

        // Asynchronous behaviour
        .Package(url: "https://github.com/OpenKitten/Schrodinger.git", majorVersion: 1),
    ],
    targets: [
        Target(name: "GeoJSON"),
        Target(name: "MongoSocket"),
        Target(name: "ExtendedJSON"),
        Target(name: "MongoKitten", dependencies: ["GeoJSON", "MongoSocket", "ExtendedJSON"])
    ]
)

// Provides Sockets + SSL
#if !os(macOS) && !os(iOS)
package.dependencies.append(.Package(url: "https://github.com/OpenKitten/KittenCTLS.git", majorVersion: 1))
#endif
