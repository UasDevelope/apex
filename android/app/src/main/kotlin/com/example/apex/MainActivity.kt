import android.content.pm.PackageManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.apex.app/info"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "getAppVersion") {
                try {
                    val packageInfo = packageManager.getPackageInfo(packageName, 0)
                    val version = packageInfo.versionName
                    result.success(version)
                } catch (e: PackageManager.NameNotFoundException) {
                    result.error("UNAVAILABLE", "Package info not found", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }
}