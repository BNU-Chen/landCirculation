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
 * Home object for domain model class Rtnmsgdef.
 * @see cn.ac.irsa.landcirculation.Rtnmsgdef
 * @author Hibernate Tools
 */
public class RtnmsgdefHome {

	private static final Log		log				= LogFactory.getLog(RtnmsgdefHome.class);

	private final SessionFactory	sessionFactory	= getSessionFactory();

	protected SessionFactory getSessionFactory() {
		try {
			return (SessionFactory) new InitialContext().lookup("SessionFactory");
		} catch (Exception e) {
			log.error("Could not locate SessionFactory in JNDI", e);
			throw new IllegalStateException("Could not locate SessionFactory in JNDI");
		}
	}

	public void persist(Rtnmsgdef transientInstance) {
		log.debug("persisting Rtnmsgdef instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(Rtnmsgdef instance) {
		log.debug("attaching dirty Rtnmsgdef instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Rtnmsgdef instance) {
		log.debug("attaching clean Rtnmsgdef instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(Rtnmsgdef persistentInstance) {
		log.debug("deleting Rtnmsgdef instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Rtnmsgdef merge(Rtnmsgdef detachedInstance) {
		log.debug("merging Rtnmsgdef instance");
		try {
			Rtnmsgdef result = (Rtnmsgdef) sessionFactory.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Rtnmsgdef findById(java.lang.Integer id) {
		log.debug("getting Rtnmsgdef instance with id: " + id);
		try {
			Rtnmsgdef instance = (Rtnmsgdef) sessionFactory.getCurrentSession().get("cn.ac.irsa.landcirculation.Rtnmsgdef", id);
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

	public List findByExample(Rtnmsgdef instance) {
		log.debug("finding Rtnmsgdef instance by example");
		try {
			List results = sessionFactory.getCurrentSession().createCriteria("cn.ac.irsa.landcirculation.Rtnmsgdef").add(Example.create(instance)).list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
