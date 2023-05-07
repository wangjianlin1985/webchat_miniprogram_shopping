package com.my.pro.service;

import com.my.pro.model.Car;
import com.my.pro.utils.Pager;
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
public interface CarService extends BaseService<Car>{

	/**
	 * dao层分页查询
	 */
	Pager<Car> findPager(Car car);

	void delete2(Integer id);
}
