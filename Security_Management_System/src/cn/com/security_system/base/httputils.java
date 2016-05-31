package cn.com.security_system.base;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class httputils {
	public static String connctionURL_Params(String url, String method, String params) {
		StringBuffer bufferRes = new StringBuffer();
		url = url + params;
		try {
			URL realUrl = new URL(url);
			HttpURLConnection conn = (HttpURLConnection) realUrl.openConnection();
			// 请求方式
			conn.setRequestMethod(method);
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setUseCaches(false);
			conn.connect();

			InputStream in = conn.getInputStream();
			BufferedReader read = new BufferedReader(new InputStreamReader(in, "gb2312"));
			String valueString = null;
			while ((valueString = read.readLine()) != null) {
				bufferRes.append(valueString);
			}
			read.close();
			in.close();
			in = null;
			if (conn != null) {
				// 关闭连接
				conn.disconnect();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bufferRes.toString();
	}
}
