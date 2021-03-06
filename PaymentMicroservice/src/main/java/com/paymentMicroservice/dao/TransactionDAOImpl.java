package com.paymentMicroservice.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import com.paymentMicroservice.domain.Transaction;
import com.paymentMicroservice.rm.TransactionRowMapper;

/**
 * This class extends the baseDAO and implements TransactionDAO
 * Contains the implementation of various methods of TransactionDAO Interface
 * @author vijetaagrawal
 *
 */

@Repository
public class TransactionDAOImpl extends BaseDAO implements TransactionDAO {

	@Override
	public void save(Transaction t, Integer acc_id, Integer app_id, Integer UserId, String AppName) {
		t.setAccId(acc_id);
		t.setAppId(app_id);
		t.setUserId(UserId);
		t.setApp_name(AppName);
		
		String sql = "INSERT INTO transaction(appId, accId, userId, app_name)"
                + " VALUES(:appId, :accId, :userId, :app_name)";
		Map m = new HashMap();
		m.put("appId", t.getAppId());
		m.put("accId", t.getAccId());
		m.put("userId", t.getUserId());	
		m.put("app_name", t.getApp_name());
		
		
		 KeyHolder kh = new GeneratedKeyHolder();
	        SqlParameterSource ps = new MapSqlParameterSource(m);
	        super.getNamedParameterJdbcTemplate().update(sql, ps, kh);
	        Integer trans_id = kh.getKey().intValue();
	        t.setTrans_id(trans_id);		
	}

	@Override
	public void update(Transaction t) {	
	}

	@Override
	public void delete(Transaction t) {
		this.delete(t.getTrans_id());
		
	}

	@Override
	public void delete(Integer trans_id) {
		String sql="DELETE FROM transaction WHERE trans_id=?";
        getJdbcTemplate().update(sql, trans_id);		
	}

	@Override
	public Transaction findById(Integer trans_id) {
		String sql = "SELECT trans_id, accId, appId, userId, app_name FROM transaction WHERE trans_id=?";
		Transaction t = getJdbcTemplate().queryForObject(sql, new TransactionRowMapper(), trans_id);
		return t;
	}

	@Override
	public List<Transaction> findByProperty(String propName, Object propValue) {
		String sql = "SELECT trans_id, accId, appId, userId, app_name FROM transaction WHERE "+propName+"=?";
		return getJdbcTemplate().query(sql, new TransactionRowMapper(), propValue);
		
	}

	@Override
	public List<Transaction> findAll() {
		String sql = "SELECT trans_id, accId, appId, userId, app_name FROM transaction";
		return getJdbcTemplate().query(sql, new TransactionRowMapper());
	}

}
