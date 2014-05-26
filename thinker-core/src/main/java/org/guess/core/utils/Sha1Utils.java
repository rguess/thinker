package org.guess.core.utils;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.security.MessageDigest;

/**
 * 获取String，InputStream，file的sha1值
 * @author guess
 *
 */
public class Sha1Utils {
	private static Sha1Utils instance = null;
	private static MessageDigest sha1 = null;

	private Sha1Utils() {
	};

	public static Sha1Utils getInstance() {
		try {
			if(instance ==null){
				instance = new Sha1Utils();
			}
			sha1 = MessageDigest.getInstance("sha1");
		} catch (Exception e) {
			return null;
		}
		return instance;
	}
	
	/**
	 * 获取字符串的sha1值
	 * @param source
	 * @return
	 */
	public String getStringHash(String source) {
		String hash = null;
		try {
			ByteArrayInputStream in = new ByteArrayInputStream(
					source.getBytes());
			hash = getStreamHash(in);
			in.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hash;
	}

	/**
	 * 获取文件的sha1值
	 * 
	 * @param file
	 * @return
	 */
	public String getFileHash(File file) {
		String hash = null;
		try {
			FileInputStream in = new FileInputStream(file);
			hash = getStreamHash(in);
			in.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hash;
	}

	/**
	 * 获取InputStream的sha1值
	 * 
	 * @param stream
	 * @return
	 */
	public String getStreamHash(InputStream stream) {
		String hash = null;
		byte[] buffer = new byte[1024];
		BufferedInputStream in = null;
		try {
			in = new BufferedInputStream(stream);
			int numRead = 0;
			while ((numRead = in.read(buffer)) > 0) {
				sha1.update(buffer, 0, numRead);
			}
			in.close();
			hash = toHexString(sha1.digest());
		} catch (Exception e) {
			if (in != null)
				try {
					in.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			e.printStackTrace();
		}
		return hash;
	}
	
	private String toHexString(byte[] b) {
		StringBuilder sb = new StringBuilder(b.length * 2);
		for (int i = 0; i < b.length; i++) {
			sb.append(hexChar[(b[i] & 0xf0) >>> 4]);
			sb.append(hexChar[b[i] & 0x0f]);
		}
		return sb.toString();
	}

	private char[] hexChar = { '0', '1', '2', '3', '4', '5', '6', '7', '8',
			'9', 'a', 'b', 'c', 'd', 'e', 'f' };

}