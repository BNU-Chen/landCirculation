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
 * Home object for domain model class ApplypostResponse.
 * @see cn.ac.irsa.landcirculation.ApplypostResponse
 * @author Hibernate Tools
 */
public class ApplypostResponseHome {

	private static final Log		log				= LogFactory.getLog(ApplypostResponseHome.class);

	private final SessionFactory	sessionFactory	= getSessionFactory();

	protected SessionFactory getSessionFactory() {
		try {
			return (SessionFactory) new InitialContext().lookup("SessionFactory");
		} catch (Exception e) {
			log.error("Could not locate SessionFactory in JNDI", e);
			throw new IllegalStateException("Could not locate SessionFactory in JNDI");
		}
	}

	public void persist(ApplypostResponse transientInstance) {
		log.debug("persisting ApplypostResponse instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(ApplypostResponse instance) {
		log.debug("attaching dirty ApplypostResponse instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(ApplypostResponse instance) {
		log.debug("attaching clean ApplypostResponse instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(ApplypostResponse persistentInstance) {
		log.debug("deleting ApplypostResponse instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public ApplypostResponse merge(ApplypostResponse detachedInstance) {
		log.debug("merging ApplypostResponse instance");
		try {
			ApplypostResponse result = (ApplypostResponse) sessionFactory.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public ApplypostResponse findById(java.lang.Integer id) {
		log.debug("getting ApplypostResponse instance with id: " + id);
		try {
			ApplypostResponse instance = (ApplypostResponse) sessionFactory.getCurrentSession().get("cn.ac.irsa.landcirculation.ApplypostResponse", id);
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

	public List findByExample(ApplypostResponse instance) {
		log.debug("finding ApplypostResponse instance by example");
		try {
			List results = sessionFactory.getCurrentSession().createCriteria("cn.ac.irsa.landcirculation.ApplypostResponse").add(Example.create(instance)).list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
