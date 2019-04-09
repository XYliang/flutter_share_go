package com.doglobal.flutter_share_go;

import android.app.Activity;
import android.content.Intent;
import android.text.TextUtils;

public class ShareHelper {

    public static final String CHANNEL_FACEBOOK_PKG_NAME = "com.facebook.katana";
    public static final String CHANNEL_TWITTER_PKG_NAME = "com.twitter.android";

    public static void shareMain(Activity activity, String shareText) {
        shareText(activity, null, null, shareText, null, "");
    }

    public static void shareTextToChannel(Activity activity,String pkgName, String shareText,
                                          String shareUrl) {
        if (PackageUtils.isPkgInstalled(activity, pkgName)) {
            shareText(activity, null, null, shareText, pkgName, shareUrl);
        } else {
            PackageUtils.goDownloadPage(activity, pkgName);
        }
    }

    /**
     * @param dlgTitle 选择弹框标题
     * @param subject  分享主题
     * @param shareText  分享内容
     */
    public static void shareText(Activity activity, String dlgTitle, String subject,
                                 String shareText, String pkgName, String shareUrl) {
        if (shareText == null || "".equals(shareText)) {
            return;
        }
        String content = shareText + ": " + shareUrl + " .";
        Intent intent = new Intent(Intent.ACTION_SEND);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        intent.setType("text/plain");
        if (!TextUtils.isEmpty(subject)) {
            intent.putExtra(Intent.EXTRA_SUBJECT, subject);
        }

        intent.putExtra(Intent.EXTRA_TEXT, content);

        if (!TextUtils.isEmpty(pkgName)) {
            intent.setPackage(pkgName);
        }

        // 设置弹出框标题
        if (TextUtils.isEmpty(dlgTitle)) { // 自定义标题
            Intent chooser = Intent.createChooser(intent, dlgTitle);
            chooser.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            activity.startActivity(chooser);
        } else { // 系统默认标题
            activity.startActivity(intent);
        }
    }

}
