package cn.ac.irsa.landcirculation;

import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class TransfereePersonDao {
	public static List<TransfereePerson> getTransfereePersonList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<TransfereePerson> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(TransfereePerson.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<TransfereePerson>) criteria.list();
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

	public static TransfereePerson getTransfereePerson(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			TransfereePerson transfereePerson = (TransfereePerson) session.get(TransfereePerson.class, id);
			session.getTransaction().commit();
			return transfereePerson;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static TransfereePerson getTransfereePersonByTransfereeIdcode(String transfereeIdcode) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<TransfereePerson> list;
		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(TransfereePerson.class);
			criteria.add(Restrictions.eq("transfereeIdcode", transfereeIdcode));
			criteria.addOrder(Order.desc("id"));
			list = (List<TransfereePerson>) criteria.list();
			session.getTransaction().commit();
			if (!list.isEmpty()) {// 有记录，直接返回
				return list.get(0);
			} else {// 没记录
				TransfereePerson transfereePerson = new TransfereePerson();
				TransfereePersonDao.saveTransfereePerson(transfereePerson);// 新建一空记录
				return transfereePerson;
			}
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static TransfereePerson getTransfereePerson(String transfereeIdcode) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(TransfereePerson.class);
			criteria.add(Restrictions.eq("transfereeIdcode", transfereeIdcode));
			List<TransfereePerson> transfereePersons = criteria.list();
			session.getTransaction().commit();

			if (!transfereePersons.isEmpty()) {
				return transfereePersons.get(0);
			} else {
				return null;
			}

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static TransfereePerson deleteTransfereePerson(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			TransfereePerson transfereePerson = (TransfereePerson) session.get(TransfereePerson.class, id);

			session.delete(transfereePerson);
			session.getTransaction().commit();
			return transfereePerson;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateTransfereePerson(TransfereePerson transfereePerson) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(transfereePerson);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveTransfereePerson(TransfereePerson transfereePerson) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(transfereePerson);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static TransfereePerson getTransfereePersonNew() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<TransfereePerson> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(TransfereePerson.class);
			criteria.addOrder(Order.desc("id"));
			list = (List<TransfereePerson>) criteria.list();
			session.getTransaction().commit();

			return list.get(0);
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}

	}

}
