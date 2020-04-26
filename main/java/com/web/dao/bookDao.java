package com.web.dao;


import java.util.List;


import com.web.entity.book;

public interface bookDao {
	 //根据用户ID查询识别书的信息--存在多条
    List<book> select(Long UserID);
    //根据书籍ID查询识别书的信息--单条
    book selectById(Long BookId);
    //根据用户ID和书名查询识别书的信息
    List<book> selectByUserIDAndbookname(Long UserID,String bookname);
    //更新书籍信息
    boolean UpdataBook(book book);
    //保存书籍信息
    boolean saveBook(book book) ;
    //通过url查询book   -刘俊
    book selectByurl(String url);
    List<book> selectByBookBelonging(Long bookbelonging);
    List<book> selectByBookBelongingNotIn();///查询已经分配给用户的函数
    List<book> selectBymoneyflag(Integer moneyflag);///根据书是否在等待到钱的标志，查
}
