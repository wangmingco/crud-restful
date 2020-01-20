package co.wangming.crud.crudrestful.controller

import co.wangming.crud.crudrestful.mapper.HelloWorldMapper
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

/**
 *
 * Created By WangMing On 2019-12-10
 **/
@RestController
@RequestMapping("/")
class HelloworldController(@Autowired val helloWorldMapper: HelloWorldMapper) {

    @GetMapping("/helloworld")
    fun helloworld() : String {

        return "welcome"
    }

    @GetMapping("/selectAll")
    fun selectAll() : String {

        return helloWorldMapper.selectAll().toString()
    }
}