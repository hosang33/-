package kr.pren.test.dao;

import java.sql.SQLException;

import org.junit.Assert;
import org.junit.Test;

import kr.pren.dao.MessageDao;
import kr.pren.vo.Message;

public class MessageDaoTest {

	@Test
	public void testGetMessageByNo() {
		MessageDao messagedao = MessageDao.getInstance();
		
		try {
		Message message = messagedao.getMessageByNo(101);
		Assert.assertEquals("거래전", message.getSellState());
		
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
