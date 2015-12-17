package cn.ac.irsa.landcirculation;

// Generated 2015-3-14 18:18:07 by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

/**
 * Home object for domain model class BidpostDetail.
 * @see cn.ac.irsa.landcirculation.BidpostDetail
 * @author Hibernate Tools
 */
public class BidpostDetailHome {

	private static final Log		log				= LogFactory.getLog(BidpostDetailHome.class);

	private final SessionFactory	sessionFactory	= getSessionFactory();

	protected SessionFactory getSessionFactory() {
		try {
			return (SessionFactory) new InitialContext().lookup("SessionFactory");
		} catch (Exception e) {
			log.error("Could not locate SessionFactory in JNDI", e);
			throw new IllegalStateException("Could not locate SessionFactory in JNDI");
		}
	}

	public void persist(BidpostDetail transientInstance) {
		log.debug("persisting BidpostDetail instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(BidpostDetail instance) {
		log.debug("attaching dirty BidpostDetail instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(BidpostDetail instance) {
		log.debug("attaching clean BidpostDetail instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(BidpostDetail persistentInstance) {
		log.debug("deleting BidpostDetail instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public BidpostDetail merge(BidpostDetail detachedInstance) {
		log.debug("merging BidpostDetail instance");
		try {
			BidpostDetail result = (BidpostDetail) sessionFactory.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public BidpostDetail findById(java.lang.Integer id) {
		log.debug("getting BidpostDetail instance with id: " + id);
		try {
			BidpostDetail instance = (BidpostDetail) sessionFactory.getCurrentSession().get("cn.ac.irsa.landcirculation.BidpostDetail", id);
			if (instance == null) {
				log.debug("get successful, no instance found");
			} else {
				log.debug("get successful, instance found");
			}
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(BidpostDetail instance) {
		log.debug("finding BidpostDetail instance by example");
		try {
			List results = sessionFactory.getCurrentSession().createCriteria("cn.ac.irsa.landcirculation.BidpostDetail").add(Example.create(instance)).list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
