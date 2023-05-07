package com.my.pro.service;

import java.util.List;

import com.my.pro.model.News;
import com.my.pro.utils.Pager;




public interface NewsService  extends BaseService<News>{

	Pager<News> list(String title);

	void add(News news);

	News load(News news);

	void update(News news);

	void del(News news);

	void addInfo(News news);

	List<News> list2(int i);

}
