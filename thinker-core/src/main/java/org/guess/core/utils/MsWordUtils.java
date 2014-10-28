/*
package org.guess.core.utils;

import java.util.List;

import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.ComThread;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;

public class MsWordUtils {
	// 建立一個word物件
	private ActiveXComponent MsWordApp = null;

	// 建立兩個word組件
	private Dispatch document = null;

	// selection插入点
	private Dispatch selection = null;

	// 建構子
	public MsWordUtils() {
		super();
	}

	*/
/**
	 * 開啟word檔案
	 * 
	 * @param makeVisible
	 *            顯示不顯示(true:顯示;false:不顯示)
	 * 
	 *//*

	public void openWord(boolean makeVisible) {

		// 启动com的线程
		ComThread.InitSTA();
		// 打開word(如果word未開啟時)
		if (MsWordApp == null) {
			MsWordApp = new ActiveXComponent("Word.Application");
		}

		// 設置word是可見或不可見(true:顯示;false:不顯示)
		Dispatch.put(MsWordApp, "Visible", new Variant(makeVisible));
	}

	*/
/**
	 * 建立word的文本內容
	 * 
	 *//*

	public void createNewDocument() {
		// 建立一個Dispatch物件
		Dispatch documents = Dispatch.get(MsWordApp, "Documents").toDispatch();
		document = Dispatch.call(documents, "Add").toDispatch();
		selection = MsWordApp.getProperty("Selection").toDispatch();
	}

	*/
/**
	 * 打开文件
	 * 
	 * @param inputDoc
	 *            要打开的文件，全路径
	 * @return Dispatch 打开的文件
	 *//*

	public void openDocument(String inputDoc) {

		// 建立一個Dispatch物件
		Dispatch documents = Dispatch.get(MsWordApp, "Documents").toDispatch();
		document = Dispatch.call(documents, "Open", inputDoc).toDispatch();
		selection = MsWordApp.getProperty("Selection").toDispatch();

	}

	*/
/**
	 * 选定内容
	 * 
	 * @return Dispatch 选定的范围或插入点
	 *//*

	public Dispatch select() {
		return MsWordApp.getProperty("Selection").toDispatch();
	}

	*/
/**
	 * 把选定内容或插入点向上移动
	 * 
	 * @param selection
	 *            要移动的内容
	 * @param count
	 *            移动的距离
	 *//*

	public void moveUp(Dispatch selection, int count) {
		for (int i = 0; i < count; i++)
			Dispatch.call(selection, "MoveUp");
	}

	*/
/**
	 * 把选定内容或插入点向下移动
	 * 
	 * @param selection
	 *            要移动的内容
	 * @param count
	 *            移动的距离
	 *//*

	public void moveDown(Dispatch selection, int count) {
		for (int i = 0; i < count; i++)
			Dispatch.call(selection, "MoveDown");
	}

	*/
/**
	 * 把选定内容或插入点向左移动
	 * 
	 * @param selection
	 *            要移动的内容
	 * @param count
	 *            移动的距离
	 *//*

	public void moveLeft(Dispatch selection, int count) {
		for (int i = 0; i < count; i++)
			Dispatch.call(selection, "MoveLeft");
	}

	*/
/**
	 * 把选定内容或插入点向右移动
	 * 
	 * @param selection
	 *            要移动的内容
	 * @param count
	 *            移动的距离
	 *//*

	public void moveRight(Dispatch selection, int count) {
		for (int i = 0; i < count; i++)
			Dispatch.call(selection, "MoveRight");
	}

	*/
/**
	 * 把插入点移动到文件首位置
	 * 
	 * @param selection
	 *            插入点
	 *//*

	public void moveStart(Dispatch selection) {
		Dispatch.call(selection, "HomeKey", new Variant(6));
	}

	*/
/**
	 * 从选定内容或插入点开始查找文本
	 * 
	 * @param selection
	 *            选定内容
	 * @param toFindText
	 *            要查找的文本
	 * @return boolean true-查找到并选中该文本，false-未查找到文本
	 *//*

	public boolean find(Dispatch selection, String toFindText) {
		// 从selection所在位置开始查询
		Dispatch find = Dispatch.call(selection, "Find").toDispatch();
		// 设置要查找的内容
		Dispatch.put(find, "Text", toFindText);
		// 向前查找
		Dispatch.put(find, "Forward", "True");
		// 设置格式
		// Dispatch.put(find, "Format", "True");
		// 大小写匹配
		Dispatch.put(find, "MatchCase", "True");
		// 全字匹配
		Dispatch.put(find, "MatchWholeWord", "True");
		// 查找并选中
		return Dispatch.call(find, "Execute").getBoolean();
	}

	*/
/**
	 * 把选定内容替换为设定文本
	 * 
	 * @param selection
	 *            选定内容
	 * @param newText
	 *            替换为文本
	 *//*

	public void replace(Dispatch selection, String newText) {
		// 设置替换文本
		Dispatch.put(selection, "Text", newText);
		this.moveRight(selection, 1);
	}

	*/
/**
	 * 替换word文件中的内容
	 * 
	 * @param oldStr
	 * @param newStr
	 *//*

	public void replace(String oldSoldStrf, String newStr) {
		try {
			moveStart(selection);
			while (this.find(this.select(), oldSoldStrf)) {
				this.replace(selection, newStr);
			}
		} catch (Exception e) {
			System.out.println("word文件替换失败");
			e.printStackTrace(System.out);
		}
	}

	*/
/**
	 * 获取word文件中某个表格的行数
	 * 
	 * @param tableIndex
	 * @param String
	 *//*

	public String getTableRowsCount(String tableIndex) {

		if (tableIndex == null || "".equals(tableIndex))
			tableIndex = "0";
		// 所有表格
		Dispatch tables = Dispatch.get(document, "Tables").toDispatch();
		// 要填充的表格
		Dispatch table = Dispatch.call(tables, "Item", new Variant(tableIndex))
				.toDispatch();
		// 表格的所有行
		Dispatch rows = Dispatch.get(table, "Rows").toDispatch();

		return new String("" + Dispatch.get(rows, "Count").getInt());
	}

	*/
/**
	 * 全局替换
	 * 
	 * @param selection
	 *            选定内容或起始插入点
	 * @param oldText
	 *            要替换的文本
	 * @param newText
	 *            替换为文本
	 *//*

	public void replaceAll(Dispatch selection, String oldText, Object replaceObj) {
		// 移动到文件开头
		moveStart(selection);
		if (oldText.startsWith("table") || replaceObj instanceof List) {
			replaceTable(selection, oldText, (List) replaceObj);
		} else {
			String newText = (String) replaceObj;
			if (oldText.indexOf("image") != -1
					|| newText.lastIndexOf(".bmp") != -1
					|| newText.lastIndexOf(".jpg") != -1
					|| newText.lastIndexOf(".gif") != -1)
				while (find(selection, oldText)) {
					replaceImage(selection, newText);
					Dispatch.call(selection, "MoveRight");
				}
			else
				while (find(selection, oldText)) {
					replace(selection, newText);
					Dispatch.call(selection, "MoveRight");
				}
		}
	}

	*/
/**
	 * 替换表格 特殊处理合同模板里面的 项目组成人员的表格 需要做的处理：在别的地下先在表格里把项目负责人的数据加载进去， 在本方法里面，首先获取
	 * 表格的行数，合并第一列，把第一列的值替换为 "项目负责人" 然后在原来的基础上添加非项目负责人的数据，最后把
	 * 新添加的数据的第一列的值替换为"主要工作人员"
	 * 
	 * @param tableName
	 *            表格名称，形如table$1@1、tabletable$2@1...table$R@N@1...table$R@N，
	 *            R代表从表格中的第N行开始填充， N代表word文件中的第N张表
	 * @param dataList
	 *            数据
	 *//*

	public void replaceTable(String tableIndex, List dataList) {
		// 所有表格
		Dispatch tables = Dispatch.get(document, "Tables").toDispatch();
		// 要填充的表格
		Dispatch table = Dispatch.call(tables, "Item", new Variant(tableIndex))
				.toDispatch();
		// 首先获取表格的行数
		String tableRows = this.getTableRowsCount(tableIndex);
		if (Integer.parseInt(tableRows) > 1) {
			// 合并 从第二行到最后一行的第一列数据
			this.mergeCell(Integer.parseInt(tableIndex), 2, 1,
					Integer.parseInt(tableRows), 1);
			Dispatch mergeCell = Dispatch.call(table, "Cell", new Variant(2),
					new Variant(1)).toDispatch();
			// 选中单元格
			Dispatch.call(mergeCell, "Select");
			// 替换表格内容
			Dispatch.put(selection, "Text", "项目负责人");
		}
		if (dataList.size() <= 1) {
			System.out.println("Empty mostly person!");
			return;
		}

		// 从第几行开始填充
		int fromRow = Integer.parseInt(tableRows) + 1;
		Object[] obj = null;
		// 表格的所有行
		Dispatch rows = Dispatch.get(table, "Rows").toDispatch();
		// 填充表格
		for (int i = 1; i <= dataList.size(); i++) {
			// 某一行数据
			obj = (Object[]) dataList.get(i - 1);
			String[] datas = (String[]) obj;
			// 在表格中添加一行
			if (Dispatch.get(rows, "Count").getInt() < fromRow + i - 1)
				Dispatch.call(rows, "Add");
			// 填充该行的相关列
			for (int j = 0; j < datas.length; j++) {
				// 得到单元格
				Dispatch cell = Dispatch.call(table, "Cell",
						new Variant(fromRow + i - 1), new Variant(j + 1))
						.toDispatch();
				// 选中单元格
				Dispatch.call(cell, "Select");
				Dispatch.put(selection, "Text", datas[j]);
			}
		}
		// 下面将新加的数据的第一列合并，将值改为"主要工作人员"
		// 首先获取表格的行数
		String tableAllRows = this.getTableRowsCount(tableIndex);
		// 合并 从新增数据的第一行到最后一行的第一列单元格进行合并
		this.mergeCell(Integer.parseInt(tableIndex),
				Integer.parseInt(tableRows) + 1, 1,
				Integer.parseInt(tableAllRows), 1);
		Dispatch mergeCell2 = Dispatch.call(table, "Cell",
				new Variant(Integer.parseInt(tableRows) + 1), new Variant(1))
				.toDispatch();
		// 选中单元格
		Dispatch.call(mergeCell2, "Select");
		// 替换表格内容
		Dispatch.put(selection, "Text", "主要工作人员");

	}

	*/
/**
	 * 替换表格
	 * 
	 * @param isNeedSeqNo
	 *            表示表格的第一列是不是需要序号(0:不需要序号;1:需要序号)
	 * 
	 * @param tableName
	 *            表格名称，形如table$1@1、tabletable$2@1...table$R@N@1...table$R@N，
	 *            R代表从表格中的第N行开始填充， N代表word文件中的第N张表
	 * @param dataList
	 *            数据
	 *//*

	public void replaceTable(String tableName, String isNeedSeqNo, List dataList) {

		boolean needSeqNo = false;
		if ("1".equals(isNeedSeqNo))
			needSeqNo = true;

		if (dataList.size() <= 1) {
			System.out.println("Empty table!");
			return;
		}
		// // 要填充的列
		Object[] datas = null;
		datas = (Object[]) dataList.get(0);
		// String[] cols = (String[]) datas;
		// 表格序号
		String tbIndex = tableName.substring(tableName.lastIndexOf("@") + 1);
		// 从第几行开始填充
		int fromRow = Integer.parseInt(tableName.substring(
				tableName.lastIndexOf("$") + 1, tableName.lastIndexOf("@")));
		// 所有表格
		Dispatch tables = Dispatch.get(document, "Tables").toDispatch();
		// 要填充的表格
		Dispatch table = Dispatch.call(tables, "Item", new Variant(tbIndex))
				.toDispatch();
		// 表格的所有行
		Dispatch rows = Dispatch.get(table, "Rows").toDispatch();
		// 填充表格
		for (int i = 1; i <= dataList.size(); i++) {
			// 某一行数据
			datas = (Object[]) dataList.get(i - 1);
			// String[] datas = (String[]) obj;
			// 在表格中添加一行
			if (Dispatch.get(rows, "Count").getInt() < fromRow + i - 1)
				Dispatch.call(rows, "Add");
			// 填充该行的相关列
			for (int j = 0; j < datas.length; j++) {
				// 得到单元格
				// Dispatch cell = Dispatch.call(table, "Cell",
				// Integer.toString(fromRow + i - 1), cols[j])
				// .toDispatch();
				Dispatch cell = Dispatch.call(table, "Cell",
						new Variant(fromRow + i - 1), new Variant(j + 1))
						.toDispatch();
				// 选中单元格
				Dispatch.call(cell, "Select");
				// 设置格式
				// Dispatch font = Dispatch.get(selection, "Font").toDispatch();
				// Dispatch.put(font, "Bold", "0");
				// Dispatch.put(font, "Italic", "0");
				// 输入数据,如果需要序号，则第一列添加序号，否则正常
				if (needSeqNo && j == 0)
					Dispatch.put(selection, "Text", i + "");
				else if (needSeqNo && j > 0)
					Dispatch.put(selection, "Text", (String) datas[j]);
				else
					Dispatch.put(selection, "Text", (String) datas[j + 1]);
			}
		}
	}

	*/
/**
	 * 替换合同模板里面的进度计划的表格
	 * 
	 * @param selection
	 *            插入点
	 * @param tableName
	 *            表格名称，形如table$1@1、tabletable$2@1...table$R@N@1...table$R@N，
	 *            R代表从表格中的第N行开始填充， N代表word文件中的第N张表
	 * @param fields
	 *            表格中要替换的字段与数据的对应表
	 *//*

	public void replaceContract(String tableName, List dataList) {

		if (dataList.size() <= 1) {
			System.out.println("Empty table!");
			return;
		}
		// 要填充的列
		Object[] obj = null;
		// 表格序号
		String tbIndex = tableName.substring(tableName.lastIndexOf("@") + 1);
		// 从第几行开始填充
		int fromRow = Integer.parseInt(tableName.substring(
				tableName.lastIndexOf("$") + 1, tableName.lastIndexOf("@")));
		// 所有表格
		Dispatch tables = Dispatch.get(document, "Tables").toDispatch();
		// 要填充的表格
		Dispatch table = Dispatch.call(tables, "Item", new Variant(tbIndex))
				.toDispatch();
		// 表格的所有行
		Dispatch rows = Dispatch.get(table, "Rows").toDispatch();
		// 填充表格
		for (int i = 1; i <= dataList.size(); i++) {
			// 某一行数据
			obj = (Object[]) dataList.get(i - 1);
			String[] datas = (String[]) obj;
			// 在表格中添加一行
			if (Dispatch.get(rows, "Count").getInt() < fromRow + i - 1)
				Dispatch.call(rows, "Add");
			// 填充该行的相关列
			for (int j = 0; j < 2; j++) {
				// 得到单元格
				Dispatch cell = Dispatch.call(table, "Cell",
						new Variant(fromRow + i - 1), new Variant(j + 1))
						.toDispatch();
				// 选中单元格
				Dispatch.call(cell, "Select");
				// 设置格式
				// Dispatch font = Dispatch.get(selection, "Font").toDispatch();
				// Dispatch.put(font, "Bold", "0");
				// Dispatch.put(font, "Italic", "0");
				// 输入数据
				if (j == 0)
					Dispatch.put(selection, "Text", "5." + (j + 1));
				else {
					String temp = "";
					temp = datas[1] + "-" + datas[2] + "\n" + "主要内容："
							+ datas[3] + "\n" + "考核目标：" + datas[4];
					Dispatch.put(selection, "Text", temp);

				}

			}
		}
	}

	*/
/**
	 * 替换表格
	 * 
	 * @param selection
	 *            插入点
	 * @param tableName
	 *            表格名称，形如table$1@1、tabletable$2@1...table$R@N@1...table$R@N，
	 *            R代表从表格中的第N行开始填充， N代表word文件中的第N张表
	 * @param fields
	 *            表格中要替换的字段与数据的对应表
	 *//*

	public void replaceTable(Dispatch selection, String tableName, List dataList) {

		if (dataList.size() <= 1) {
			System.out.println("Empty table!");
			return;
		}
		// 要填充的列
		Object[] obj = null;
		// String[] cols = (String[]) dataList.get(0);
		// 表格序号
		String tbIndex = tableName.substring(tableName.lastIndexOf("@") + 1);
		// 从第几行开始填充
		int fromRow = Integer.parseInt(tableName.substring(
				tableName.lastIndexOf("$") + 1, tableName.lastIndexOf("@")));
		// 所有表格
		Dispatch tables = Dispatch.get(document, "Tables").toDispatch();
		// 要填充的表格
		Dispatch table = Dispatch.call(tables, "Item", new Variant(tbIndex))
				.toDispatch();
		// 表格的所有行
		Dispatch rows = Dispatch.get(table, "Rows").toDispatch();
		// 填充表格
		for (int i = 1; i <= dataList.size(); i++) {
			// 某一行数据
			obj = (Object[]) dataList.get(i - 1);
			String[] datas = (String[]) obj;
			// 在表格中添加一行
			if (Dispatch.get(rows, "Count").getInt() < fromRow + i - 1)
				Dispatch.call(rows, "Add");
			// 填充该行的相关列
			for (int j = 0; j < datas.length; j++) {
				// 得到单元格
				// Dispatch cell = Dispatch.call(table, "Cell",
				// Integer.toString(fromRow + i - 1), cols[j])
				// .toDispatch();
				Dispatch cell = Dispatch.call(table, "Cell",
						new Variant(fromRow + i - 1), new Variant(j + 1))
						.toDispatch();
				// 选中单元格
				Dispatch.call(cell, "Select");
				// 设置格式
				Dispatch font = Dispatch.get(selection, "Font").toDispatch();
				Dispatch.put(font, "Bold", "0");
				Dispatch.put(font, "Italic", "0");
				// 输入数据
				Dispatch.put(selection, "Text", datas[j]);
				// this.moveRight(selection, 1);
			}
			// this.moveDown(selection, count)
			// this.moveRight(selection, 1);
		}
	}

	*/
/**
	 * 寫入换行到word中
	 * 
	 * @param text
	 *            本文標題
	 * 
	 *//*

	public void insertSplit() {
		selection = Dispatch.get(MsWordApp, "Selection").toDispatch(); // 輸入內容需要的物件

		// Dispatch alignment = Dispatch.get(selection, "ParagraphFormat")
		// .toDispatch(); // 行列格式化需要的物件
		// Dispatch.call(selection, "TypeText", ""); // 寫入標題內容

		// Dispatch.call(selection, "TypeParagraph"); // 空一行段落
		// Dispatch.put(alignment, "Alignment", "3"); // (1:置中 2:靠右 3:靠左)
		Dispatch.call(selection, "MoveRight"); // 游標往下一行
	}

	*/
/**
	 * 换行
	 *//*

	public void insertEnter() {
		Dispatch.call(selection, "TypeText", "\r\n");
	}

	*/
/**
	 * 写入文字
	 *//*

	public void insertContent(String content) {
		Dispatch.call(selection, "TypeText", content);
	}

	*/
/**
	 * 合併表格
	 * 
	 * @param tableIndex
	 *            表格起始點
	 * @param fstCellRowIdx
	 *            開始列
	 * @param fstCellColIdx
	 *            開始欄
	 * @param secCellRowIdx
	 *            結束列
	 * @param secCellColIdx
	 *            結束欄
	 *//*

	public void mergeCell(int tableIndex, int fstCellRowIdx, int fstCellColIdx,
			int secCellRowIdx, int secCellColIdx) {
		// 所有表格
		Dispatch tables = Dispatch.get(document, "Tables").toDispatch();

		// 要填充的表格
		Dispatch table = Dispatch.call(tables, "Item", new Variant(tableIndex))
				.toDispatch();
		Dispatch fstCell = Dispatch.call(table, "Cell",
				new Variant(fstCellRowIdx), new Variant(fstCellColIdx))
				.toDispatch();
		Dispatch secCell = Dispatch.call(table, "Cell",
				new Variant(secCellRowIdx), new Variant(secCellColIdx))
				.toDispatch();

		Dispatch.call(fstCell, "Merge", secCell);
	}

	*/
/**
	 * 自動調整表格
	 * 
	 *//*

	public void autoFitTable() {
		Dispatch tables = Dispatch.get(document, "Tables").toDispatch();

		int count = Dispatch.get(tables, "Count").getInt(); // word中的表格數量

		for (int i = 0; i < count; i++) {
			Dispatch table = Dispatch.call(tables, "Item", new Variant(i + 1))
					.toDispatch();
			Dispatch cols = Dispatch.get(table, "Columns").toDispatch();
			Dispatch.call(cols, "AutoFit");
		}
	}

	*/
/**
	 * 替换图片
	 * 
	 * @param selection
	 *            图片的插入点
	 * @param imagePath
	 *            图片文件（全路径）
	 *//*

	public void replaceImage(Dispatch selection, String imagePath) {
		Dispatch.call(Dispatch.get(selection, "InLineShapes").toDispatch(),
				"AddPicture", imagePath);
	}

	*/
/**
	 * 功能: 在文件的当前插入点插入文件
	 * 
	 * @param path
	 *            void
	 *//*

	public void insertFile(String path) {
		// selection = Dispatch.get(MsWordApp, "Selection").toDispatch();
		// Dispatch.call(selection, "MoveDown");
		Dispatch.invoke(selection, "insertFile", Dispatch.Method, new Object[] {
				path, "", new Variant(false), new Variant(false),
				new Variant(false) }, new int[3]);
		// this.moveStart(selection);
	}

	*/
/**
	 * 功能: 在文件的插入点插入文件
	 * 
	 * @param selection
	 *            文件的插入点
	 * @param path
	 *            void
	 *//*

	public void insertFile(Dispatch selection, String path) {

		Dispatch.invoke(selection, "insertFile", Dispatch.Method, new Object[] {
				path, "", new Variant(false), new Variant(false),
				new Variant(false) }, new int[3]);
	}

	*/
/**
	 * 往word中插入table
	 * 
	 *//*

	public void insertTable(String rows, String cols) {
		// 建立表格
		Dispatch tables = Dispatch.get(document, "Tables").toDispatch();
		Dispatch range = Dispatch.get(selection, "Range").toDispatch();
		Dispatch.call(tables, "Add", range, new Variant(cols),
				new Variant(rows), new Variant(1)).toDispatch(); // 設置列數,欄數,表格外框寬度
		Dispatch.call(selection, "MoveRight"); // 游標移到最右邊
	}

	*/
/**
	 * 往表格中插入word文件
	 * 
	 *//*

	public void insertFileToTable(String path, int tableIndex) {
		Dispatch tables = Dispatch.get(document, "Tables").toDispatch();
		Dispatch table = Dispatch.call(tables, "Item", new Variant(tableIndex))
				.toDispatch();
		Dispatch cell = Dispatch.call(table, "Cell", new Variant(1),
				new Variant(1)).toDispatch();
		Dispatch.call(cell, "Select");

		selection = Dispatch.get(MsWordApp, "Selection").toDispatch();
		// 主要內容
		try {
			Dispatch.invoke(selection, "insertFile", Dispatch.Method,
					new Object[] { path, "", new Variant(false),
							new Variant(false), new Variant(false) },
					new int[3]);
		} catch (Exception e) {

			e.printStackTrace();
			// 主要內容
			Dispatch alignment = Dispatch.get(selection, "ParagraphFormat")
					.toDispatch(); // 行列格式化需要的物件
			Dispatch font1 = Dispatch.get(selection, "Font").toDispatch();

			// 文件標題
			// Dispatch.call(selection, "TypeParagraph"); //空一行段落;
			Dispatch.put(alignment, "Alignment", "3"); // (1:置中 2:靠右 3:靠左)
			Dispatch.put(font1, "Bold", "0"); // 字型租體
			Dispatch.put(font1, "Size", "12"); // 字型大小
			Dispatch.put(font1, "Color", "0,0,0,0"); // 字型顏色(1,0,0,0=>紅色
			// 1,1,0,0=>棕色)
			// Dispatch.put(font, "Italic", "1"); //字型斜體
			Dispatch.call(selection, "TypeText", path); // 寫入標題內容

			// 標題格行
			Dispatch.call(selection, "TypeParagraph"); // 空一行段落
			Dispatch.put(alignment, "Alignment", "3"); // (1:置中 2:靠右 3:靠左)
			Dispatch.call(selection, "MoveDown"); // 游標往下一行
		}
		// 取消選擇(因為最後insert進去的文字會顯示反白,所以要取消)
		Dispatch.call(selection, "MoveRight", new Variant(1), new Variant(1));
		insertSplit();
	}

	public void insertTextToTable(String text, int tableIndex) {
		Dispatch tables = Dispatch.get(document, "Tables").toDispatch();
		Dispatch table = Dispatch.call(tables, "Item", new Variant(tableIndex))
				.toDispatch();
		Dispatch cell = Dispatch.call(table, "Cell", new Variant(1),
				new Variant(1)).toDispatch();
		Dispatch.call(cell, "Select");

		selection = Dispatch.get(MsWordApp, "Selection").toDispatch();
		// 主要內容
		Dispatch alignment = Dispatch.get(selection, "ParagraphFormat")
				.toDispatch(); // 行列格式化需要的物件
		Dispatch font1 = Dispatch.get(selection, "Font").toDispatch();

		// 文件標題
		// Dispatch.call(selection, "TypeParagraph"); //空一行段落
		Dispatch.put(alignment, "Alignment", "3"); // (1:置中 2:靠右 3:靠左)
		Dispatch.put(font1, "Bold", "0"); // 字型租體
		Dispatch.put(font1, "Size", "12"); // 字型大小
		Dispatch.put(font1, "Color", "0,0,0,0"); // 字型顏色(1,0,0,0=>紅色
		// 1,1,0,0=>棕色)
		// Dispatch.put(font, "Italic", "1"); //字型斜體
		Dispatch.call(selection, "TypeText", text); // 寫入標題內容

		// 標題格行
		Dispatch.call(selection, "TypeParagraph"); // 空一行段落
		Dispatch.put(alignment, "Alignment", "3"); // (1:置中 2:靠右 3:靠左)
		Dispatch.call(selection, "MoveDown"); // 游標往下一行
		// 取消選擇(因為最後insert進去的文字會顯示反白,所以要取消)
		Dispatch.call(selection, "MoveRight", new Variant(1), new Variant(1));
		insertSplit();
	}

	public void acceptAllChanges() {
		Dispatch oWordBasic = (Dispatch) Dispatch.call(MsWordApp, "WordBasic")
				.getDispatch();
		Dispatch.call(oWordBasic, "AcceptAllChangesInDoc");
	}

	public void wordToHtml(String inPath, String fileName) {
		// MsWordApp.setProperty("Visible", new Variant(false));// 设置word不可见
		String htmlPath = inPath + fileName;
		Object doc1 = MsWordApp.getProperty("Documents").toDispatch();
		Object doc2 = Dispatch.invoke(
				(Dispatch) doc1,
				"Open",
				Dispatch.Method,
				new Object[] { inPath + fileName + ".doc", new Variant(false),
						new Variant(true) }, new int[1]).toDispatch();// 打开word文件

		Dispatch.invoke((Dispatch) doc2, "SaveAs", Dispatch.Method,
				new Object[] { htmlPath, new Variant(8) }, new int[1]);
		// Variant f = new Variant(false);
		// Dispatch.call((Dispatch)doc2, "Close", f); // 关闭
	}

	*/
/**
	 * 另存檔案
	 * 
	 * @param filename
	 *            要儲存的檔案名稱
	 * 
	 *//*

	public void saveFileAs(String filename) {
		Dispatch.call(document, "SaveAs", filename);
	}

	*/
/**
	 * 列印word文件
	 * 
	 *//*

	public void printFile() {
		Dispatch.call(document, "PrintOut");
	}

	*/
/**
	 * 關閉文本內容(如果未開啟word編輯時,釋放ActiveX執行緒)
	 * 
	 *//*

	public void closeDocument() {
		// 0 = 沒有儲存改變
		// -1 = 有儲存改變
		// -2 = 提示儲存改變
		Dispatch.call(document, "Close", new Variant(0));
		document = null;
	}

	*/
/**
	 * 關閉word(如果未開啟word編輯時,釋放ActiveX執行緒)
	 * 
	 *//*

	public void closeWord() {
		Dispatch.call(MsWordApp, "Quit");
		MsWordApp = null;
		document = null;
		ComThread.Release();
	}

	public void replaceBookMark(String bookMarkKey, String value) {
		Dispatch activeDocument = MsWordApp.getProperty("ActiveDocument")
				.toDispatch();
		Dispatch bookMarks = MsWordApp.call(activeDocument, "Bookmarks")
				.toDispatch();
		boolean bookMarkExist1 = Dispatch
				.call(bookMarks, "Exists", bookMarkKey).toBoolean();
		if (bookMarkExist1 == true) {
			System.out.println("已找到书签 " + bookMarkKey);
			Dispatch rangeItem = Dispatch.call(bookMarks, "Item", bookMarkKey)
					.toDispatch();
			Dispatch range = Dispatch.call(rangeItem, "Range").toDispatch();

			String bookMarkValue = Dispatch.get(range, "Text").toString();

			if (bookMarkValue != null) {
				Dispatch.put(range, "Text", new Variant(value));
			}
		} else {
			System.out.println("指定的书签不存在 ");
		}
	}

	public void findBookMark(String bookMarkKey) {
		Dispatch activeDocument = MsWordApp.getProperty("ActiveDocument")
				.toDispatch();
		Dispatch bookMarks = MsWordApp.call(activeDocument, "Bookmarks")
				.toDispatch();
		boolean bookMarkExist1 = Dispatch
				.call(bookMarks, "Exists", bookMarkKey).toBoolean();
		if (bookMarkExist1 == true) {
			System.out.println("已找到书签 " + bookMarkKey);
			Dispatch rangeItem = Dispatch.call(bookMarks, "Item", bookMarkKey)
					.toDispatch();
			Dispatch range = Dispatch.call(rangeItem, "Range").toDispatch();

			String bookMarkValue = Dispatch.get(range, "Text").toString();
			//
			if (bookMarkValue != null) {
				Dispatch.call(range, "Select");
			}
		} else {
			System.out.println("指定的书签不存在 ");
		}
	}
}
*/
