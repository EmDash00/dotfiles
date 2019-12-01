import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "EglFsKmsSupport"
    Depends { name: "Qt"; submodules: ["core", "gui"]}

    architectures: ["x86_64"]
    targetPlatform: "linux"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: ["/usr/lib/x86_64-linux-gnu/libQt5EglFSDeviceIntegration.so.5.12.2", "", "/usr/lib/x86_64-linux-gnu/libgthread-2.0.so", "/usr/lib/x86_64-linux-gnu/libglib-2.0.so", "", "", "", "/usr/lib/x86_64-linux-gnu/libfontconfig.so", "/usr/lib/x86_64-linux-gnu/libfreetype.so", "/usr/lib/x86_64-linux-gnu/libz.so", "", "", "/usr/lib/x86_64-linux-gnu/libEGL.so", "/usr/lib/x86_64-linux-gnu/libXext.so", "/usr/lib/x86_64-linux-gnu/libX11.so", "/usr/lib/x86_64-linux-gnu/libm.so", "", "/usr/lib/x86_64-linux-gnu/libmtdev.so", "/usr/lib/x86_64-linux-gnu/libinput.so", "/usr/lib/x86_64-linux-gnu/libxkbcommon.so", "", "", "dl", "/usr/lib/x86_64-linux-gnu/libGL.so", "", "/lib/x86_64-linux-gnu/libudev.so", "", "/usr/lib/x86_64-linux-gnu/libQt5DBus.so.5.12.2", "/usr/lib/x86_64-linux-gnu/libdrm.so", "/usr/lib/x86_64-linux-gnu/libdl.so"]
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5EglFsKmsSupport"
    libNameForLinkerRelease: "Qt5EglFsKmsSupport"
    libFilePathDebug: ""
    libFilePathRelease: "/usr/lib/x86_64-linux-gnu/libQt5EglFsKmsSupport.so.5.12.2"
    cpp.defines: ["QT_EGLFS_KMS_SUPPORT_LIB"]
    cpp.includePaths: []
    cpp.libraryPaths: []
    Group {
        files: [Qt["eglfs_kms_support-private"].libFilePath]
        filesAreTargets: true
        fileTags: ["dynamiclibrary"]
    }
}
