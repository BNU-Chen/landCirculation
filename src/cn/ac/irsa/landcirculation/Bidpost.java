package cn.ac.irsa.landcirculation;

// Generated 2015-3-14 18:18:06 by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Bidpost generated by hbm2java
 */
public class Bidpost implements java.io.Serializable {

	private Integer		id;
	private UserPerson	userPerson;
	private String		posterName;
	private String		postNo;
	private Date		publishDate;
	private String		bidType;
	private String		bidTypename;
	private Double		landRgArea;
	private Double		drylandRgArea;
	private Double		paddyfieldRgArea;
	private Long		drylandBaseprice;
	private Long		paddyfieldBaseprice;
	private Long		deposit;
	private Date		applyStartDate;
	private Date		applyEndDate;
	private Date		bidDate;
	private String		picName;
	private Long		picTel;
	private String		picEmail;
	private String		picAddress;
	private String		status;
	private Set			bidenrolls		= new HashSet(0);
	private Set			bidtenders		= new HashSet(0);
	private Set			bidpostDetails	= new HashSet(0);

	public Bidpost() {
	}

	public Bidpost(UserPerson userPerson, String posterName, String postNo, Date publishDate, String bidType, String bidTypename, Double landRgArea, Double drylandRgArea, Double paddyfieldRgArea, Long drylandBaseprice, Long paddyfieldBaseprice, Long deposit, Date applyStartDate, Date applyEndDate, Date bidDate, String picName, Long picTel, String picEmail, String picAddress, String status, Set bidenrolls, Set bidtenders, Set bidpostDetails) {
		this.userPerson = userPerson;
		this.posterName = posterName;
		this.postNo = postNo;
		this.publishDate = publishDate;
		this.bidType = bidType;
		this.bidTypename = bidTypename;
		this.landRgArea = landRgArea;
		this.drylandRgArea = drylandRgArea;
		this.paddyfieldRgArea = paddyfieldRgArea;
		this.drylandBaseprice = drylandBaseprice;
		this.paddyfieldBaseprice = paddyfieldBaseprice;
		this.deposit = deposit;
		this.applyStartDate = applyStartDate;
		this.applyEndDate = applyEndDate;
		this.bidDate = bidDate;
		this.picName = picName;
		this.picTel = picTel;
		this.picEmail = picEmail;
		this.picAddress = picAddress;
		this.status = status;
		this.bidenrolls = bidenrolls;
		this.bidtenders = bidtenders;
		this.bidpostDetails = bidpostDetails;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public UserPerson getUserPerson() {
		return this.userPerson;
	}

	public void setUserPerson(UserPerson userPerson) {
		this.userPerson = userPerson;
	}

	public String getPosterName() {
		return this.posterName;
	}

	public void setPosterName(String posterName) {
		this.posterName = posterName;
	}

	public String getPostNo() {
		return this.postNo;
	}

	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}

	public Date getPublishDate() {
		return this.publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public String getBidType() {
		return this.bidType;
	}

	public void setBidType(String bidType) {
		this.bidType = bidType;
	}

	public String getBidTypename() {
		return this.bidTypename;
	}

	public void setBidTypename(String bidTypename) {
		this.bidTypename = bidTypename;
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

	public Long getDrylandBaseprice() {
		return this.drylandBaseprice;
	}

	public void setDrylandBaseprice(Long drylandBaseprice) {
		this.drylandBaseprice = drylandBaseprice;
	}

	public Long getPaddyfieldBaseprice() {
		return this.paddyfieldBaseprice;
	}

	public void setPaddyfieldBaseprice(Long paddyfieldBaseprice) {
		this.paddyfieldBaseprice = paddyfieldBaseprice;
	}

	public Long getDeposit() {
		return this.deposit;
	}

	public void setDeposit(Long deposit) {
		this.deposit = deposit;
	}

	public Date getApplyStartDate() {
		return this.applyStartDate;
	}

	public void setApplyStartDate(Date applyStartDate) {
		this.applyStartDate = applyStartDate;
	}

	public Date getApplyEndDate() {
		return this.applyEndDate;
	}

	public void setApplyEndDate(Date applyEndDate) {
		this.applyEndDate = applyEndDate;
	}

	public Date getBidDate() {
		return this.bidDate;
	}

	public void setBidDate(Date bidDate) {
		this.bidDate = bidDate;
	}

	public String getPicName() {
		return this.picName;
	}

	public void setPicName(String picName) {
		this.picName = picName;
	}

	public Long getPicTel() {
		return this.picTel;
	}

	public void setPicTel(Long picTel) {
		this.picTel = picTel;
	}

	public String getPicEmail() {
		return this.picEmail;
	}

	public void setPicEmail(String picEmail) {
		this.picEmail = picEmail;
	}

	public String getPicAddress() {
		return this.picAddress;
	}

	public void setPicAddress(String picAddress) {
		this.picAddress = picAddress;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Set getBidenrolls() {
		return this.bidenrolls;
	}

	public void setBidenrolls(Set bidenrolls) {
		this.bidenrolls = bidenrolls;
	}

	public Set getBidtenders() {
		return this.bidtenders;
	}

	public void setBidtenders(Set bidtenders) {
		this.bidtenders = bidtenders;
	}

	public Set getBidpostDetails() {
		return this.bidpostDetails;
	}

	public void setBidpostDetails(Set bidpostDetails) {
		this.bidpostDetails = bidpostDetails;
	}

}
