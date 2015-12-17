package cn.ac.irsa.landcirculation;

// Generated 2015-3-14 18:18:06 by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;

/**
 * Rtnmsgdef generated by hbm2java
 */
public class Rtnmsgdef implements java.io.Serializable {

	private Integer	id;
	private String	msgCode;
	private String	msgText;
	private Set		applies	= new HashSet(0);

	public Rtnmsgdef() {
	}

	public Rtnmsgdef(String msgCode, String msgText, Set applies) {
		this.msgCode = msgCode;
		this.msgText = msgText;
		this.applies = applies;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMsgCode() {
		return this.msgCode;
	}

	public void setMsgCode(String msgCode) {
		this.msgCode = msgCode;
	}

	public String getMsgText() {
		return this.msgText;
	}

	public void setMsgText(String msgText) {
		this.msgText = msgText;
	}

	public Set getApplies() {
		return this.applies;
	}

	public void setApplies(Set applies) {
		this.applies = applies;
	}

}