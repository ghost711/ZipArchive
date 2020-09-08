// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

//let package = Package(
//    name: "SSZipArchive",
//    products: [
//        // Products define the executables and libraries produced by a package,
//        // and make them visible to other packages.
//        .library(name: "SSZipArchive", targets: ["SSZipArchive"]),
//    ],
//    dependencies: [
//        // Dependencies declare other packages that this package depends on.
//        // .package(url: /* package url */, from: "1.0.0"),
//    ],
//    targets: [
//        // Targets are the basic building blocks of a package. A target can
//        // define a module or a test suite. Targets can depend on other targets
//        // in this package, and on products in packages which this package
//        // depends on.
//        .target(name: "SSZipArchive", dependencies: [], path: "SSZipArchive",
//                publicHeadersPath: "SSZipArchive",
//                cSettings: [.define("SWIFT_PKG_MNGR")])
//        //.testTarget(name: "ZipArchiveTests", dependencies: ["ZipArchive"]),
//    ]
//)

/** Ref: https://github.com/ZipArchive/ZipArchive/pull/536/files */

let package = Package(
    name: "ZipArchive",
    platforms: [
        .iOS(.v9),
        .tvOS(.v9),
        .macOS(.v10_10),
        .watchOS(.v2),
    ],
    products: [
        .library(name: "ZipArchive", targets: ["ZipArchive"]),
    ],
    targets: [
        .target(
            name: "ZipArchive",
            path: "SSZipArchive", //publicHeadersPath: "SSZipArchive",
            cSettings: [
                .define("HAVE_INTTYPES_H"),
                .define("HAVE_PKCRYPT"),
                .define("HAVE_STDINT_H"),
                .define("HAVE_WZAES"),
                .define("HAVE_ZLIB"), .define("SWIFT_PKG_MNGR")
            ],
            linkerSettings: [
                .linkedLibrary("z"),
                .linkedLibrary("iconv"),
                .linkedFramework("Security"),
            ]
        )
    ]
)
