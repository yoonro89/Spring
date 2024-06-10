package dao;

import java.util.List;

public interface BoardDAO {
	
	int insert(Object obj);
	List selectList();
	int update(Object obj);
	int delete( int idx );
	
}
