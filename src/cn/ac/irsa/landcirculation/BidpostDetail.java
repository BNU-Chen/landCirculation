package cn.ac.irsa.landcirculation;

// Generated 2015-3-14 18:18:06 by Hibernate Tools 3.4.0.CR1

/**
 * BidpostDetail generated by hbm2java
 */
public class BidpostDetail implements java.io.Serializable {

	private Integer	id;
	private Apply	apply;
	private Bidpost	bidpost;
	private String	applierName;
	private String	applierIdcode;
	private Double	landRgArea;
	private Double	drylandRgArea;
	private Double	paddyfieldRgArea;
	private Integer	rightAuthType;
	private String	landwarrantCode;
	private String	landcontractCode;
	private String	landAddress;

	public BidpostDetail() {
	}

	public BidpostDetail(Apply apply, Bidpost bidpost, String applierName, String applierIdcode, Double landRgArea, Double drylandRgArea, Double paddyfieldRgArea, Integer rightAuthType, String landwarrantCode, String landcontractCode, String landAddress) {
		this.apply = apply;
		this.bidpost = bidpost;
		this.applierName = applierName;
		this.applierIdcode = applierIdcode;
		this.landRgArea = landRgArea;
		this.drylandRgArea = drylandRgArea;
		this.paddyfieldRgArea = paddyfieldRgArea;
		this.rightAuthType = rightAuthType;
		this.landwarrantCode = landwarrantCode;
		this.landcontractCode = landcontractCode;
		this.landAddress = landAddress;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Apply getApply() {
		return this.apply;
	}

	public void setApply(Apply apply) {
		this.apply = apply;
	}

	public Bidpost getBidpost() {
		return this.bidpost;
	}

	public void setBidpost(Bidpost bidpost) {
		this.bidpost = bidpost;
	}

	public String getApplierName() {
		return this.applierName;
	}

	public void setApplierName(String applierName) {
		this.applierName = applierName;
	}

	public String getApplierIdcode() {
		return this.applierIdcode;
	}

	public void setApplierIdcode(String applierIdcode) {
		this.applierIdcode = applierIdcode;
	}

	public Double getLandRgArea() {
		return this.landRgArea;
	}

	public void setLandRgArea(Double landRgArea) {
		this.landRgArea = landRgArea;
	}

	public Double getDrylandRgArea() {
		return this.drylandRgArea;
	}

	public void setDrylandRgArea(Double drylandRgArea) {
		this.drylandRgArea = drylandRgArea;
	}

	public Double getPaddyfieldRgArea() {
		return this.paddyfieldRgArea;
	}

	public void setPaddyfieldRgArea(Double paddyfieldRgArea) {
		this.paddyfieldRgArea = paddyfieldRgArea;
	}

	public Integer getRightAuthType() {
		return this.rightAuthType;
	}

	public void setRightAuthType(Integer rightAuthType) {
		this.rightAuthType = rightAuthType;
	}

	public String getLandwarrantCode() {
		return this.landwarrantCode;
	}

	public void setLandwarrantCode(String landwarrantCode) {
		this.landwarrantCode = landwarrantCode;
	}

	public String getLandcontractCode() {
		return this.landcontractCode;
	}

	public void setLandcontractCode(String landcontractCode) {
		this.landcontractCode = landcontractCode;
	}

	public String getLandAddress() {
		return this.landAddress;
	}

	public void setLandAddress(String landAddress) {
		this.landAddress = landAddress;
	}

}