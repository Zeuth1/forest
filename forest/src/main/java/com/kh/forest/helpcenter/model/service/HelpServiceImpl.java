package com.kh.forest.helpcenter.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.kh.forest.helpcenter.model.dao.HelpDao;
import com.kh.forest.helpcenter.model.exception.HelpException;
import com.kh.forest.helpcenter.model.vo.Commentary;
import com.kh.forest.helpcenter.model.vo.Notice;
import com.kh.forest.helpcenter.model.vo.PageInfo;
import com.kh.forest.helpcenter.model.vo.SearchCondition;

// 서비스 클래스의 역할
// 트랜잭션 처리


@Service
public class HelpServiceImpl implements HelpService {

	@Autowired
	private DataSourceTransactionManager transactionManager;

	@Autowired
	private HelpDao hd;

	// 컨넥션 주입 = sqlSession 주입 (insert, update, delete인 경우만 트랜잭션 처리해서 주입하는듯)
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int getHelpSearchResultListCount(SearchCondition sc) throws HelpException {
		int result = 0;

		result = hd.getHelpSearchResultListCount(sc);

		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def);

		if (result > 0) {
			transactionManager.commit(status);

		} else {
			transactionManager.rollback(status);
			throw new HelpException("검색 실패");
		}

		return result;
	}

	@Override
	public ArrayList<Notice> searchHelpResultList(SearchCondition sc, PageInfo pi) throws HelpException {
		return hd.getHelpSearchResultList(sc, pi);
	}

	// insert(Dao에서 트랜잭션 처리)
	@Override
	public ArrayList<Commentary> insertCommentary(Commentary reply) throws HelpException {
		return hd.insertCommentary(reply);
	}

	// insert
	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int getHelpListCount() throws HelpException {
		int result = 0;

		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def);

		result = hd.getHelpListCount();

		if (result > 0) {
			transactionManager.commit(status);

		} else {
			transactionManager.rollback(status);
			throw new HelpException("목록 개수 조회 실패");
		}

		return result;

	}

	// insert
	@Override
	public int insertHelp(Notice notice) throws HelpException {
		int result = 0;

		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def);

		result = hd.insertHelp(sqlSession, notice);

		if (result > 0) {
			transactionManager.commit(status);

		} else {
			transactionManager.rollback(status);
			throw new HelpException("사용자 정의 예외");
		}

		return result;
	}

	@Override
	public ArrayList<Notice> recoverHelpList(PageInfo pi) throws HelpException {
		return hd.recoverHelpList(pi);
	}

	@Override
	public ArrayList<Notice> helpDetailSelectList(Notice notice) throws HelpException {
		return hd.helpDetailSelectList(notice);
	}

	@Override
	public Notice comparePassword(Notice notice) throws HelpException {
		return hd.comparePassword(notice);
	}

	@Override
	public ArrayList<Notice> updateDetailSelectList(Notice notice) throws HelpException {
		return hd.updateDetailSelectList(notice);
	}

	@Override
	public int updateDetailComplete(Notice notice) {
		int result = 0;

		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def);
		
		result = hd.updateDetailComplete(notice);

		if (result > 0) {
			transactionManager.commit(status);

		} else {
			transactionManager.rollback(status);
		}

		return result;
		
		
	}

	@Override
	public int deleteDetail(Notice notice) {
		int result = 0;

		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def);
		
		result = hd.deleteDetail(notice);

		if (result > 0) {
			transactionManager.commit(status);

		} else {
			transactionManager.rollback(status);
		}

		return result;
	}

}
