package org.kosta.watflix;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.watflix.model.mapper.ReviewMapper;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.service.ReviewService;
import org.kosta.watflix.model.vo.ContentsVO;
import org.kosta.watflix.model.vo.GenreVO;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.ReviewListVO;
import org.kosta.watflix.model.vo.ReviewVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class SungsikTestJUnit {
	@Resource
	private ReviewService reviewService;
	@Resource
	private ReviewMapper reviewMapper;
	
	@Test
	public void reviewUnitTest() {
		//총 리뷰 수 >> 테스트 당시 1 나옴으로 정상 
/*		int totalReviewCount=reviewMapper.mGetTotalReviewCount();
		System.out.println(totalReviewCount);
*/
		
		//리뷰 리스트
/*		int totalCount=reviewMapper.mGetTotalReviewCount();
		PagingBean pagingBean = new PagingBean(totalCount);
		List<ReviewVO> reviewList = reviewMapper.mGetReviewList(pagingBean);
		for(ReviewVO reviewVO:reviewList)
			System.out.println(reviewVO);
		*/
/*		
//		//리뷰등록 테스트 >> 테스트 정상 작동
		MemberVO memberVO = new MemberVO();
		memberVO.setId("a");
//		memberVO.setPassword("1");
//		memberVO.setName("깡상");
//		memberVO.setEmail("gmail");
		ContentsVO contentsVO = new ContentsVO();
		contentsVO.setContentsNo("81171201");
		ReviewVO reviewVO=new ReviewVO();
		reviewVO.setReviewNo(1);
		reviewVO.setMemberVO(memberVO);
		reviewVO.setContentsVO(contentsVO);
		reviewVO.setReviewTitle("Test");
		reviewVO.setReviewContents("테스트중입니다.");
		reviewMapper.mReviewWrite(reviewVO);
//		
 */
		//리뷰등록 테스트 2>> 테스트 정상 작동
/*		MemberVO memberVO2 = new MemberVO();/		memberVO2.setId("b");
		ContentsVO contentsVO2 = new ContentsVO();
		contentsVO2.setContentsNo("81171201");
		ReviewVO reviewVO2=new ReviewVO();
		reviewVO2.setMemberVO(memberVO2);				v
		reviewVO2.setContentsVO(contentsVO2);			v
		reviewVO2.setReviewTitle("Test1");				v
		reviewVO2.setReviewContents("테스트중입니다.");		v
		reviewMapper.mReviewWrite(reviewVO2);
		*/
		//리뷰등록 테스트3
		for(int i = 0; i<40; i++) {
			ReviewVO reviewVO = new ReviewVO();
			reviewVO.setReviewTitle("TestReview"+i);
			reviewVO.setReviewContents("리뷰콘텐츠테스트"+i);
			MemberVO memberVO = new MemberVO();
			memberVO.setId("java");
			memberVO.setPassword("$2a$10");
			memberVO.setName("앵앵앵");
			memberVO.setEmail("gmail");
			reviewVO.setMemberVO(memberVO);
			ContentsVO contentsVO = new ContentsVO();
			contentsVO.setContentsNo("80204465");
			contentsVO.setContentsTitle("프로젝트 파워");
			contentsVO.setContentsType("액션 & 어드벤처");
			reviewVO.setContentsVO(contentsVO);
			GenreVO genreVO=new GenreVO();
			genreVO.setGenreCode("1568");
			contentsVO.setGenreVO(genreVO);
			contentsVO.setContentsSummary("소령이라 불리는 남자, 10대 소녀, 경찰. 이들이 뉴올리언스에서 얽힌다. 5분간 초능력을 발휘할 수 있는 약. 도시 전체를 혼돈에 빠트린 파워의 출처를 뒤쫓으면서.");
			contentsVO.setContentsSmallThumbnail("resources\\contents\\80204465\\S_프로젝트 파워.jpg");
			contentsVO.setContentsBigThumbnail("resources\\contents\\80204465\\B_프로젝트 파워.jpg ");
			reviewMapper.mReviewWrite(reviewVO);
			
			ReviewVO reviewVO2 = new ReviewVO();
			reviewVO2.setReviewTitle("TestReview"+i);
			reviewVO2.setReviewContents("리뷰콘텐츠테스트"+i);
			MemberVO memberVO2 = new MemberVO();
			memberVO2.setId("java");
			memberVO2.setPassword("$2a$10");
			memberVO2.setName("앵앵앵");
			memberVO2.setEmail("gmail");
			reviewVO2.setMemberVO(memberVO2);
			ContentsVO contentsVO2 = new ContentsVO();
			contentsVO2.setContentsNo("81171201");
			contentsVO2.setContentsTitle("블러드 샷");
			contentsVO2.setContentsType("SF & 판타지");
			reviewVO2.setContentsVO(contentsVO2);
			GenreVO genreVO2=new GenreVO();
			genreVO2.setGenreCode("1568");
			contentsVO2.setGenreVO(genreVO);
			contentsVO2.setContentsSummary("특수 부대원 레이, 아내와 휴가를 보내던 중 납치당해 아내와 함께 살해당한다. 그리고 죽음에서 부활한다. 최첨단 프로젝트 아래 놀라운 복원력과 힘을 장착한 슈퍼히어로가 되어서. 그때 떠오른 기억. 아내를 죽인 자를 찾아야 한다!");
			contentsVO2.setContentsSmallThumbnail("resources\\contents\\81171201\\S_블러드 샷.jpg");
			contentsVO2.setContentsBigThumbnail("resources\\contents\\81171201\\B_블러드 샷.jpg");
			reviewMapper.mReviewWrite(reviewVO2);
			
			System.out.println("review table에 insert한다 뭐를? " + reviewVO);
			System.out.println("리뷰 table에 insert한다 뭐를? " + reviewVO2);
			System.out.println(reviewMapper.mGetTotalReviewCount());	
		}

		int reviewTotalCountByContentsNo = reviewMapper.mGetContentsReviewCount("70297757");
		PagingBean pagingBean = null;
		String pageNo="";
		
		if(pageNo == null) {
			int contentNumberPerPage=10;
			int pageNumberPerPageGroup=5;
			pagingBean = new PagingBean(reviewTotalCountByContentsNo,contentNumberPerPage,pageNumberPerPageGroup);
		}
		else {
			pageNo="1";
			int contentNumberPerPage=10;
			int pageNumberPerPageGroup=5;
			pagingBean = new PagingBean(reviewTotalCountByContentsNo,contentNumberPerPage,pageNumberPerPageGroup,Integer.parseInt(pageNo));
		}
		System.out.println(pagingBean);
		System.out.println(reviewMapper.mGetReviewListByContentsNo(pagingBean, "70297757"));
		
		//리뷰 상세보기
//		System.out.println(reviewMapper.mGetReviewDetail(8));
		
		//리뷰수정
/*		System.out.println(reviewMapper.mGetReviewDetail(8));		//리뷰 수정 전
		ReviewVO reviewVO = reviewService.sGetReviewDetailNoHits(8);
		reviewVO.setReviewTitle("깨랑까랑");
		reviewVO.setReviewContents("경영이형 축지법 알려줭");
		reviewMapper.mReviewUpdate(reviewVO);
		System.out.println(reviewMapper.mGetReviewDetail(8));		//리뷰 수정 후 		
*/
		//리뷰삭제
/*		int reviewNo=8;
		reviewMapper.mReviewDelete(reviewNo);
		System.out.println(reviewMapper.mGetReviewDetail(reviewNo));
	*/	
		//리뷰 조회수 증가
/*		System.out.println(reviewMapper.mGetReviewDetail(16).getReviewHits());	//조회수 증가 전
		reviewMapper.mReviewHitsUpdate(16);
		System.out.println(reviewMapper.mGetReviewDetail(16).getReviewHits());	//죄호수 증가 후 
		ReviewListVO vo = reviewService.sGetReviewList("1");
		for(ReviewVO rao :vo.getReviewList()) {
			System.out.println(rao);
		}*/
	}
}
	
