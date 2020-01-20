package co.wangming.crud.crudrestful.mapper

import co.wangming.crud.crudrestful.model.HelloWorld
import org.apache.ibatis.annotations.Mapper
import org.apache.ibatis.annotations.Select

/**
 *
 * Created By WangMing On 2019-12-10
 **/
@Mapper
interface HelloWorldMapper {

    @Select("select * from helloworld")
    fun selectAll(): List<HelloWorld>?
}