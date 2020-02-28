package kr.pren.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import kr.pren.util.IbatisUtil;
import kr.pren.vo.Review;

public class ReviewDao {
	private static ReviewDao instance = new ReviewDao();
	private ReviewDao() {}
	public static  ReviewDao getInstance() {
		return instance;
	}
	
	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();
	
	// 리뷰 입력하기
	public void insertReview (Review review) throws SQLException {
		sqlmap.insert("reviews.insertReview", review);
	}
	
	// 리뷰번호로 리뷰조회하기
	public Review getReviewByNo (int reviewNo) throws SQLException {
		return (Review) sqlmap.queryForObject("reviews.getReviewByNo", reviewNo);
	}
	
	// 상품번호로 리뷰 조회하기
	@SuppressWarnings("unchecked")
	public List<Review> getReviewByItemNo (int productNo) throws SQLException {
		return sqlmap.queryForList("reviews.getReviewByItemNo", productNo);
	}
	
	// 상품번호에 해당하는 리뷰 개수 조회하기
	public int getReviewCountByItemNo (int productNo) throws SQLException {
		return (Integer) sqlmap.queryForObject("reviews.getReviewCountByItemNo", productNo);
	}
	
	// 상품번호에 해당하는 리뷰점수의 총합
	public double getTotalStarScoreAvg (int productNo) throws SQLException {
		return (double) sqlmap.queryForObject("reviews.getTotalStarScoreAvg", productNo);
	}
	
	// 리뷰 페이징넣기
	@SuppressWarnings("unchecked")
	public List<Review> getReviewsIsPaging (Map<String, Object> param) throws SQLException {
		return sqlmap.queryForList("reviews.getReviewsIsPaging", param);
	}
	
	// 리뷰 하나 삭제하기
	public void deleteReview (int reviewNo) throws SQLException {
		sqlmap.delete("reviews.deleteReview", reviewNo);
	}
	
	// 리뷰 전체 삭제하기
	public void deleteAllReview (int productNo) throws SQLException {
		sqlmap.delete("reviews.deleteAllReview", productNo);
	}
	
	// 리뷰 수정하기
	public void updateReview (Review review) throws SQLException {
		sqlmap.update("reviews.updateReview", review);
	}
}
