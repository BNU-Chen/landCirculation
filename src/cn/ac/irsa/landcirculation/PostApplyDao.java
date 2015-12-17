package cn.ac.irsa.landcirculation;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class PostApplyDao {
	public static List<PostApply> getPostApplyList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<PostApply> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(PostApply.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<PostApply>) criteria.list();
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

	public static PostApply getPostApply(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			PostApply postApply = (PostApply) session.get(PostApply.class, id);
			session.getTransaction().commit();
			return postApply;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static PostApply getPostApplyByPosterId(int posterId) {
		// TODO Auto-generated method stub

		UserPerson userPerson = UserPersonDao.getUserPerson(posterId);
		Session session = HibernateUtil.getSession();
		List<PostApply> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(PostApply.class);
			criteria.add(Restrictions.eq("userPerson", userPerson));
			criteria.addOrder(Order.desc("id"));
			list = (List<PostApply>) criteria.list();
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

	public static PostApply getTobepostPostApplyByPosterId(int posterId) {
		// TODO Auto-generated method stub

		UserPerson userPerson = UserPersonDao.getUserPerson(posterId);
		Session session = HibernateUtil.getSession();
		List<PostApply> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(PostApply.class);
			criteria.add(Restrictions.eq("userPerson", userPerson));
			criteria.add(Restrictions.eq("status", "01"));
			criteria.addOrder(Order.desc("id"));
			list = (List<PostApply>) criteria.list();
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

	public static List<PostApply> getPostingPostApplysByPosterId(int posterId) {
		// TODO Auto-generated method stub

		UserPerson userPerson = UserPersonDao.getUserPerson(posterId);
		Session session = HibernateUtil.getSession();
		List<PostApply> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(PostApply.class);
			criteria.add(Restrictions.eq("userPerson", userPerson));
			criteria.add(Restrictions.eq("status", "02"));
			criteria.addOrder(Order.desc("id"));
			list = (List<PostApply>) criteria.list();
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

	public static List<Apply> getApplysByPostApplyId(int postApplyId) {
		// TODO Auto-generated method stub

		List<PostdetailApply> applyPostDetails = PostdetailApplyDao.getPostdetailApplyListByPostApplyId(postApplyId);
		List<Apply> listApply = new ArrayList();
		for (int i = 0; i < applyPostDetails.size(); i++) {
			listApply.add(applyPostDetails.get(i).getApply());
		}
		return listApply;
	}

	public static List<PostApply> getPostedPostApplysByPosterId(int posterId) {
		// TODO Auto-generated method stub

		UserPerson userPerson = UserPersonDao.getUserPerson(posterId);
		Session session = HibernateUtil.getSession();
		List<PostApply> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(PostApply.class);
			criteria.add(Restrictions.eq("userPerson", userPerson));
			criteria.add(Restrictions.eq("status", "02"));
			criteria.addOrder(Order.desc("id"));
			list = (List<PostApply>) criteria.list();
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

	public static PostApply deletePostApply(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			PostApply postApply = (PostApply) session.get(PostApply.class, id);

			session.delete(postApply);
			session.getTransaction().commit();
			return postApply;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updatePostApply(PostApply postApply) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(postApply);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void savePostApply(PostApply postApply) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(postApply);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static List<PostApply> GetToAnnounceApplyposts() {
		Session session = HibernateUtil.getSession();
		// Calendar
		// today=Calendar.getInstance(TimeZone.getTimeZone("GMT+08:00"));
		Calendar today = Calendar.getInstance();
		today.toString();
		// Date date = today.getTime();

		// DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// String today=df.format(date );
		Date date = new Date();
		System.out.println("当前日期date：" + date);
		// System.out.println("当前日期today：" + today);
		List<PostApply> list;
		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(PostApply.class);
			criteria.add(Restrictions.lt("endDate", date));
			criteria.addOrder(Order.desc("id"));
			list = (List<PostApply>) criteria.list();
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
