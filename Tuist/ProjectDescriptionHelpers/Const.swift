import ProjectDescription

public enum Const {
  
  // MARK: - Bundle Id
  
  public static let appBundleId = "com.tellingUs.tellingMe"
  
  public static let appCoreKitBundleId = "com.tellingUs.tellingMe.appcore"
  public static let appCoreEntityBundleId = "com.tellingUs.tellingMe.appcore.entity"
  public static let appCoreNetworkingBundleId = "com.tellingUs.tellingMe.appcore.networking"
  public static let appCoreDatasourceBundleId = "com.tellingUs.tellingMe.appcore.datasource"
  public static let appCoreDesignSystemBundleId  = "com.tellingUs.tellingMe.appcore.designsystem"
  
  public static let sharedKitBundleId = "com.tellingUs.tellingMe.shared"
  public static let sharedUtilBundleId = "com.tellingUs.tellingMe.shared.util"
  
  public static let appFeatureRootSceneBundleId = "com.tellingUs.tellingMe.appfeature.rootscene"
  public static let appFeatureSplashSceneBundleId = "com.tellingUs.tellingMe.appfeature.splashscene"
  public static let appFeatureLoginSceneBundleId = "com.tellingUs.tellingMe.appfeature.loginscene"
  public static let appFeatureMainTabSceneBundleId = "com.tellingUs.tellingMe.appfeature.maintabscene"
  public static let appFeatureHomeSceneBundleId = "com.tellingUs.tellingMe.appfeature.homescene"
  public static let appFeatureMySpaceSceneBundleId = "com.tellingUs.tellingMe.appfeature.myspacescene"
  public static let appFeatureAllSpaceSceneBundleId = "com.tellingUs.tellingMe.appfeature.allspacescene"
  public static let appFeatureMyHomeSceneBundleId = "com.tellingUs.tellingMe.appfeature.myhomescene"
  public static let appFeatureEditAnswerSceneBundleId = "com.tellingUs.tellingMe.appfeature.editanswerscene"
  public static let appFeatureAlarmListSceneBundleId = "com.tellingUs.tellingMe.appfeature.alarmlistscene"
  public static let appFeatureAnswerListSceneBundleId = "com.tellingUs.tellingMe.appfeature.answerlistscene"
  public static let appFeatureAnswerDetailSceneBundleId = "com.tellingUs.tellingMe.appfeature.answerdetailscene"
  
  // MARK: - Minimum Target Version
  
  public static let minimumTargetVersion = "16.0"
  
  // MARK: - Source/Resource File Path
  
  public static let sourceFilePath: SourceFileGlob = "Sources/**"
  public static let resourceFilePath: ResourceFileElement = "Resources/**"
}
