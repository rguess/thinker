package org.guess.generate;

public class Field {

	//属性名
	private String name;
	//中文名称
	private String value;
	//内型字符串，如String Integer
	private String type;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Field(String name, String value, String type) {
		super();
		this.name = name;
		this.value = value;
		this.type = type;
	}
	public Field() {
		super();
	}
	
}
