package org.guess.sys.model;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.guess.core.IdEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * testEntity
 * @author rguess
 * @version 2014-05-06
 */
@Entity
@Table(name = "sys_test")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Test extends IdEntity {

	private String one;
	private String tow;
	private String three;
	private String four;
	private String five;
	private String six;
	private String seven;
	private String eight;
	private String nine;
	private String ten;
	private String aaa;
	private String bbb;
	private String ccc;
	private String ddd;
	private String eee;
	private String fff;
	private String ggg;
	private String hhh;
	private String iii;
	private String jjj;
	private String kkk;
	private String lll;
	
	public String getOne() {
		return one;
	}

	public void setOne(String one) {
		this.one = one;
	}
	
	public String getTow() {
		return tow;
	}

	public void setTow(String tow) {
		this.tow = tow;
	}
	
	public String getThree() {
		return three;
	}

	public void setThree(String three) {
		this.three = three;
	}
	
	public String getFour() {
		return four;
	}

	public void setFour(String four) {
		this.four = four;
	}
	
	public String getFive() {
		return five;
	}

	public void setFive(String five) {
		this.five = five;
	}
	
	public String getSix() {
		return six;
	}

	public void setSix(String six) {
		this.six = six;
	}
	
	public String getSeven() {
		return seven;
	}

	public void setSeven(String seven) {
		this.seven = seven;
	}
	
	public String getEight() {
		return eight;
	}

	public void setEight(String eight) {
		this.eight = eight;
	}
	
	public String getNine() {
		return nine;
	}

	public void setNine(String nine) {
		this.nine = nine;
	}
	
	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}
	
	public String getAaa() {
		return aaa;
	}

	public void setAaa(String aaa) {
		this.aaa = aaa;
	}
	
	public String getBbb() {
		return bbb;
	}

	public void setBbb(String bbb) {
		this.bbb = bbb;
	}
	
	public String getCcc() {
		return ccc;
	}

	public void setCcc(String ccc) {
		this.ccc = ccc;
	}
	
	public String getDdd() {
		return ddd;
	}

	public void setDdd(String ddd) {
		this.ddd = ddd;
	}
	
	public String getEee() {
		return eee;
	}

	public void setEee(String eee) {
		this.eee = eee;
	}
	
	public String getFff() {
		return fff;
	}

	public void setFff(String fff) {
		this.fff = fff;
	}
	
	public String getGgg() {
		return ggg;
	}

	public void setGgg(String ggg) {
		this.ggg = ggg;
	}
	
	public String getHhh() {
		return hhh;
	}

	public void setHhh(String hhh) {
		this.hhh = hhh;
	}
	
	public String getIii() {
		return iii;
	}

	public void setIii(String iii) {
		this.iii = iii;
	}
	
	public String getJjj() {
		return jjj;
	}

	public void setJjj(String jjj) {
		this.jjj = jjj;
	}
	
	public String getKkk() {
		return kkk;
	}

	public void setKkk(String kkk) {
		this.kkk = kkk;
	}
	
	public String getLll() {
		return lll;
	}

	public void setLll(String lll) {
		this.lll = lll;
	}
	
	
}