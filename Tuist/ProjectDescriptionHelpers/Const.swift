import ProjectDescription

public enum Const {
  
  // MARK: - Bundle Id
  
  public static let appBundleId = "com.tellingUs.tellingMe"
  public static let appCoreBundleId = "com.tellingUs.tellingMe.appcore"
  public static let sharedBundleId = "com.tellingUs.tellingMe.shared"
  public static let appFeatureBundleId = "com.tellingUs.tellingMe.appfeature"
  
  // MARK: - Minimum Target Version
  
  public static let minimumTargetVersion = "16.0"
  
  // MARK: - Source/Resource File Path
  
  public static let sourceFilePath: SourceFileGlob = "Sources/**"
  public static let resourceFilePath: ResourceFileElement = "Resources/**"
}
