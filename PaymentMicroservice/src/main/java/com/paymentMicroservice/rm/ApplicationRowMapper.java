package com.paymentMicroservice.rm;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.paymentMicroservice.domain.Application;

/**
 * RowMapper class for the Application
 * @author vijetaagrawal
 *
 */

public class ApplicationRowMapper implements RowMapper<Application> {

	public Application mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		Application a = new Application();
		a.setApp_id(rs.getInt("app_id"));
        a.setName(rs.getString("name"));
		a.setUserId(rs.getInt("userId"));
		a.setAppDesc("appDescription");
		a.setImageLocation("imageLocation");
        return a;
		
	}

}
