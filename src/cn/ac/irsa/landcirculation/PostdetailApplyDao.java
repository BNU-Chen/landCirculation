package cn.ac.irsa.landcirculation;

import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class PostdetailApplyDao {
	public static List<PostdetailApply> getPostdetailApplyList() {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		List<PostdetailApply> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(PostdetailApply.class);
			criteria.addOrder(Order.asc("id"));
			list = (List<PostdetailApply>) criteria.list();
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

	public static List<PostdetailApply> getPostdetailApplyListByPostApplyId(int postApplyId) {
		// TODO Auto-generated method stub
		PostApply currentPostApply = PostApplyDao.getPostApply(postApplyId);
		Session session = HibernateUtil.getSession();
		List<PostdetailApply> list;
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(PostdetailApply.class);
			criteria.add(Restrictions.eq("postApply", currentPostApply));
			criteria.addOrder(Order.asc("id"));
			list = (List<PostdetailApply>) criteria.list();
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

	public static PostdetailApply getPostdetailApply(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			PostdetailApply postdetailApply = (PostdetailApply) session.get(PostdetailApply.class, id);
			session.getTransaction().commit();
			return postdetailApply;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static PostdetailApply deletePostdetailApply(int id) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			PostdetailApply postdetailApply = (PostdetailApply) session.get(PostdetailApply.class, id);

			session.delete(postdetailApply);
			session.getTransaction().commit();
			return postdetailApply;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return null;
	}

	public static void updatePostdetailApply(PostdetailApply postdetailApply) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.update(postdetailApply);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void savePostdetailApply(PostdetailApply postdetailApply) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();

		try {
			session.beginTransaction();
			session.save(postdetailApply);
			session.getTransaction().commit();

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

	}

	public static void calculatePostResponse(int postApplyId) {

		PostApply postApply = PostApplyDao.getPostApply(postApplyId);
		List<PostdetailApply> list = null;
		PostdetailApply postdetailApply = null;
		System.out.println("postApplyId:" + postApplyId);
		Session session = HibernateUtil.getSession();
		try {
			session.beginTransaction();

			Criteria criteria = session.createCriteria(PostdetailApply.class);
			criteria.add(Restrictions.eq("postApply", postApply));
			criteria.addOrder(Order.asc("id"));
			list = (List<PostdetailApply>) criteria.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		System.out.println("size:" + list.size());
		List<ApplypostResponse> lstApplypostResponses = null;
		for (int i = 0; i < list.size(); i++) {
			postdetailApply = list.get(i);
			lstApplypostResponses = ApplypostResponseDao.getApplypostResponseByApplyId(postdetailApply.getApply().getId());
			System.out.println("lstApplypostResponses size" + lstApplypostResponses.size());
			int propertreat = 0, objection = 0, nottreat = 0;
			for (int j = 0; j < lstApplypostResponses.size(); j++) {
				if (lstApplypostResponses.get(j).getDealType() == "0") {
					propertreat += 1;
				} else if (lstApplypostResponses.get(j).getDealType() == "1") {
					objection += 1;
				} else {
					nottreat += 1;
				}
			}
			postdetailApply.setResponseNumber(lstApplypostResponses.size());
			postdetailApply.setPropertreatNumber(propertreat);
			postdetailApply.setObjectionNumber(objection);
			postdetailApply.setNottreatNumber(nottreat);
			if (nottreat == 0 && objection == 0) {
				postdetailApply.setResultCode("01");
				Workflow.setCurrentStatus(postdetailApply.getApply(), "010303", "01030301");
			} else {
				postdetailApply.setResultCode("02");
				Workflow.setCurrentStatus(postdetailApply.getApply(), "010304", "01030401");
			}
			PostdetailApplyDao.updatePostdetailApply(postdetailApply);
		}

	}

}
