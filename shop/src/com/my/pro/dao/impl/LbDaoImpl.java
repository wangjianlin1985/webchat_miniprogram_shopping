package com.my.pro.dao.impl;
/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2017年04月14日 21时44分16秒
 */
import org.springframework.stereotype.Repository;
import com.my.pro.model.Lb;
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
public class LbDaoImpl extends BaseDaoImpl<Lb> implements LbDao{
	
 /**
  * 分页查询
  */
	@Override
	public Pager<Lb> findPager(Lb lb) {
		if(lb.getId() !=null && !"".equals(lb.getId() )){
	    	   String hql = "from Lb";
	    	   Map<String,Object> alias = new HashMap<String,Object>();
	   		   alias.put("1", "%" +lb.getId()+ "%" );
	   		  return findByAlias(hql, alias);
	       }else{
	    	   String hql = "from Lb where 1=1 order by id desc ";
				return findByAlias(hql, null);
	       }
	}
	
}
