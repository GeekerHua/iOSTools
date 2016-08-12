# iOSTools
iOS开发的自定义配置

- Xcode插件安装目录

    - ~/Library/Application Support/Developer/Shared/Xcode/Plug-ins/
- Xcode的个人代码块的保存位置

    - ~/Library/Developer/Xcode/UserData/CodeSnippets

- Xcode 文档安装路径
    - ~/资源库/Developer/Xcode/UserData/
    - /Applications/Xcode.app/Contents/Developer/Documentation/DocSets

- Xcode模拟器安装路径
    - /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs
    - /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Library/CoreSimulator/Profiles/Runtimes

- Xcode颜色主题路径
    - ~/Library/Developer/Xcode/UserData/FontAndColorThemes

- 证书Provisioning Profile 文件的路径
    - ~/Library/MobileDevice/Provisioning Profile


> - Xcode升级插件失效解决方法
    -  1.打开终端，输入以下代码获取到DVTPlugInCompatibilityUUID
        defaults read /Applications/Xcode.app/Contents/Info DVTPlugInCompatibilityUUID
    - 2.然后输入如下命令   【最后一项是获取到的DVTPlugInCompatibilityUUID】
     find ~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins -name Info.plist -maxdepth 3 | xargs -I{} defaults write {} DVTPlugInCompatibilityUUIDs -array-add 9F75337B-21B4-4ADC-B558-F9CADF7073A7