package com.my.pro.dao;


import java.util.List;

import com.my.pro.base.BaseDao;
import com.my.pro.model.News;
import com.my.pro.utils.Pager;


public interface NewsDao extends BaseDao<News>{

	Pager<News> list();

	Pager<News> listByTitle(String title);

	List<News> list2(int i);

}
