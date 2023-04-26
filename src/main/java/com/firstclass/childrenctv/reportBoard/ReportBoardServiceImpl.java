package com.firstclass.childrenctv.reportBoard;

import java.util.List;

import com.firstclass.childrenctv.ChildBoard.ChildBoardMapper;
import com.firstclass.childrenctv.ChildBoard.ChildBoardVO;
import com.firstclass.childrenctv.familyRelation.FamilyRelationService;
import com.firstclass.childrenctv.familyRelation.FamilyRelationVO;
import com.firstclass.childrenctv.user.UserMapper;
import com.firstclass.childrenctv.user.UserVO;
import com.firstclass.childrenctv.util.email.GmailService;
import com.firstclass.childrenctv.util.email.MailText;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReportBoardServiceImpl implements ReportBoardService {

	private ReportBoardMapper mapper;
	private final FamilyRelationService familyRelationService;
	private final UserMapper userMapper;
	private final ChildBoardMapper childBoardMapper;
	private final GmailService gmailService;

	@Override
	public void insert(ReportBoardVO board) {// 제보 글 등록
		
		mapper.insert(board);
		System.out.println("report_id는?" + board.getReport_id());
		notify(board.getReport_id(), board.getChild_id());
	}

	private void notify(Long report_id, Long child_id){
		List<FamilyRelationVO> list = familyRelationService.findRelationByChild(child_id);
		ChildBoardVO child = childBoardMapper.getChildId(child_id);
		for(FamilyRelationVO vo : list){
			try {
				UserVO user = userMapper.findById(vo.getUser_id());
				gmailService.send(user.getUser_email(),"[CCTV] 회원님의 실종 아동에 대한 제보가 들어왔습니다."
						,MailText.getReportNotification(user.getUser_name(),child.getChild_name(), "localhost:8080/reportBoard/get?report_id="+report_id));
			}catch (Exception e){
				e.printStackTrace();
			}
		}
	}
	@Override
	public void update(ReportBoardVO board) {		//제보 글 수정
		mapper.update(board);
	}

	@Override
	public ReportBoardVO get(Long report_id) {		//제보 상세 글 보기
		
		return mapper.get(report_id);
	}

	@Override
	public List<ReportBoardVO> getByChild(Long child_id) {		//실종 아동별 제보 글 보기
		
		return mapper.getByChild(child_id);
	}

	@Override
	public List<ReportBoardVO> getByUser(String user_loginId) {		//작성자별 제보 글 보기
		
		return mapper.getByUser(user_loginId);
	}
	
	@Override
	public void deleteReportBoard(Long report_id) {		//제보 글 삭제
		
		mapper.deleteReportBoard(report_id);
	}
	

}
