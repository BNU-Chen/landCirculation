package cn.ac.irsa.landcirculation;

import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class ConpensationRecordDao {
	public static List<ConpensationRecord> getConpensationRecordList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<ConpensationRecord> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(ConpensationRecord.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<ConpensationRecord>) criteria.list();
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

	public static ConpensationRecord getConpensationRecord(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			ConpensationRecord conpensationRecord = (ConpensationRecord) session.get(ConpensationRecord.class, id);
			session.getTransaction().commit();
			return conpensationRecord;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static ConpensationRecord deleteConpensationRecord(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			ConpensationRecord conpensationRecord = (ConpensationRecord) session.get(ConpensationRecord.class, id);

			session.delete(conpensationRecord);
			session.getTransaction().commit();
			return conpensationRecord;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updateConpensationRecord(ConpensationRecord conpensationRecord) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(conpensationRecord);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void saveConpensationRecord(ConpensationRecord conpensationRecord) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(conpensationRecord);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static ConpensationRecord getConpensationRecordByContractNo(String strContractNo) {
		Session session = HibernateUtil.getSession();
		List<ConpensationRecord> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(ConpensationRecord.class);
			criteria.add(Restrictions.eq("contractNo", strContractNo));
			criteria.addOrder(Order.asc("id"));
			list = (List<ConpensationRecord>) criteria.list();
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
