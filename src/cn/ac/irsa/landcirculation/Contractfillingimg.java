package cn.ac.irsa.landcirculation;

// Generated 2015-3-14 18:18:06 by Hibernate Tools 3.4.0.CR1

/**
 * Contractfillingimg generated by hbm2java
 */
public class Contractfillingimg implements java.io.Serializable {

	private Integer			id;
	private Contractfilling	contractfilling;
	private String			contractNo;
	private String			contractfillingimgPathFilename;
	private Integer			contractfillingimgSn;

	public Contractfillingimg() {
	}

	public Contractfillingimg(Contractfilling contractfilling, String contractNo, String contractfillingimgPathFilename, Integer contractfillingimgSn) {
		this.contractfilling = contractfilling;
		this.contractNo = contractNo;
		this.contractfillingimgPathFilename = contractfillingimgPathFilename;
		this.contractfillingimgSn = contractfillingimgSn;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Contractfilling getContractfilling() {
		return this.contractfilling;
	}

	public void setContractfilling(Contractfilling contractfilling) {
		this.contractfilling = contractfilling;
	}

	public String getContractNo() {
		return this.contractNo;
	}

	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
	}

	public String getContractfillingimgPathFilename() {
		return this.contractfillingimgPathFilename;
	}

	public void setContractfillingimgPathFilename(String contractfillingimgPathFilename) {
		this.contractfillingimgPathFilename = contractfillingimgPathFilename;
	}

	public Integer getContractfillingimgSn() {
		return this.contractfillingimgSn;
	}

	public void setContractfillingimgSn(Integer contractfillingimgSn) {
		this.contractfillingimgSn = contractfillingimgSn;
	}

}
