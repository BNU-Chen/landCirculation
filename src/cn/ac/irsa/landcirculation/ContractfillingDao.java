package cn.ac.irsa.landcirculation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class ContractfillingDao {
	public static List<Contractfilling> getContractfillingList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<Contractfilling> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Contractfilling.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<Contractfilling>) criteria.list();
			session.getTransaction().commit();

			return list;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}

	}

	public static Contractfilling getContractfilling(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Contractfilling contractfilling = (Contractfilling) session.get(Contractfilling.class, id);
			session.getTransaction().commit();
			return contractfilling;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static Contractfilling deleteContractfilling(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Contractfilling contractfilling = (Contractfilling) session.get(Contractfilling.class, id);

			session.delete(contractfilling);
			session.getTransaction().commit();
			return contractfilling;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateContractfilling(Contractfilling contractfilling) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(contractfilling);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveContractfilling(Contractfilling contractfilling) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(contractfilling);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static Contractfilling getContractfillingBycontractNo(String strContractNo) {
		Session session = HibernateUtil.getSession();
		List<Contractfilling> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Contractfilling.class);
			criteria.add(Restrictions.eq("contractNo", strContractNo));
			criteria.addOrder(Order.asc("id"));
			list = (List<Contractfilling>) criteria.list();
			session.getTransaction().commit();
			if (list.size() > 0) {
				return list.get(0);
			} else {
				return null;
			}
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

	public static Contractfilling newContractfilling(ContractBase contractBase)// 新建合同备案及初始化
	{
		contractBase = ContractBaseDao.getContractBase(contractBase.getId());
		Contractfilling contractfilling = ContractfillingDao.getContractfillingBycontractNo(contractBase.getContractNo());
		if (contractfilling != null) {
			return contractfilling;
		} else {
			contractfilling = new Contractfilling();
			contractfilling.setApply(contractBase.getApply());
			contractfilling.setContractNo(contractBase.getContractNo());
			contractfilling.setCirculationType(contractBase.getCirculationType());// 流转类型
			contractfilling.setCirculationTypeName(contractBase.getCirculationTypeName());// 流转类型名称
			contractfilling.setTransferType(contractBase.getTransferType());
			contractfilling.setContractNo(contractBase.getContractNo());// 流转合同编号
			contractfilling.setFromDate(contractBase.getFromDate());// 流转起始日期
			contractfilling.setToDate(contractBase.getToDate());// 流转终止日期
			// 转出方信息
			contractfilling.setTransferId(contractBase.getTransferId());
			contractfilling.setTransferIdcode(contractBase.getTransferIdcode());
			contractfilling.setTransferName(contractBase.getTransferName());
			contractfilling.setTransferTel(contractBase.getTransferTel());
			contractfilling.setTransferEmail(contractBase.getTransferEmail());
			contractfilling.setTransferAddress(contractBase.getTransferAddress());
			// 转入方信息
			contractfilling.setTransfeeId(contractBase.getTransfeeId());
			contractfilling.setTransfeeIdcode(contractBase.getTransfeeIdcode());
			contractfilling.setTransfeeName(contractBase.getTransfeeName());
			contractfilling.setTransfeeTel(contractBase.getTransfeeTel());
			contractfilling.setTransfeeEmail(contractBase.getTransfeeEmail());
			contractfilling.setTransfeeAddress(contractBase.getTransfeeAddress());

			switch (contractBase.getCirculationType())
			{
				case "01": // rent 出租
				{
					ContractRent contractRent = ContractRentDao.getContractRentByContractBaseId(contractBase.getId());
					// 面积信息
					contractfilling.setLandArea(contractRent.getLandArea());
					contractfilling.setDrylandArea(contractRent.getDrylandArea());
					contractfilling.setPaddyfieldArea(contractRent.getPaddyfieldArea());
					// 土地地址信息
					contractfilling.setLandAddressCode(contractBase.getLandAddressCode());
					contractfilling.setLandAddressName(contractBase.getLandAddressName());
					contractfilling.setLandProvinceCode(contractBase.getLandProvinceCode());
					contractfilling.setLandProvinceName(contractBase.getLandProvinceName());
					contractfilling.setLandCityCode(contractBase.getLandCityCode());
					contractfilling.setLandCityName(contractBase.getLandCityName());
					contractfilling.setLandCountyCode(contractBase.getLandCountyCode());
					contractfilling.setLandCountyName(contractBase.getLandCountyName());
					contractfilling.setLandTownCode(contractBase.getLandTownCode());
					contractfilling.setLandTownName(contractBase.getLandTownName());
					contractfilling.setLandVillageCode(contractBase.getLandVillageCode());
					contractfilling.setLandVillageName(contractBase.getLandVillageName());

					// 支付信息
					contractfilling.setPayType(contractRent.getPayType());
					contractfilling.setPayType11(contractRent.getPayType11());
					contractfilling.setPayType12(contractRent.getPayType12());
					contractfilling.setPayType13(contractRent.getPayType13());
					contractfilling.setPayType13string(contractRent.getPayType13string());
					contractfilling.setPayType14(contractRent.getPayType14());
					contractfilling.setPayType21(contractRent.getPayType21());
					contractfilling.setPayType22(contractRent.getPayType22());
					contractfilling.setPayType22name(contractRent.getPayType22name());
					contractfilling.setPayType23(contractRent.getPayType23());
					contractfilling.setPayType24(contractRent.getPayType24());
					contractfilling.setPayType25(contractRent.getPayType25());
					contractfilling.setPayType25name(contractRent.getPayType25name());
					contractfilling.setPayType26(contractRent.getPayType26());
					contractfilling.setPayType27(contractRent.getPayType27());
					contractfilling.setPayType31(contractRent.getPayType31());
					break;
				}
				case "02": // share 入股
				{
					break;
				}

				case "03": // assignment 转让
				{
					break;
				}
				case "04": // subcontract 转包
				{
					break;
				}
				case "05": // exchange 交换
				{
					break;
				}

			}

			ContractfillingDao.saveContractfilling(contractfilling);
			contractfilling = ContractfillingDao.getContractfillingBycontractNo(contractBase.getContractNo());
			Workflow.setCurrentStatus(contractfilling.getApply(), "010505", "01050501");
			return contractfilling;
		}
	}

	public static String ComputeContractfillingSN(Contractfilling contractfilling) {// 计算合同顺序号

		contractfilling = ContractfillingDao.getContractfilling(contractfilling.getId());

		Session session = HibernateUtil.getSession();
		Date today = new Date(), startdate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		try {
			startdate = sdf.parse(sdf.format(today));

		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("当前日期date：" + startdate.toString());
		// System.out.println("当前日期today：" + today);
		List<ContractBase> list;
		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(Contractfilling.class);
			criteria.add(Restrictions.gt("approvedDate", startdate));
			criteria.add(Restrictions.eq("reviewResult", "0"));
			criteria.add(Restrictions.eq("landTownCode", contractfilling.getLandTownCode()));
			criteria.addOrder(Order.desc("id"));
			list = criteria.list();
			session.getTransaction().commit();
			return String.format("%05d", list.size());

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

	public static void setContrctfillingNo(Contractfilling contractfilling) {
		contractfilling = ContractfillingDao.getContractfilling(contractfilling.getId());
		String contractSN = ContractfillingDao.ComputeContractfillingSN(contractfilling);
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String year = sdf.format(today);
		try {
			if (contractfilling.getContractfillingNo().contentEquals("")) {// contractNo为空时，定会抛出异常

				contractfilling.setContractfillingNo(year + contractfilling.getLandTownCode() + contractSN);
				ContractfillingDao.updateContractfilling(contractfilling);

			}
		} catch (Exception e) {

			contractfilling.setContractfillingNo(year + contractfilling.getLandTownCode() + contractSN);
			ContractfillingDao.updateContractfilling(contractfilling);
		}
	}

	public static Contractfilling getContractfillingByApplyId(int applyId) {
		// TODO Auto-generated method stub
		Apply apply = ApplyDao.getApply(applyId);
		Session session = HibernateUtil.getSession();
		List<Contractfilling> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Contractfilling.class);
			criteria.add(Restrictions.eq("apply", apply));
			criteria.addOrder(Order.desc("id"));
			list = (List<Contractfilling>) criteria.list();
			session.getTransaction().commit();
			if (list.size() > 0) {
				return list.get(0);
			} else
				return null;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

	public static List<Contractfilling> getPassedContractfillingsByTransfeeId(int transfeeId) {
		// TODO Auto-generated method stub
		// UserPerson transfee=UserPersonDao.getUserPerson(transfeeId);
		Date today = new Date();
		Session session = HibernateUtil.getSession();
		List<Contractfilling> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Contractfilling.class);
			criteria.add(Restrictions.eq("transfeeId", transfeeId));//只查指定转入方的
			criteria.add(Restrictions.lt("fromDate", today));//流转起始时间早于今天
			criteria.add(Restrictions.gt("toDate", today));//流转终止时间易于今天
			criteria.add(Restrictions.eq("reviewResult", "0"));//流转合同网上备案通过的
			criteria.addOrder(Order.desc("id"));
			list = (List<Contractfilling>) criteria.list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}
	
	public static Contractfilling getContractfillingByContractNo(String strContractNo)
	{
		
		Session session = HibernateUtil.getSession();
		List<Contractfilling> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Contractfilling.class);
			criteria.add(Restrictions.eq("contractNo", strContractNo));
			criteria.addOrder(Order.desc("id"));
			list = (List<Contractfilling>) criteria.list();
			session.getTransaction().commit();
			if (list.size() > 0) {
				return list.get(0);
			} else
				return null;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}
}
