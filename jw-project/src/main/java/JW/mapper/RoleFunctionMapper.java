package JW.mapper;

import JW.pojo.RoleFunctionExample;
import JW.pojo.RoleFunctionKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RoleFunctionMapper {
    int countByExample(RoleFunctionExample example);

    int deleteByExample(RoleFunctionExample example);

    int deleteByPrimaryKey(RoleFunctionKey key);

    int insert(RoleFunctionKey record);

    int insertSelective(RoleFunctionKey record);

    List<RoleFunctionKey> selectByExample(RoleFunctionExample example);

    int updateByExampleSelective(@Param("record") RoleFunctionKey record, @Param("example") RoleFunctionExample example);

    int updateByExample(@Param("record") RoleFunctionKey record, @Param("example") RoleFunctionExample example);
}