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
 * Home object for domain model class TransfereeCompany.
 * @see cn.ac.irsa.landcirculation.TransfereeCompany
 * @author Hibernate Tools
 */
public class TransfereeCompanyHome {

	private static final Log		log				= LogFactory.getLog(TransfereeCompanyHome.class);

	private final SessionFactory	sessionFactory	= getSessionFactory();

	protected SessionFactory getSessionFactory() {
		try {
			return (SessionFactory) new InitialContext().lookup("SessionFactory");
		} catch (Exception e) {
			log.error("Could not locate SessionFactory in JNDI", e);
			throw new IllegalStateException("Could not locate SessionFactory in JNDI");
		}
	}

	public void persist(TransfereeCompany transientInstance) {
		log.debug("persisting TransfereeCompany instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(TransfereeCompany instance) {
		log.debug("attaching dirty TransfereeCompany instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TransfereeCompany instance) {
		log.debug("attaching clean TransfereeCompany instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(TransfereeCompany persistentInstance) {
		log.debug("deleting TransfereeCompany instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TransfereeCompany merge(TransfereeCompany detachedInstance) {
		log.debug("merging TransfereeCompany instance");
		try {
			TransfereeCompany result = (TransfereeCompany) sessionFactory.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public TransfereeCompany findById(java.lang.Integer id) {
		log.debug("getting TransfereeCompany instance with id: " + id);
		try {
			TransfereeCompany instance = (TransfereeCompany) sessionFactory.getCurrentSession().get("cn.ac.irsa.landcirculation.TransfereeCompany", id);
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

	public List findByExample(TransfereeCompany instance) {
		log.debug("finding TransfereeCompany instance by example");
		try {
			List results = sessionFactory.getCurrentSession().createCriteria("cn.ac.irsa.landcirculation.TransfereeCompany").add(Example.create(instance)).list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
