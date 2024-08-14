package mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ServiceMapper {
	void addInfo(String type, String title, String addr, String lat, String lng, String phone, String url);
}
