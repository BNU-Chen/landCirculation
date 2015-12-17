package cn.ac.irsa.landcirculation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class ContractBaseDao {
	public static List<ContractBase> getContractBaseList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<ContractBase> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(ContractBase.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<ContractBase>) criteria.list();
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

	public static ContractBase getContractBase(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			ContractBase contractBase = (ContractBase) session.get(ContractBase.class, id);
			session.getTransaction().commit();
			return contractBase;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static ContractBase deleteContractBase(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			ContractBase contractBase = (ContractBase) session.get(ContractBase.class, id);

			session.delete(contractBase);
			session.getTransaction().commit();
			return contractBase;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateContractBase(ContractBase contractBase) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(contractBase);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveContractBase(ContractBase contractBase) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(contractBase);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static ContractBase getContractBaseByApplyId(int applyId) {
		// TODO Auto-generated method stub

		Apply apply = ApplyDao.getApply(applyId);
		Session session = HibernateUtil.getSession();
		List<ContractBase> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(ContractBase.class);
			criteria.add(Restrictions.eq("apply", apply));
			criteria.addOrder(Order.desc("id"));
			list = (List<ContractBase>) criteria.list();
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

	public static ContractBase newContractBase(Apply apply) {
		apply = ApplyDao.getApply(apply.getId());
		ContractBase contractBase;
		contractBase = new ContractBase();
		// ��������ID
		contractBase.setApply(apply);
		// ������ת����
		contractBase.setCirculationType(apply.getCirculationType());
		contractBase.setCirculationTypeName(apply.getCirculationTypeName());
		contractBase.setTransferType(apply.getTransferType());
		// ���������˻�����Ϣ
		contractBase.setTransferId(apply.getUserPerson().getId());
		contractBase.setTransferIdcode(apply.getApplierIdcode());
		contractBase.setTransferName(apply.getApplierUserName());
		UserPerson transfer = UserPersonDao.getUserPerson(contractBase.getTransferId());
		contractBase.setTransferTel(transfer.getMobilephone());
		contractBase.setTransferAddress(transfer.getAddress());
		// ����������ί�д�������Ϣ

		// ������ת���ػ�����Ϣ
		System.out.println("ִ���ˣ�");
		contractBase.setLandAddressCode(apply.getLandRegionCode());
		contractBase.setLandAddressName(apply.getLandAddress());
		contractBase.setLandRgArea(apply.getLandRgArea());
		contractBase.setDrylandRgArea(apply.getDrylandRgArea());
		contractBase.setPaddyfieldRgArea(apply.getPaddyfieldRgArea());
		contractBase.setLandRealArea(apply.getLandRealArea());
		contractBase.setDrylandRealArea(apply.getDrylandRealArea());
		contractBase.setPaddyfieldRealArea(apply.getPaddyfieldRealArea());
		contractBase.setLandNumber(apply.getLandNumber());
		contractBase.setLandAddressName(apply.getLandAddress());
		contractBase.setLandAddressCode(apply.getLandRegionCode());
		// ����Ȩ����֤��Ϣ
		contractBase.setRightAuthType(apply.getRightAuthType());
		contractBase.setLandContractCode(apply.getLandContractCode());
		contractBase.setLandwarrant(apply.getLandwarrant());
		contractBase.setLandWarrantCode(apply.getLandWarrantCode());

		System.out.println("apply.getTransferType():" + apply.getTransferType());

		if (apply.getTransferType().contentEquals("1")) {// ί����ת

			// ��ѯ�б�����Ϣ
			BidpostDetail bidpostDetail = BidpostDetailDao.getBidpostDetailByApplyId(apply.getId());// �������Ӧ���깫����ϸ
			Bidpost bidpost = BidpostDao.getBidpost(bidpostDetail.getBidpost().getId());// ���깫����ϸ��Ӧ�ľ��깫��
			System.out.println("bidpost:" + bidpost.getId());
			Bidwinnerpost bidwinnerpost = BidwinnerpostDao.getBidwinnerpostByBidpostId(bidpost.getId());// ���ݾ��깫���ѯ�б���
			System.out.println("bidwinnerpost:" + bidwinnerpost.getId());
			// ����ת�뷽��Ϣ
			contractBase.setTransfeeId(bidwinnerpost.getBidderId());
			contractBase.setTransfeeIdcode(bidwinnerpost.getBidderIdcode());
			contractBase.setTransfeeName(bidwinnerpost.getBidderName());
			UserPerson transfee = UserPersonDao.getUserPerson(bidwinnerpost.getBidderId());
			contractBase.setTransfeeTel(transfee.getMobilephone());
			// ����ת�뷽ί�д�������Ϣ
			ContractBaseDao.saveContractBase(contractBase);// �½���ͬ��¼

			contractBase = ContractBaseDao.getContractBaseByApplyId(apply.getId());// ��ȡ�ս����ĺ�ͬ��¼
			switch (contractBase.getCirculationType())
			{
				case "01"://rent ����
				{
					ContractRent contractRent = ContractRentDao.getContractRentByContractBaseId(contractBase.getId());
					contractRent.setPayType(1);
					System.out.println("bidwinnerpost:" + bidwinnerpost.getId());
					contractRent.setPayType11(bidwinnerpost.getPaddyfieldprice());
					contractRent.setPayType12(bidwinnerpost.getDrylandprice());
					long totalPrice = (long) (contractBase.getPaddyfieldRgArea() * bidwinnerpost.getPaddyfieldprice() + contractBase.getDrylandRgArea() * bidwinnerpost.getDrylandprice() + 0.5);
					contractRent.setPayType13(totalPrice);
					contractRent.setPayType14(bidwinnerpost.getIncreaserate());

					contractRent.setContractBreach31(bidwinnerpost.getDeposit());// Ͷ�걣֤��ת����Լ��֤��
					contractRent.setContractBreach41(bidwinnerpost.getDeposit());// Ͷ�걣֤��ת����Լ��֤��
					ContractRentDao.updateContractRent(contractRent);
					break;

				}
				case "02": //share ���
				 {
					 break;
				 }
				 
				 case "03": //assignment ת��
				 {
					 break;
				 }
				 case "04": //subcontract ת��
				 {
					 break;
				 }
				 case "05": // exchange ����
				 {
					 break;
				 }
			}
		} else {

			ContractBaseDao.saveContractBase(contractBase);// �½���ͬ��¼
		}

		return ContractBaseDao.getContractBaseByApplyId(apply.getId());// �����½��ĺ�ͬ

	}

	public static void synchronizeContractbase(Apply apply) {
		apply = ApplyDao.getApply(apply.getId());
		ContractBase contractBase = ContractBaseDao.getContractBaseByApplyId(apply.getId());
		// ������ת���ػ�����Ϣ
		contractBase.setLandAddressCode(apply.getLandRegionCode());
		contractBase.setLandAddressName(apply.getLandAddress());
		contractBase.setLandRgArea(apply.getLandRgArea());
		contractBase.setDrylandRgArea(apply.getDrylandRgArea());
		contractBase.setPaddyfieldRgArea(apply.getPaddyfieldRgArea());
		contractBase.setLandNumber(apply.getLandNumber());
		// ����Ȩ����֤��Ϣ
		contractBase.setRightAuthType(apply.getRightAuthType());
		contractBase.setLandContractCode(apply.getLandContractCode());
		contractBase.setLandwarrant(apply.getLandwarrant());
		contractBase.setLandWarrantCode(apply.getLandWarrantCode());

	}

	public static void submitContract(ContractBase contractBase )
	{
		contractBase=ContractBaseDao.getContractBase(contractBase.getId());
		//Apply currentApply=ApplyDao.getApply(contractBase.getApply().getId());
		Workflow.setCurrentStatus(contractBase.getApply(), "010502", "01050201");//�޸������鹤����״̬
	}
	
	public static String ComputeContractSN(ContractBase contractBase) {// �����ͬ˳���

		contractBase = ContractBaseDao.getContractBase(contractBase.getId());

		Session session = HibernateUtil.getSession();
		Date today = new Date(), startdate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		try {
			startdate = sdf.parse(sdf.format(today));

		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("��ǰ����date��" + startdate.toString());
		// System.out.println("��ǰ����today��" + today);
		List<ContractBase> list;
		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(ContractBase.class);
			criteria.add(Restrictions.gt("approvedDate", startdate));
			criteria.add(Restrictions.eq("reviewResult", "0"));
			criteria.add(Restrictions.eq("landTownCode", contractBase.getLandTownCode()));
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

	public static void setContrctNo(ContractBase contractBase) {
		contractBase = ContractBaseDao.getContractBase(contractBase.getId());
		String contractSN = ContractBaseDao.ComputeContractSN(contractBase);
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String year=sdf.format(today);
		try {
			if (contractBase.getContractNo().contentEquals("")) {// contractNoΪ��ʱ�������׳��쳣

				contractBase.setContractNo(year+contractBase.getLandTownCode() + contractSN);
				ContractBaseDao.updateContractBase(contractBase);

			}
		} catch (Exception e) {

			contractBase.setContractNo(year+contractBase.getLandTownCode() + contractSN);
			ContractBaseDao.updateContractBase(contractBase);
		}
	}
}
