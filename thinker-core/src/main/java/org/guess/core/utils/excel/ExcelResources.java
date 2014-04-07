package org.guess.core.utils.excel;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;


/**
 * 用来在对象的get方法上加入的annotation，通过该annotation说明某个属性所对应的标题
 * @author Administrator
 *
 */
@Retention(RetentionPolicy.RUNTIME)
public @interface ExcelResources {
	/**
	 * 属性的标题名称
	 * @return
	 */
	String title();
	/**
	 * 在excel的顺序
	 * @return
	 */
	int order() default 9999;
}
