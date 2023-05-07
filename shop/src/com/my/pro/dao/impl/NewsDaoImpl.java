package com.my.pro.dao.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.my.pro.base.impl.BaseDaoImpl;
import com.my.pro.dao.NewsDao;
import com.my.pro.model.News;
import com.my.pro.utils.Pager;



@Repository("newsDao")
@SuppressWarnings("unchecked")
public class NewsDaoImpl extends BaseDaoImpl<News>  implements NewsDao{

	public Pager<News> list() {
		String hql = "from News order by createTime desc";
		return findByAlias(hql, null);
	}

	public Pager<News> listByTitle(String title) {
		// TODO Auto-generated method stub
		String hql = "from News where title like :title order by createTime desc";
		Map<String,Object> alias = new HashMap<String,Object>();
		alias.put("title", "%" + title + "%");
		return findByAlias(hql, alias);
	}

	@Override
	public List<News> list2(int i) {
		String hql="from News  where type= :type  and fbzt = 1 order by id desc ";
		Query createQuery = getSession().createQuery(hql);
		createQuery.setParameter("type", i);
		createQuery.setFirstResult(0);
		createQuery.setMaxResults(6);
		return createQuery.list();
	}

}
