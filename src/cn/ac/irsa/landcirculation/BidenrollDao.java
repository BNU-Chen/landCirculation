package cn.ac.irsa.landcirculation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionContext;

public class BidenrollDao {
	public static List<Bidenroll> getBidenrollList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<Bidenroll> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Bidenroll.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<Bidenroll>) criteria.list();
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

	public static Bidenroll getBidenroll(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Bidenroll bidenroll = (Bidenroll) session.get(Bidenroll.class, id);
			session.getTransaction().commit();
			return bidenroll;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static Bidenroll deleteBidenroll(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Bidenroll bidenroll = (Bidenroll) session.get(Bidenroll.class, id);

			session.delete(bidenroll);
			session.getTransaction().commit();
			return bidenroll;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateBidenroll(Bidenroll bidenroll) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(bidenroll);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveBidenroll(Bidenroll bidenroll) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(bidenroll);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static boolean isEnrolling(int bidpostId) {

		ActionContext context = ActionContext.getContext();

		UserPerson userPerson = (UserPerson) context.getSession().get("CurrentUserPerson");

		Bidpost bidpost = BidpostDao.getBidpost(bidpostId);

		Session session = HibernateUtil.getSession();
		List<Bidenroll> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Bidenroll.class);
			criteria.add(Restrictions.eq("userPerson", userPerson));
			// criteria.add(Restrictions.eq("userPersonByBidderId",
			// userPerson));
			criteria.add(Restrictions.eq("bidpost", bidpost));
			criteria.addOrder(Order.asc("id"));
			list = (List<Bidenroll>) criteria.list();
			session.getTransaction().commit();

			return (list.size() > 0 ? true : false);
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return false;
		} finally {
			session.close();
		}
	}

	public static String computeBidenrollNo(int bidpostId) {
		String strBidenrollNo = "";
		Bidpost bidpost = BidpostDao.getBidpost(bidpostId);
		Session session = HibernateUtil.getSession();

		List<Bidenroll> list;
		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(Bidenroll.class);
			criteria.add(Restrictions.eq("bidpost", bidpost));
			criteria.add(Restrictions.neOrIsNotNull("status", "0100"));
			criteria.addOrder(Order.desc("id"));
			list = criteria.list();
			session.getTransaction().commit();
			strBidenrollNo += bidpost.getPostNo() + String.format("%04d", list.size() + 1);
			return strBidenrollNo;

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

	public static Bidenroll prenewBidenroll(UserPerson userPerson, int bidpostId) {

		Bidenroll bidenroll = new Bidenroll();
		Bidpost bidpost = BidpostDao.getBidpost(bidpostId);
		bidenroll.setBidpost(bidpost);
		bidenroll.setBidType(bidpost.getBidType());
		bidenroll.setApplyEndDate(bidpost.getApplyEndDate());
		bidenroll.setBidDate(bidpost.getBidDate());
		bidenroll.setUserPersonByBidderId(userPerson);
		bidenroll.setBidderIdcode(userPerson.getUserIdcode());
		bidenroll.setBidderName(userPerson.getUserName());
		bidenroll.setPicIdcode(userPerson.getUserIdcode());
		bidenroll.setPicName(userPerson.getUserName());
		bidenroll.setPicTel(userPerson.getMobilephone());
		bidenroll.setPicEmail(userPerson.getEmail());
		bidenroll.setPicAddress(userPerson.getAddress());

		bidenroll.setUserPersonByReviewerId(UserPersonDao.getUserPerson(bidpost.getUserPerson().getId()));// ����Ͷ�걨�������
		bidenroll.setStatus("0100");
		bidenroll.setStatusMsg("Ͷ�걨����δ�ύ�����ڱ�����ֹ��ǰ�ύ��");

		/*
		 * bidenroll.setEnrollNo(BidenrollDao.computeBidenrollNo(bidpostId));//
		 * ����Ͷ�걨����� bidenroll.setStatus("01");
		 * bidenroll.setStatusMsg("���ڱ�����ֹ��ǰ���ɱ�֤��");
		 */
		BidenrollDao.saveBidenroll(bidenroll);
		bidenroll = BidenrollDao.getBidenroll(bidenroll.getId());
		return bidenroll;
	}

	public static Bidenroll newBidenroll(int bidenrollId) {
		System.out.println("bidenrollId:" + bidenrollId);
		Bidenroll bidenroll = BidenrollDao.getBidenroll(bidenrollId);
		System.out.println("bidenroll.bidpost.id:" + bidenroll.getBidpost().getId());
		bidenroll.setEnrollNo(BidenrollDao.computeBidenrollNo(bidenroll.getBidpost().getId()));// ����Ͷ�걨�����
		bidenroll.setStatus("0101"); // bidenroll.setStatus("01");
		bidenroll.setStatusMsg("���ύ���ȴ���ˣ�");
		BidenrollDao.updateBidenroll(bidenroll);

		bidenroll = BidenrollDao.getBidenroll(bidenroll.getId());
		return bidenroll;
	}

	public static List<Bidenroll> getMyEnrollingBidenrolls(UserPerson userPerson) {
		Session session = HibernateUtil.getSession();

		Calendar today = Calendar.getInstance();// ��ȡ��ǰ��
		today.add(Calendar.DATE, -1);// ��ǰ���ڼ�һ��
		Date date = today.getTime();// Calendar��תΪDate��
		System.out.println("userPerson:" + userPerson.getId());
		List<Bidenroll> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Bidenroll.class);
			criteria.add(Restrictions.eq("userPersonByBidderId", userPerson));
			criteria.add(Restrictions.gt("bidDate", date));
			criteria.add(Restrictions.eq("status", "0100"));
			criteria.addOrder(Order.desc("id"));
			list = (List<Bidenroll>) criteria.list();
			session.getTransaction().commit();
			System.out.println("test �������֣�" + list.size());
			return list;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

	public static List<Bidenroll> getMyEnrolledBidenrolls(UserPerson userPerson) {
		Session session = HibernateUtil.getSession();

		Calendar today = Calendar.getInstance();// ��ȡ��ǰ��
		today.add(Calendar.DATE, -1);// ��ǰ���ڼ�һ��
		Date date = today.getTime();// Calendar��תΪDate��
		System.out.println("userPerson:" + userPerson.getId());
		List<Bidenroll> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Bidenroll.class);
			criteria.add(Restrictions.eq("userPersonByBidderId", userPerson));
			criteria.add(Restrictions.gt("bidDate", date));
			criteria.add(Restrictions.ne("status", "0100"));
			criteria.addOrder(Order.desc("id"));
			list = (List<Bidenroll>) criteria.list();
			session.getTransaction().commit();
			System.out.println("test �������֣�" + list.size());
			return list;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

	public static List<Bidenroll> getToreviewBidenrolls() {
		Session session = HibernateUtil.getSession();

		Calendar today = Calendar.getInstance();// ��ȡ��ǰ��
		today.add(Calendar.DATE, -1);// ��ǰ���ڼ�һ��
		Date date = today.getTime();// Calendar��תΪDate��
		List<Bidenroll> list, list2;
		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(Bidenroll.class);
			criteria.add(Restrictions.gt("bidDate", date));// δ���ڵ�Ͷ�걨������
			criteria.add(Restrictions.eq("status", "0101"));
			criteria.add(Restrictions.isNull("reviewResult"));// δͨ����˵�Ͷ�걨������
			criteria.addOrder(Order.desc("id"));
			list = (List<Bidenroll>) criteria.list();
			session.getTransaction().commit();
			System.out.println("test �������֣�" + list.size());
			return list;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

	public Bidenroll saveBidenrollReview(Bidenroll bidenroll) {

		Bidenroll savedBidenroll = BidenrollDao.getBidenroll(bidenroll.getId());
		switch (bidenroll.getReviewResult())
		{
			case "0":
			{
				bidenroll.setStatus("0201");
				bidenroll.setStatusMsg("���걨�����ͨ����");
				break;
			}
			case "1":
			{
				bidenroll.setStatus("0202");
				bidenroll.setStatusMsg("���걨�����δͨ��");
				break;
			}
		}
		ObjUpdate.update(savedBidenroll, bidenroll);
		BidenrollDao.updateBidenroll(savedBidenroll);// ������˽��
		return savedBidenroll;
	}

	public static List<Bidenroll> getTotendersBidenrollByBidder(UserPerson userPerson) {
		// TODO Auto-generated method stub
		Calendar today = Calendar.getInstance();// ��ȡ��ǰ��
		// today.add(Calendar.DATE, -1);// ��ǰ���ڼ�һ��
		Date date = today.getTime();// Calendar��תΪDate��
		Session session = HibernateUtil.getSession();
		List<Bidenroll> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Bidenroll.class);
			criteria.add(Restrictions.eq("userPersonByBidderId", userPerson));
			criteria.add(Restrictions.eq("bidType", "01"));
			criteria.add(Restrictions.eq("status", "0201"));
			criteria.add(Restrictions.gt("bidDate", date));
			criteria.addOrder(Order.asc("id"));
			list = (List<Bidenroll>) criteria.list();
			session.getTransaction().commit();
			System.out.println("��Ͷ����Ŀ����" + list.size());
			return list;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}
}
