package cn.ac.irsa.landcirculation;

// Generated 2015-3-14 18:18:06 by Hibernate Tools 3.4.0.CR1

/**
 * CodeVillage generated by hbm2java
 */
public class CodeVillage implements java.io.Serializable {

	private Integer	id;
	private String	code;
	private String	name;
	private String	townCode;

	public CodeVillage() {
	}

	public CodeVillage(String code, String name, String townCode) {
		this.code = code;
		this.name = name;
		this.townCode = townCode;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTownCode() {
		return this.townCode;
	}

	public void setTownCode(String townCode) {
		this.townCode = townCode;
	}

}
