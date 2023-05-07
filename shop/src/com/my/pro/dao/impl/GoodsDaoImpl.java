package com.my.pro.dao.impl;
import org.hibernate.Query;
/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2017年04月14日 21时44分16秒
 */
import org.springframework.stereotype.Repository;
import com.my.pro.model.Goods;
import com.my.pro.utils.Pager;
import com.my.pro.base.impl.BaseDaoImpl;
import java.util.*;

import com.my.pro.model.*;
import com.my.pro.dao.*;
import com.my.pro.service.*;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2017年04月14日 21时44分16秒
 */

@Repository
public class GoodsDaoImpl extends BaseDaoImpl<Goods> implements GoodsDao{
	
 /**
  * 分页查询
  */
	@Override
	public Pager<Goods> findPager(Goods goods) {
		if(goods.getId() !=null && !"".equals(goods.getId() )){
	    	   String hql = "from Goods";
	    	   Map<String,Object> alias = new HashMap<String,Object>();
	   		   alias.put("1", "%" +goods.getId()+ "%" );
	   		  return findByAlias(hql, alias);
	       }else{
	    	   String hql = "from Goods where 1=1 order by id desc ";
				return findByAlias(hql, null);
	       }
	}

@Override
public List<Goods> list2() {
	// TODO Auto-generated method stub
	 String hql = "from Goods where isDelete = 0 order by id desc";
	 Query createQuery = this.getSession().createQuery(hql);
	 createQuery.setFirstResult(0);
	 createQuery.setMaxResults(20);
	return createQuery.list();
}
	
}
