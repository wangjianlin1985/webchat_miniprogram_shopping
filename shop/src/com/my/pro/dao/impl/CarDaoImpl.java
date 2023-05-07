package com.my.pro.dao.impl;
/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2017年04月14日 21时44分15秒
 */
import org.springframework.stereotype.Repository;
import com.my.pro.model.Car;
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
 * @date 2015年12月24日 下午1:46:33 - 2017年04月14日 21时44分15秒
 */

@Repository
public class CarDaoImpl extends BaseDaoImpl<Car> implements CarDao{
	
 /**
  * 分页查询
  */
	@Override
	public Pager<Car> findPager(Car car) {
		if(car.getId() !=null && !"".equals(car.getId() )){
	    	   String hql = "from Car";
	    	   Map<String,Object> alias = new HashMap<String,Object>();
	   		   alias.put("1", "%" +car.getId()+ "%" );
	   		  return findByAlias(hql, alias);
	       }else{
	    	   String hql = "from Car where 1=1 order by id desc ";
				return findByAlias(hql, null);
	       }
	}
	
}
