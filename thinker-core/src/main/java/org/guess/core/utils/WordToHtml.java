package org.guess.core.utils;

@SuppressWarnings("unused")
public class WordToHtml {

    private static final int WORD_HTML = 8;
	private static final int WORD_TXT = 7;
    private static final int EXCEL_HTML = 44;

    /**
     * WORD转HTML
     * 
     * @param docfile
     *            WORD文件全路径
     * @param htmlfile
     *            转换后HTML存放路径
     */
    /*public static void wordToHtml(String docfile, String htmlfile) {
        ActiveXComponent app = new ActiveXComponent("Word.Application"); // 启动word
        try {
        	app.setProperty("Visible", new Variant(false));
            Dispatch docs = app.getProperty("Documents").toDispatch();
            Dispatch doc = Dispatch.invoke(
                    docs,
                    "Open",
                    Dispatch.Method,
                    new Object[] { docfile, new Variant(false),
                            new Variant(true) }, new int[1]).toDispatch();
            Dispatch.invoke(doc, "SaveAs", Dispatch.Method, new Object[] {
                    htmlfile, new Variant(WORD_HTML) }, new int[1]);
            Variant f = new Variant(false);
            Dispatch.call(doc, "Close", f);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            app.invoke("Quit", new Variant[] {});
        }
    }

    *//**
     * EXCEL转HTML
     * 
     * @param xlsfile
     *            EXCEL文件全路径
     * @param htmlfile
     *            转换后HTML存放路径
     *//*
    public static void excelToHtml(String xlsfile, String htmlfile) {
        ActiveXComponent app = new ActiveXComponent("Excel.Application"); // 启动excel
        try {
            app.setProperty("Visible", new Variant(false));
            Dispatch excels = app.getProperty("Workbooks").toDispatch();
            Dispatch excel = Dispatch.invoke(
                    excels,
                    "Open",
                    Dispatch.Method,
                    new Object[] { xlsfile, new Variant(false),
                            new Variant(true) }, new int[1]).toDispatch();
            Dispatch.invoke(excel, "SaveAs", Dispatch.Method, new Object[] {
                    htmlfile, new Variant(EXCEL_HTML) }, new int[1]);
            Variant f = new Variant(false);
            Dispatch.call(excel, "Close", f);
            System.out.println("wordtohtml转换成功");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            app.invoke("Quit", new Variant[] {});
        }
    }*/

    /*public static void main(String[] args) {
        // TODO Auto-generated method stub
    	WordToHtml.wordToHtml("E:\\tmp\\test\\江苏省太湖流域污染源监控管理平台界面.docx", "E:\\tmp\\test");
//    	WordToHtml.excelToHtml("E:\\tmp\\test\\北京：总公司通讯录.xlsx", "E:\\tmp\\hello");
        System.out.println("word转html成功");
    }*/
}