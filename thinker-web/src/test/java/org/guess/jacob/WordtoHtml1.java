package org.guess.jacob;

import com.jacob.com.*;
import com.jacob.activeX.*;

public class WordtoHtml1 {
	/**
	 * 文档转换函数
	 * 
	 * @param docfile
	 *            word文档的绝对路径加文件名(包含扩展名)
	 * @param htmlfile
	 *            转换后的html文件绝对路径和文件名(不含扩展名)
	 */
	public static void change(String docfile, String htmlfile) {
		ActiveXComponent app = new ActiveXComponent("Word.Application"); // 启动word
		try {
			app.setProperty("Visible", new Variant(false));
			// 设置word不可见
			Dispatch docs = app.getProperty("Documents").toDispatch();
			Object doc = Dispatch.invoke(
					docs,
					"Open",
					Dispatch.Method,
					new Object[] { docfile, new Variant(false),
							new Variant(true) }, new int[1]).toDispatch();
			// 打开word文件
			Dispatch.invoke((Dispatch)doc, "SaveAs", Dispatch.Method, new Object[] {
					htmlfile, new Variant(8) }, new int[1]);
			// 作为html格式保存到临时文件
			Variant f = new Variant(false);
			Dispatch.call((Dispatch) doc, "Close", f);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			app.invoke("Quit", new Variant[] {});
		}
	}

	public static void main(String[] strs) {
		WordtoHtml1.change("d:\\test\\test.docx", "d:\\test\\test");
	}
}
