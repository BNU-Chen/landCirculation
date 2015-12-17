package cn.ac.irsa.landcirculation;

import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class RtnmsgdefDao {
	public static List<Rtnmsgdef> getRtnmsgdefList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<Rtnmsgdef> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(Rtnmsgdef.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<Rtnmsgdef>) criteria.list();
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

	public static Rtnmsgdef getRtnmsgdef(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Rtnmsgdef rtnmsgdef = (Rtnmsgdef) session.get(Rtnmsgdef.class, id);
			session.getTransaction().commit();
			return rtnmsgdef;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

		public static Rtnmsgdef getRtnmsgdefByMsgCode(String msgCode)
		{
			Session session = HibernateUtil.getSession();
			List<Rtnmsgdef> list;
			try {
				session.beginTransaction();

				Criteria criteria = session.createCriteria(Rtnmsgdef.class);
				criteria.add(Restrictions.eq("msgCode", msgCode));
				criteria.addOrder(Order.asc("id"));
				list = criteria.list();
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
	public static Rtnmsgdef deleteRtnmsgdef(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Rtnmsgdef rtnmsgdef = (Rtnmsgdef) session.get(Rtnmsgdef.class, id);

			session.delete(rtnmsgdef);
			session.getTransaction().commit();
			return rtnmsgdef;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateRtnmsgdef(Rtnmsgdef rtnmsgdef) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(rtnmsgdef);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveRtnmsgdef(Rtnmsgdef rtnmsgdef) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(rtnmsgdef);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

}
