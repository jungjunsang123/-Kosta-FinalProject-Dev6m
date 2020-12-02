package org.kosta.watflix.model.service;


import java.util.List;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.ContentsMapper;
import org.kosta.watflix.model.vo.ContentsListVO;
import org.kosta.watflix.model.vo.ContentsVO;
import org.kosta.watflix.model.vo.GenreVO;
import org.springframework.stereotype.Service;

@Service
public class ContentsServiceImpl implements ContentsService {
	
	@Resource
	ContentsMapper contentsMapper;
	
	//컨텐츠 총 개수
		@Override
		public int sGetTotalContentsCount() {
			return contentsMapper.mGetTotalContentsCount();
		}
	
	//모든 컨텐츠 리스트
	@Override
	public ContentsListVO sGetAllContentsList(PagingBean pagingBean) {
		return new ContentsListVO(contentsMapper.mGetAllContentsList(pagingBean), pagingBean);
	}
	
	//특정 타입의 컨텐츠 총 개수
	@Override
	public int sGetTotalContentsCountForType(String contentsType) {
		return contentsMapper.mGetTotalContentsCountForType(contentsType);
	}
	
	//특정 타입의 컨텐츠 리스트
	@Override
	public ContentsListVO sGetAllContentsListForType(PagingBean pagingBean) {
		return new ContentsListVO(contentsMapper.mGetAllContentsListForType(pagingBean), pagingBean);
	}

	//조회수 높은순
	@Override
	public List<ContentsVO> sContentsHighHits() {
		return contentsMapper.mContentsHighHits();
	}

	//평점 높은순
	@Override
	public List<ContentsVO> sContentsHighAvgStars() {
		return contentsMapper.mContentsHighAvgStars();
	}

	//장르 출력 리스트
	@Override
	public List<GenreVO> sGetAllGenreList() {
		return contentsMapper.mGetAllGenreList();
	}
}
