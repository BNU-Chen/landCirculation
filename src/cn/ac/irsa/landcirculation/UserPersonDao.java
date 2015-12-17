package cn.ac.irsa.landcirculation;

import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionContext;

public class UserPersonDao {
	public static List<UserPerson> getUserPersonList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<UserPerson> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(UserPerson.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<UserPerson>) criteria.list();
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

	public static UserPerson getUserPerson(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			UserPerson userPerson = (UserPerson) session.get(UserPerson.class, id);
			session.getTransaction().commit();
			return userPerson;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static UserPerson getUserPersonByUserIdcode(String userIdcode) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<UserPerson> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(UserPerson.class);
			criteria.add(Restrictions.eq("userIdcode", userIdcode));
			criteria.addOrder(Order.asc("id"));
			list = (List<UserPerson>) criteria.list();
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

	public static UserPerson deleteUserPerson(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			UserPerson userPerson = (UserPerson) session.get(UserPerson.class, id);

			session.delete(userPerson);
			session.getTransaction().commit();
			return userPerson;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateUserPerson(UserPerson userPerson) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(userPerson);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveUserPerson(UserPerson userPerson) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		Criteria criteria = session.createCriteria(UserPerson.class);
		criteria.add(Restrictions.eq("userIdcode", userPerson.getUserIdcode())).add(Restrictions.eq("password", userPerson.getPassword()));

		List<UserPerson> userPersons = criteria.list();

		if (userPersons.isEmpty()) {
			try {
				session.beginTransaction();
				session.save(userPerson);
				session.getTransaction().commit();

			} catch (Exception e) {
				session.getTransaction().rollback();
				e.printStackTrace();

			} finally {
				session.close();
			}
		}

	}

	public static UserPerson login(UserPerson userPerson) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(UserPerson.class);
			criteria.add(Restrictions.eq("userIdcode", userPerson.getUserIdcode()));
			criteria.add(Restrictions.eq("password", userPerson.getPassword()));
			List<UserPerson> userPersons = criteria.list();
			session.getTransaction().commit();
			System.out.println("ÓÐÃ»ÓÐ£¿"+userPersons.size());
			if (userPersons.isEmpty()) {
				return null;
			} else {
				ActionContext context = ActionContext.getContext();
				context.getSession().put("CurrentUserPerson", userPersons.get(0));
				return userPersons.get(0);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	public static UserPerson exit(String userID) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		try {

			Criteria criteria = session.createCriteria(UserPerson.class);
			criteria.add(Restrictions.eq("userIdcode", userID));

			List<UserPerson> userPersons = criteria.list();

			if (userPersons.isEmpty()) {
				return null;
			} else {
				return userPersons.get(0);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}
}
