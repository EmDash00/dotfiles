import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "EglFSDeviceIntegration"
    Depends { name: "Qt"; submodules: ["core", "gui", "core-private", "gui-private", "devicediscovery_support-private", "eventdispatcher_support-private", "service_support-private", "theme_support-private", "fontdatabase_support-private", "fb_support-private", "egl_support-private", "input_support-private", "platformcompositor_support-private"]}

    architectures: ["x86_64"]
    targetPlatform: "linux"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: ["", "/usr/lib/x86_64-linux-gnu/libgthread-2.0.so", "/usr/lib/x86_64-linux-gnu/libglib-2.0.so", "", "", "", "/usr/lib/x86_64-linux-gnu/libfontconfig.so", "/usr/lib/x86_64-linux-gnu/libfreetype.so", "/usr/lib/x86_64-linux-gnu/libz.so", "", "", "/usr/lib/x86_64-linux-gnu/libEGL.so", "/usr/lib/x86_64-linux-gnu/libXext.so", "/usr/lib/x86_64-linux-gnu/libX11.so", "/usr/lib/x86_64-linux-gnu/libm.so", "", "/usr/lib/x86_64-linux-gnu/libmtdev.so", "/usr/lib/x86_64-linux-gnu/libinput.so", "/usr/lib/x86_64-linux-gnu/libxkbcommon.so", "", "/usr/lib/x86_64-linux-gnu/libGL.so", "", "/lib/x86_64-linux-gnu/libudev.so", "/usr/lib/x86_64-linux-gnu/libdl.so"]
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5EglFSDeviceIntegration"
    libNameForLinkerRelease: "Qt5EglFSDeviceIntegration"
    libFilePathDebug: ""
    libFilePathRelease: "/usr/lib/x86_64-linux-gnu/libQt5EglFSDeviceIntegration.so.5.12.2"
    cpp.defines: ["QT_EGLFSDEVICEINTEGRATION_LIB"]
    cpp.includePaths: ["/usr/include/x86_64-linux-gnu/qt5", "/usr/include/x86_64-linux-gnu/qt5/QtEglFSDeviceIntegration", "/usr/include/x86_64-linux-gnu/qt5/QtEglFSDeviceIntegration/5.12.2", "/usr/include/x86_64-linux-gnu/qt5/QtEglFSDeviceIntegration/5.12.2/QtEglFSDeviceIntegration"]
    cpp.libraryPaths: []
    Group {
        files: [Qt["eglfsdeviceintegration-private"].libFilePath]
        filesAreTargets: true
        fileTags: ["dynamiclibrary"]
    }
}
