/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2017年04月14日 21时44分16秒
 */
package com.my.pro.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.my.pro.model.Dd;
import com.my.pro.utils.Pager;
import com.my.pro.service.DdService;
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

@Service("ddServiceImpl")
public class DdServiceImpl extends BaseServiceImpl<Dd> implements DdService{
	 
	@Autowired
	private DdDao ddDao;
	/**
	 * dao分页查询
	 * @param user
	 * @return
	 */
	@Override
	public Pager<Dd> findPager(Dd dd) {
		return ddDao.findPager(dd);
	}
	

	

}
