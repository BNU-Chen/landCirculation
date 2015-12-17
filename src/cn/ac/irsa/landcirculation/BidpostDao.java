package cn.ac.irsa.landcirculation;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class BidpostDao {
	public static List<Bidpost> getBidpostList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<Bidpost> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Bidpost.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<Bidpost>) criteria.list();
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

	public static Bidpost getBidpost(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Bidpost bidpost = (Bidpost) session.get(Bidpost.class, id);
			session.getTransaction().commit();
			return bidpost;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static Bidpost deleteBidpost(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Bidpost bidpost = (Bidpost) session.get(Bidpost.class, id);

			session.delete(bidpost);
			session.getTransaction().commit();
			return bidpost;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateBidpost(Bidpost bidpost) {
		// TODO Auto-generated method stub
		switch (bidpost.getBidType())
		{
			case "01":
				bidpost.setBidTypename("�����б�");
				break;
			case "02":
				bidpost.setBidTypename("����");
				break;
			case "03":
				bidpost.setBidTypename("������̸��");
				break;
		}

		Session session = HibernateUtil.getSession();
		try {
			session.beginTransaction();
			session.update(bidpost);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveBidpost(Bidpost bidpost) {
		// TODO Auto-generated method stub
		
	

		Session session = HibernateUtil.getSession();
		try {
			session.beginTransaction();
			session.save(bidpost);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static Bidpost getBidpostByPosterId(int posterId) {// ���ݷ����˲�ѯ�䷢��
																// �����¹���
		UserPerson userPerson = UserPersonDao.getUserPerson(posterId);
		Session session = HibernateUtil.getSession();
		List<Bidpost> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Bidpost.class);
			criteria.add(Restrictions.eq("userPerson", userPerson));
			criteria.add(Restrictions.eqOrIsNull("status", "01"));
			criteria.addOrder(Order.desc("id"));// ���򣬱�֤��һ���������µ�
			list = (List<Bidpost>) criteria.list();
			session.getTransaction().commit();

			if (!list.isEmpty()) {
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

	public static List<Bidpost> getTopostBidpostsByPosterId(int posterId) {
		UserPerson userPerson = UserPersonDao.getUserPerson(posterId);
		Session session = HibernateUtil.getSession();
		List<Bidpost> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Bidpost.class);
			criteria.add(Restrictions.eq("userPerson", userPerson));
			criteria.add(Restrictions.eq("status", "01"));
			criteria.addOrder(Order.asc("id"));
			list = (List<Bidpost>) criteria.list();
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

	public static List<Bidpost> getPostingBidpostsByPosterId(int posterId) {
		UserPerson userPerson = UserPersonDao.getUserPerson(posterId);
		Session session = HibernateUtil.getSession();
		List<Bidpost> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Bidpost.class);
			criteria.add(Restrictions.eq("userPerson", userPerson));
			criteria.add(Restrictions.eq("status", "01"));
			criteria.addOrder(Order.asc("id"));
			list = (List<Bidpost>) criteria.list();
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

	public static List<Bidpost> getPostedBidpostsByPosterId(int posterId) {
		UserPerson userPerson = UserPersonDao.getUserPerson(posterId);
		Session session = HibernateUtil.getSession();
		List<Bidpost> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Bidpost.class);
			criteria.add(Restrictions.eq("userPerson", userPerson));
			criteria.add(Restrictions.eq("status", "02"));
			criteria.addOrder(Order.asc("id"));
			list = (List<Bidpost>) criteria.list();
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

	public static List<Bidpost> GetToAnnounceBidposts() {
		Session session = HibernateUtil.getSession();
		// Calendar
		// today=Calendar.getInstance(TimeZone.getTimeZone("GMT+08:00"));
		Calendar today = Calendar.getInstance();
		today.toString();
		// Date date = today.getTime();

		// DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// String today=df.format(date );
		Date date = new Date();
		System.out.println("��ǰ����date��" + date);
		// System.out.println("��ǰ����today��" + today);
		List<Bidpost> list;
		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(Bidpost.class);
			criteria.add(Restrictions.lt("bidDate", date));
			criteria.addOrder(Order.desc("id"));
			list = criteria.list();
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

	public static String ComputeBidpostNo() {
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
		List<Bidpost> list;
		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(Bidpost.class);
			criteria.add(Restrictions.gt("bidDate", startdate));
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

	public static List<Bidpost> getToenrollBidpost() {// ��ȡ�ɱ�������
		Session session = HibernateUtil.getSession();
		Calendar today = Calendar.getInstance();// ��ȡ��ǰ��
		today.add(Calendar.DATE, -1);// ��ǰ���ڼ�һ��
		Date date = today.getTime();// Calendar��תΪDate��
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println("��������date��" + df.format(date));
		// System.out.println("��ǰ����today��" + today);
		List<Bidpost> list;
		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(Bidpost.class);
			criteria.add(Restrictions.gt("applyEndDate", date));// �ڱ�����ֹ��ǰ
			criteria.add(Restrictions.eq("status", "02"));// ״̬�ѷ���
			criteria.addOrder(Order.desc("id"));
			list = criteria.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}

		for (int i = 0; i < list.size(); i++) {
			if (BidenrollDao.isEnrolling(list.get(i).getId()))// �ѱ���
			{
				list.remove(i);// ���б���ɾ��
				i--;
			}
		}
		return list;
	}

	public static List<Bidpost> getToopenBidpost() {// ��ȡ�����깫���б���Ŀ�����棩
		Session session = HibernateUtil.getSession();
		Calendar today = Calendar.getInstance();// ��ȡ��ǰ��
		Date date = today.getTime();// Calendar��תΪDate��
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println("��ǰ����ʱ��date��" + df.format(date));
		// System.out.println("��ǰ����today��" + today);
		List<Bidpost> list;
		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(Bidpost.class);
			criteria.add(Restrictions.lt("bidDate", date));// �ڿ���ʱ��֮��
			criteria.add(Restrictions.eq("status", "02"));// ״̬�ѷ���
			criteria.addOrder(Order.desc("id"));
			list = criteria.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}

		return list;
	}

	public static List<Bidpost> getTocloseBidpost() {
		Session session = HibernateUtil.getSession();
		List<Bidpost> list;
		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(Bidpost.class);
			criteria.add(Restrictions.eq("status", "03"));// ״̬�ѷ���
			criteria.addOrder(Order.desc("id"));
			list = criteria.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
		return list;
	}
	
	public static List<Bidpost> getClosedBidpost(int posterId) {
		UserPerson userPerson = UserPersonDao.getUserPerson(posterId);
		Session session = HibernateUtil.getSession();
		List<Bidpost> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Bidpost.class);
			criteria.add(Restrictions.eq("userPerson", userPerson));
			criteria.add(Restrictions.eq("status", "04"));
			criteria.addOrder(Order.desc("id"));
			list = (List<Bidpost>) criteria.list();
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
}
