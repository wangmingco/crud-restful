package co.wangming.crud.crudrestful.mapper;

import co.wangming.crud.crudrestful.model.HelloWorld;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created By WangMing On 2020-01-20
 **/
@Mapper
public interface HelloWorldMapper {

    @Select("select * from helloworld")
    List<HelloWorld> selectAll();

}
