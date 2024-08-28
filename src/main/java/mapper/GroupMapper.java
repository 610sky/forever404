package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.semi.forever404.model.vo.BigGroup;
import com.semi.forever404.model.vo.BigSchedule;
import com.semi.forever404.model.vo.Money;
import com.semi.forever404.model.vo.Photo;
import com.semi.forever404.model.vo.SmallGroup;
import com.semi.forever404.model.vo.SmallSchedule;

@Mapper
public interface GroupMapper {
	void addGroup(BigGroup bigGroup);
	BigGroup searchBgCode(String groupName);
	List<BigGroup> userGroup();
	
	//smallgroup select
	List<SmallGroup> selectSmallGroup(String id);
	
	List<SmallGroup> allInfoGroup(String id);
	void addSmGroup(SmallGroup smallGroup);
	void scheduleAdd(BigSchedule bgs);
	void scheduleAdd2(SmallSchedule sgs);
	List<BigSchedule> searchBsCode(int num);
	List<BigSchedule> selectBg(BigSchedule bs);
	List<SmallSchedule> selectSc(BigSchedule bs);
	List<SmallSchedule> selectOneSc(int num);
	BigSchedule selectOneBs(int num);
	List<Money> selectMoney(int num);
	void insertMoney(Money money);
	
	//그룹 삭제
	void deleteGroup1 (int num);
	void deleteGroup2 (int num);
	void deleteGroup3 (int num);
	void deleteGroup4 (int num);
	void deleteGroup5 (int num);
	
	//이미지 추가 및 선택
	void imgLoad (Photo photo); //추가
	List<Photo> selectMyImg (int num); //선택
	List<Map<String, Object>> getDatesList (Map<String, Object> paramMap);
	Map<String, Object> getDateRange(int bsCode);
}
