import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "XcbQpa"
    Depends { name: "Qt"; submodules: ["core", "gui", "core-private", "gui-private", "service_support-private", "theme_support-private", "fontdatabase_support-private", "edid_support-private", "linuxaccessibility_support-private", "vulkan_support-private"]}

    architectures: ["x86_64"]
    targetPlatform: "linux"
    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: ["", "", "", "/usr/lib/x86_64-linux-gnu/libfontconfig.so", "/usr/lib/x86_64-linux-gnu/libfreetype.so", "/usr/lib/x86_64-linux-gnu/libz.so", "", "", "", "/usr/lib/x86_64-linux-gnu/libGL.so", "", "/usr/lib/x86_64-linux-gnu/libX11-xcb.so", "/usr/lib/x86_64-linux-gnu/libxcb-xinput.so", "/usr/lib/x86_64-linux-gnu/libxcb-icccm.so", "/usr/lib/x86_64-linux-gnu/libxcb-image.so", "/usr/lib/x86_64-linux-gnu/libxcb-shm.so", "/usr/lib/x86_64-linux-gnu/libxcb-keysyms.so", "/usr/lib/x86_64-linux-gnu/libxcb-randr.so", "/usr/lib/x86_64-linux-gnu/libxcb-render-util.so", "/usr/lib/x86_64-linux-gnu/libxcb-render.so", "/usr/lib/x86_64-linux-gnu/libxcb-shape.so", "/usr/lib/x86_64-linux-gnu/libxcb-sync.so", "/usr/lib/x86_64-linux-gnu/libxcb-xfixes.so", "/usr/lib/x86_64-linux-gnu/libxcb-xinerama.so", "/usr/lib/x86_64-linux-gnu/libxcb-xkb.so", "/usr/lib/x86_64-linux-gnu/libxcb.so", "/usr/lib/x86_64-linux-gnu/libXrender.so", "/usr/lib/x86_64-linux-gnu/libXext.so", "/usr/lib/x86_64-linux-gnu/libX11.so", "/usr/lib/x86_64-linux-gnu/libm.so", "/usr/lib/x86_64-linux-gnu/libSM.so", "/usr/lib/x86_64-linux-gnu/libICE.so", "/usr/lib/x86_64-linux-gnu/libxkbcommon-x11.so", "/usr/lib/x86_64-linux-gnu/libxkbcommon.so", "/usr/lib/x86_64-linux-gnu/libdl.so"]
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5XcbQpa"
    libNameForLinkerRelease: "Qt5XcbQpa"
    libFilePathDebug: ""
    libFilePathRelease: "/usr/lib/x86_64-linux-gnu/libQt5XcbQpa.so.5.12.2"
    cpp.defines: ["QT_XCB_QPA_LIB_LIB"]
    cpp.includePaths: []
    cpp.libraryPaths: []
    Group {
        files: [Qt["xcb_qpa_lib-private"].libFilePath]
        filesAreTargets: true
        fileTags: ["dynamiclibrary"]
    }
}
