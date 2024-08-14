package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.semi.forever404.model.vo.BigGroup;
import com.semi.forever404.model.vo.BigSchedule;
import com.semi.forever404.model.vo.SmallGroup;

@Mapper
public interface GroupMapper {
	void addGroup(BigGroup bigGroup);
	BigGroup searchBgCode(String groupName);
	List<BigGroup> userGroup();
	List<SmallGroup> allInfoGroup(String id);
	void addSmGroup(SmallGroup smallGroup);
	void scheduleAdd(BigSchedule bgs);
}
