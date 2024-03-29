import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "Test"
    Depends { name: "Qt"; submodules: ["core"]}

    architectures: ["x86_64"]
    targetPlatform: "linux"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: []
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5Test"
    libNameForLinkerRelease: "Qt5Test"
    libFilePathDebug: ""
    libFilePathRelease: "/usr/lib/x86_64-linux-gnu/libQt5Test.so.5.12.2"
    cpp.defines: ["QT_TESTLIB_LIB"]
    cpp.includePaths: ["/usr/include/x86_64-linux-gnu/qt5", "/usr/include/x86_64-linux-gnu/qt5/QtTest"]
    cpp.libraryPaths: []
    Group {
        files: [Qt["testlib"].libFilePath]
        filesAreTargets: true
        fileTags: ["dynamiclibrary"]
    }
}
