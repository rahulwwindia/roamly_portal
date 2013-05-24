package com.roamly.ws;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Properties;
import javax.servlet.jsp.jstl.core.Config;
import org.json.JSONException;
 
public class WsUrl {

	public String getWsUrl(String key) {
		Properties prop = new Properties();
		java.net.URL url = Config.class.getClassLoader().getResource(
				"messages_ws_url.properties");
		try { 
			prop.load(url.openStream());

		} catch (Exception e) {
			System.out.println(e);
		}
		return prop.getProperty(key);
	}

	public static String readJsonFromUrl(String url) throws IOException,
			JSONException {
		URL u = new URL(url);

		HttpURLConnection c = (HttpURLConnection) u.openConnection();
		c.connect();
		BufferedReader br = new BufferedReader(new InputStreamReader(
				c.getInputStream()));
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = br.readLine()) != null) {
			sb.append(line + "\n");
		}
		br.close();
		return sb.toString();
	}

}
